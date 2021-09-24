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

describe('SmsMmsUpdataTest', function () {
  const TRUE_SLOT_ID = 0;
  const FALSE_SLOT_ID = 9;
  const CORRECT_SMS_PDU = '01000F9168683106019196F400080A00680065006C006C006F';
  const RECEIVE_SMS_PDU = '240D91689141468496F600001270721142432302B319';
  const RECEIVE_OTHER_SMS_PDU = '240D91689141468496F600001270721174322302B91C';

  beforeAll(async function () {
    // Delete the first 10 SMS messages at each run to ensure the execution of the use case
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

  afterEach(async function () {
    for (let index = 0;index < 10;++index) {
      sms.delSimMessage(TRUE_SLOT_ID, index, (err) => {});
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0100
   * @tc.name     When SLOTID is the wrong value,Failed to update SIM card SMS record
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0100', 0, async function (done) {
    let upData = {
      slotId: FALSE_SLOT_ID,
      msgIndex: 0,
      newStatus: sms.MESSAGE_HAS_BEEN_SENT,
      pdu: CORRECT_SMS_PDU,
      smsc: ''
    };
    sms.updateSimMessage(upData, (err) => {
      if (err) {
        console.log('Telephony_SmsMms_updateSimMessage_Async_0100 update finish');
        done();
        return;
      }
      expect().assertFail();
      console.log('Telephony_SmsMms_updateSimMessage_Async_0100 update fail');
      done();
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0200
   * @tc.name     Example Change the SMS status from MESSAGE_HAVE_READ to MESSAGE_UNREAD,
   *              Update a SIM card SMS record.
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0200', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    let upData = {
      slotId: TRUE_SLOT_ID,
      msgIndex: addIndex,
      newStatus: sms.MESSAGE_UNREAD,
      pdu: RECEIVE_SMS_PDU,
      smsc: ''
    };
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0200 get 1 fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0200 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0200 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0200 add finish ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            expect().assertFail();
            console.log('Telephony_SmsMms_updateSimMessage_Async_0200 update fail');
            done();
            return;
          }
          console.log('Telephony_SmsMms_updateSimMessage_Async_0200 update finish ');
          sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
            if (geterr) {
              expect().assertFail();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0200 fail');
              done();
              return;
            }
            expect(getresult[updataIndex].simMessageStatus ===
                            sms.SMS_SIM_MESSAGE_STATUS_UNREAD).assertTrue();
            console.log('Telephony_SmsMms_updateSimMessage_Async_0200 getAllSimMessages cur finish');
            done();
          });
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0300
   * @tc.name     Example Change the SMS status from MESSAGE_HAVE_READ to MESSAGE_HAS_BEEN_SENT,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0300', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    let upData = {
      slotId: TRUE_SLOT_ID,
      msgIndex: addIndex,
      newStatus: sms.MESSAGE_HAS_BEEN_SENT,
      pdu: RECEIVE_SMS_PDU,
      smsc: ''
    };
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0300 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0300 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0300 fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0300 finish addresult ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_0300 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_0300 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_READ).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0300 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0300 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0400
   * @tc.name     Example Change the SMS status from MESSAGE_HAVE_READ to MESSAGE_NOT_SENT,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0400', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0400 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0400 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_NOT_SENT,
        pdu: RECEIVE_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0400 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0400 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_0400 update finish result');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_0400 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_READ).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0400 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0400 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0500
   * @tc.name     Example Change the SMS status from MESSAGE_UNREAD to MESSAGE_HAVE_READ,
   *              Update a SIM card SMS record.
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0500', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_UNREAD
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0500 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0500 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0500 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0500 finish add result');
        let upData = {
          slotId: TRUE_SLOT_ID,
          msgIndex: addIndex,
          newStatus: sms.MESSAGE_HAVE_READ,
          pdu: RECEIVE_SMS_PDU,
          smsc: ''
        };
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            expect().assertFail();
            console.log('Telephony_SmsMms_updateSimMessage_Async_0500 update fail');
            done();
            return;
          }
          console.log('Telephony_SmsMms_updateSimMessage_Async_0500 update finish result');
          sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
            if (geterr) {
              expect().assertFail();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0500 fail');
              done();
              return;
            }
            expect(getresult[updataIndex].simMessageStatus ===
                            sms.SMS_SIM_MESSAGE_STATUS_READ).assertTrue();
            console.log('Telephony_SmsMms_updateSimMessage_Async_0500 getAllSimMessages cur finish');
            done();
          });
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0600
   * @tc.name     Example Change the SMS status from MESSAGE_UNREAD to MESSAGE_HAS_BEEN_SENT,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0600', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_UNREAD
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0600 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0600 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: RECEIVE_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0600 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0600 finish add result');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_0600 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_UNREAD).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0600 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0600 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0700
   * @tc.name     Example Change the SMS status from MESSAGE_UNREAD to MESSAGE_NOT_SENT,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0700', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_UNREAD
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0700 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0700 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_NOT_SENT,
        pdu: RECEIVE_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0700 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0700 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_0700 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_0700 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_UNREAD).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0700 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0700 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0800
   * @tc.name     Example Change the SMS status from MESSAGE_HAS_BEEN_SENT to MESSAGE_NOT_SENT,
   *              Update a SIM card SMS record.
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0800', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0800 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0800 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_NOT_SENT,
        pdu: CORRECT_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0800 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0800 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            expect().assertFail();
            console.log('Telephony_SmsMms_updateSimMessage_Async_0800 update fail');
            done();
            return;
          }
          console.log('Telephony_SmsMms_updateSimMessage_Async_0800 update finish result');
          sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
            if (geterr) {
              expect().assertFail();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0800 fail');
              done();
              return;
            }
            expect(getresult[updataIndex].simMessageStatus ===
                            sms.SMS_SIM_MESSAGE_STATUS_UNSENT).assertTrue();
            console.log('Telephony_SmsMms_updateSimMessage_Async_0800 getAllSimMessages cur finish');
            done();
          });
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_0900
   * @tc.name     Example Change the SMS status from MESSAGE_HAS_BEEN_SENT to MESSAGE_HAVE_READ,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_0900', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_0900 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_0900 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_HAVE_READ,
        pdu: CORRECT_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0900 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_0900 finish add result finish ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_0900 update finish result');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_0900 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_SENT).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_0900 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_0900 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1000
   * @tc.name     Example Change the SMS status from MESSAGE_HAS_BEEN_SENT to MESSAGE_UNREAD,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1000', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1000 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1000 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_UNREAD,
        pdu: CORRECT_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1000 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1000 finish add result');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1000 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1000 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_SENT).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1000 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1000 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1100
   * @tc.name     Example Change the SMS status from MESSAGE_NOT_SENT to MESSAGE_HAS_BEEN_SENT,
   *              Update a SIM card SMS record.
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1100', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_NOT_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1100 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1100 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: CORRECT_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1100 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1100 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            expect().assertFail();
            console.log('Telephony_SmsMms_updateSimMessage_Async_1100 update fail');
            done();
            return;
          }
          console.log('Telephony_SmsMms_updateSimMessage_Async_1100 update finish result ');
          sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
            if (geterr) {
              expect().assertFail();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1100 fail');
              done();
              return;
            }
            expect(getresult[updataIndex].simMessageStatus ===
                            sms.SMS_SIM_MESSAGE_STATUS_SENT).assertTrue();
            console.log('Telephony_SmsMms_updateSimMessage_Async_1100 getAllSimMessages cur finish');
            done();
          });
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1200
   * @tc.name     Example Change the SMS status from MESSAGE_NOT_SENT to MESSAGE_HAVE_READ,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1200', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_NOT_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1200 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1200 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_HAVE_READ,
        pdu: CORRECT_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1200 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1200 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1200 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1200 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_UNSENT).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1200 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1200 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1300
   * @tc.name     Example Change the SMS status from MESSAGE_NOT_SENT to MESSAGE_UNREAD,
   *              Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1300', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_NOT_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1300 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1300 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: addIndex,
        newStatus: sms.MESSAGE_UNREAD,
        pdu: CORRECT_SMS_PDU,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1300 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1300 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1300 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1300 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].simMessageStatus ===
                                sms.SMS_SIM_MESSAGE_STATUS_UNSENT).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1300 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1300 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1400
   * @tc.name     Set the PDU to empty,Failed to update SIM card SMS record
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1400', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1400 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1400 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = '';
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1400 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1400 finish addresult');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1400 update finish');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1400 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1400 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1400 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1500
   * @tc.name     Set the PDU to chinese,Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1500', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1500 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1500 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = '中文';
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1500 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1500 finish addresult ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1500 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1500 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1500 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1500 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1600
   * @tc.name     Set the PDU to English,Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1600', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1600 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1600 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = 'zsZS';
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1600 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1600 finish add result');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1600 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1600 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1600 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1600 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1700
   * @tc.name     Set the PDU to figure,Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1700', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1700 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1700 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = '1233';
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1700 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1700 finish result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1700 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1700 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1700 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1700 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1800
   * @tc.name     Set the PDU to Special characters,Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1800', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1800 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1800 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = '!@#$%^&*';
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1800 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1800 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1800 update finish updataresult ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1800 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1800 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1800 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_1900
   * @tc.name     Set the PDU to Mixed character,Failed to update the SMS record of the SIM card
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_1900', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_1900 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_1900 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = '122zgGB张三!@#$%^&*';
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1900 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_1900 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_1900 update finish ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_1900 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_1900 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_1900 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_2000
   * @tc.name     The SMS status does not change,
   *              the PDU data type is changed from the sending type to the receiving type,Update failed
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_2000', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_2000 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_2000 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = RECEIVE_OTHER_SMS_PDU;
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAS_BEEN_SENT,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2000 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_2000 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_2000 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_2000 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_2000 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2000 update fail');
          done();
        });
      });
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_2100
   * @tc.name     The SMS status does not change,
   *              Example Change the data type of the PDU from the received type to the sent type,Update failed
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_2100', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_OTHER_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let addIndex = 0;
    let updataIndex = 0;
    let isRecord = false;
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_2100 get fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_2100 getAllSimMessages finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          if (isRecord) {
            updataIndex = index;
            break;
          }
          addIndex = index;
          isRecord = true;
        }
      }
      let index = addIndex;
      let upDataPdu = CORRECT_SMS_PDU;
      let upData = {
        slotId: TRUE_SLOT_ID,
        msgIndex: index,
        newStatus: sms.MESSAGE_HAVE_READ,
        pdu: upDataPdu,
        smsc: ''
      };
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2100 add fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_2100 finish add result ');
        sms.updateSimMessage(upData, (updataerr) => {
          if (updataerr) {
            console.log('Telephony_SmsMms_updateSimMessage_Async_2100 update finish result ');
            sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
              if (geterr) {
                expect().assertFail();
                console.log('Telephony_SmsMms_updateSimMessage_Async_2100 fail');
                done();
                return;
              }
              expect(getresult[updataIndex].shortMessage.pdu.length === 0).assertTrue();
              console.log('Telephony_SmsMms_updateSimMessage_Async_2100 getAllSimMessages cur finish');
            });
            done();
            return;
          }
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2100 update fail');
          done();
        });
      });
    });
  });
});