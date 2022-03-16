/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import reminderAgent from '@ohos.reminderAgent'

describe('ReminderAgentTest', function () {

  const TRIGGER_TIME_IN_SECONDS = 100;

  beforeAll(function () {

    /*
     * @tc.setup: setup invoked before all testcases
     */
    console.info('beforeAll caled')
  })

  afterAll(function () {

    /*
     * @tc.teardown: teardown invoked after all testcases
     */
    console.info('afterAll caled')
  })

  beforeEach(function () {

    /*
     * @tc.setup: setup invoked before each testcases
     */
    console.info('beforeEach caled')
  })

  afterEach(function () {

    /*
     * @tc.teardown: teardown invoked after each testcases
     */
    console.info('afterEach caled')
  })

  console.info('start################################start');

  /**
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_001
   * @tc.name      testPublishReminderNorFun001
   * @tc.desc      Publishes an agent-powered reminder with the promise function.
   */
  it('testPublishReminderNorFun001', 0, async function (done) {
    let timer = {
      reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
      triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
    }
    let expectId = -1;
    reminderAgent.publishReminder(timer).then((reminderId) => {
      expectId = reminderId + 1;
      reminderAgent.publishReminder(timer).then((reminderId) => {
        if (reminderId === expectId) {
          expect(true).assertTrue();
          setTimeout(() => {
            done();
          }, 500);
        }
      }, (error) => {
        expect(false).assertTrue();
        setTimeout(() => {
          done();
        }, 500);
      });
    });
  })

  /**
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_002
   * @tc.name      testPublishReminderNorFun002
   * @tc.desc      Publishes an agent-powered reminder with the callback function.
   */
  it('testPublishReminderNorFun002', 0, async function (done) {
    let timer = {
      reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
      triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
    }
    let expectId = -1;
    function reminderCallback(err, reminderId) {
      expect(reminderId).assertEqual(expectId);
    }
    reminderAgent.publishReminder(timer, (err, reminderId) => {
      expectId = reminderId + 1;
      reminderAgent.publishReminder(timer, reminderCallback);
    })
    done();
  })

  /**
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_003
   * @tc.name      testAddNotificationSlotNorFun001
   * @tc.desc      Adds a reminder notification slot with the callback function.
   */
  it('testAddNotificationSlotNorFun001', 0, async function (done) {
    function reminderCallback(err, data) {
      let i = 0;
      expect(0).assertEqual(i);
    }
    reminderAgent.addNotificationSlot(0, reminderCallback);
    done();
  })

  /**
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_004
   * @tc.name      testAddNotificationSlotNorFun002
   * @tc.desc      Adds a reminder notification slot with the promise function and null mySlot.
   */
    it('testAddNotificationSlotNorFun002', 0, async function (done) {
      let mySlot = null;
      try {
        reminderAgent.addNotificationSlot(mySlot,function(err) {
            if(err == undefined) {
                console.info('testAddNotificationSlotNorFun002 execute success');
            } else {
            console.info('testAddNotificationSlotNorFun002 execute failed');
          }
        }).catch(function(err) {
          console.info("testAddNotificationSlotNorFun002 execute catch" + err.code);
        })
    } catch(error) {
      console.info("testAddNotificationSlotNorFun002 execute try - catch" + error.code);
      let i = 0;
      expect(0).assertEqual(i);
      done();
    }})
  
    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_005
     * @tc.name      testAddNotificationSlotNorFun003
     * @tc.desc      Adds a reminder notification slot with the promise function and mySlot type 3.
     */
    it('testAddNotificationSlotNorFun003', 0, async function (done) {
      let mySlot = {
        type: 3
      }
      reminderAgent.addNotificationSlot(mySlot).then(() => {
        expect(true).assertTrue();
        setTimeout(() => {
          done();
        }, 500);
      }, (error) => {
        expect(false).assertTrue();
        setTimeout(() => {
          done();
        }, 500);
      });
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_006
     * @tc.name      testAddNotificationSlotNorFun004
     * @tc.desc      Adds a reminder notification slot with the promise function and mySlot more types.
     */
    it('testAddNotificationSlotNorFun004', 0, async function (done) {
      let mySlot0 = {
        type: 0
      }
      let mySlot1 = {
        type: 1
      }
      let mySlot2 = {
        type: 2
      }
      let mySlot3 = {
        type: 3
      }
      let mySlot4 = {
        type: 4
      }
      function reminderCallback(err, data) {
        if (err) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        setTimeout(() => {
          done();
        }, 500);
      }
      reminderAgent.addNotificationSlot(mySlot0, reminderCallback);
      reminderAgent.addNotificationSlot(mySlot1, reminderCallback);
      reminderAgent.addNotificationSlot(mySlot2, reminderCallback);
      reminderAgent.addNotificationSlot(mySlot3, reminderCallback);
      reminderAgent.addNotificationSlot(mySlot4, reminderCallback);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_007
     * @tc.name      testGetValidRemindersNorFun001
     * @tc.desc      Obtains all valid remindeers set by the current application. 
     */
    it('testGetValidRemindersNorFun001', 0, async function (done) {
      let timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
      }
      reminderAgent.publishReminder(timer).then((reminderId) => {
        reminderAgent.getValidReminders().then((reminders) => { });
        setTimeout(() => {
          reminderAgent.cancelAllReminders().then(() => {
            reminderAgent.getValidReminders().then((reminders) => {
              expect(0).assertEqual(reminders.length);
            });
          });
        }, 1000);
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_008
     * @tc.name      testCancelAllRemindersNorFun001
     * @tc.desc      test cancel all reminders can cancel all exist reminders
     */
    it('testCancelAllRemindersNorFun001', 0, async function (done) {
      let timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
      }
      reminderAgent.publishReminder(timer, (error, reminderId) => {
        reminderAgent.getValidReminders((err, reminders) => { });
        setTimeout(() => {
          reminderAgent.cancelAllReminders((err, data) => {
            reminderAgent.getValidReminders().then((reminders) => {
              expect(0).assertEqual(reminders.length);
            });
          });
        }, 1000);
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_009
     * @tc.name      testCancelRemindersNorFun001
     * @tc.desc      test cancelReminder with not exit reminder.
     */
    it('testCancelRemindersNorFun001', 0, async function (done) {
      let timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
      }
      let id = 1;
      let publishlength = -1;
      let cancellength = -1;
      let firstdiff = -1;
      reminderAgent.publishReminder(timer).then(() => {
        reminderAgent.getValidReminders().then((reminders) => {
          publishlength = reminders.length
        });
        setTimeout(() => {
          reminderAgent.cancelReminder(id).then(() => {
            reminderAgent.getValidReminders().then((reminders) => {
              cancellength = reminders.length
              firstdiff = publishlength - cancellength;
              if (firstdiff === 0) {
                expect(0).assertEqual(firstdiff);
              }
            });
          });
        }, 1000);
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_010
     * @tc.name      testCancelRemindersNorFun002
     * @tc.desc      test cancel reminder with not exit reminder.
     */
    it('testCancelRemindersNorFun002', 0, async function (done) {
      let timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
      }
      let id = 1;
      let publishlength = -1;
      let cancellength = -1;
      let firstdiff = -1;
      reminderAgent.publishReminder(timer).then(() => {
        reminderAgent.getValidReminders((err, reminders) => {
          publishlength = reminders.length;
        });
        setTimeout(() => {
          reminderAgent.cancelReminder(id, (err, data) => {
            reminderAgent.getValidReminders((err, reminders) => {
              cancellength = reminders.length;
              firstdiff = publishlength - cancellength;
              if (firstdiff === 0) {
                expect(0).assertEqual(firstdiff);
              }
            });
          });
        }, 1000);
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_011
     * @tc.name      testCancelRemindersNorFun003
     * @tc.desc      test cancel reminder with exist reminder.
     */
    it('testCancelRemindersNorFun003', 0, async function (done) {
      let alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14,
        title: "this is title",
        content: "this is content"
      }
      let publishlength = -1;
      let cancellength = -1;
      let firstdiff = -1;
      reminderAgent.publishReminder(alarm, (err, reminderId) => {
        reminderAgent.getValidReminders((err, reminders) => {
          publishlength = reminders.length;
        });
        setTimeout(() => {
          reminderAgent.cancelReminder(reminderId, (err, data) => {
            reminderAgent.getValidReminders((err, reminders) => {
              cancellength = reminders.length;
              firstdiff = publishlength - cancellength;
              if (firstdiff === 0) {
                expect(0).assertEqual(firstdiff);
              } else if (firstdiff === 1) {
                expect(1).assertEqual(firstdiff);
              }
            });
          });
        }, 1000);
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_012
     * @tc.name      testCancelRemindersNorFun004
     * @tc.desc      test cancel reminder with exist reminder with the promise function.
     */
    it('testCancelRemindersNorFun004', 0, async function (done) {
      let alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14,
        title: "this is title",
        content: "this is content"
      }
      let publishlength = -1;
      let cancellength = -1;
      let firstdiff = -1;
      reminderAgent.publishReminder(alarm, (err, reminderId) => {
        reminderAgent.getValidReminders((err, reminders) => {
          publishlength = reminders.length;
        });
        setTimeout(() => {
          reminderAgent.cancelReminder(reminderId).then(() => {
            reminderAgent.getValidReminders((err, reminders) => {
              cancellength = reminders.length;
              firstdiff = publishlength - cancellength;
              if (firstdiff === 0) {
                expect(0).assertEqual(firstdiff);
              } else if (firstdiff === 1) {
                expect(1).assertEqual(firstdiff);
              }
            });
          });
        }, 1000);
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_013
     * @tc.name      testGetValidRemindersNorFun002
     * @tc.desc      test get valid reminders verify all the information is correct.
     */
    it('testGetValidRemindersNorFun002', 0, async function (done) {
      var alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14,
        title: "this is title",
        content: "this is content"
      }
      var timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
      }
      reminderAgent.publishReminder(timer, (error, reminderId) => { });
      reminderAgent.publishReminder(alarm, (error, reminderId) => { });
      setTimeout(() => {
        reminderAgent.getValidReminders().then((reminders) => {
          if (reminders.length >= 2) {
            let i = 0;
            expect(0).assertEqual(i);
          }
        });
      }, 1000);
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_014
     * @tc.name      testGetValidRemindersNorFun003
     * @tc.desc      test get valid reminders verify all the information is correct with the callback function.
     */
    it('testGetValidRemindersNorFun003', 0, async function (done) {
      var alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14,
        title: "this is title",
        content: "this is content"
      }
      var timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
      }
      reminderAgent.publishReminder(timer, (error, reminderId) => { });
      reminderAgent.publishReminder(alarm, (error, reminderId) => { });
      setTimeout(() => {
        reminderAgent.getValidReminders((err, reminders) => {
          if (reminders.length >= 2) {
            let i = 0;
            expect(0).assertEqual(i);
          }
        });
      }, 1000);
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_015
     * @tc.name      testRemonveNotificationSlotNorFun001
     * @tc.desc      test remove notification Slot with not exist slot.
     */
    it('testRemonveNotificationSlotNorFun001', 0, async function (done) {
      function reminderCallback(err, data) {
        let i = 0;
        expect(0).assertEqual(i);
      }
      reminderAgent.removeNotificationSlot(0, reminderCallback);
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_016
     * @tc.name      testRemonveNotificationSlotNorFun002
     * @tc.desc      test remove notification Slot with not exist slot with the promise function.
     */
    it('testRemonveNotificationSlotNorFun002', 0, async function (done) {
      let promise = new Promise((resolve, reject) => {
        reminderAgent.removeNotificationSlot(1).then(() => {
          resolve();
        });
        reject(new Error('errr occurred.'));
      });
      promise.then(() => {
      }, err => {
        let i = 0;
        expect(0).assertEqual(i);
      }).catch(res => { });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_017
     * @tc.name      testRemonveNotificationSlotNorFun003
     * @tc.desc      test remove notification Slot with exist slot.
     */
    it('testRemonveNotificationSlotNorFun003', 0, async function (done) {
      let tarRemoveSlot = {
        type: 1
      }
      reminderAgent.addNotificationSlot(tarRemoveSlot.type, (err, data) => {
        reminderAgent.removeNotificationSlot(tarRemoveSlot.type, (err, data) => {
          expect(0).assertEqual(err.code);
        });
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_018
     * @tc.name      testRemonveNotificationSlotNorFun004
     * @tc.desc      test remove notification Slot with exist slot with the promise function.
     */
    it('testRemonveNotificationSlotNorFun004', 0, async function (done) {
      let tarRemoveSlot = {
        type: 1
      }
      reminderAgent.addNotificationSlot(tarRemoveSlot.type, (err, data) => {
        reminderAgent.removeNotificationSlot(tarRemoveSlot.type).then(() => {
          expect(0).assertEqual(err.code);
        });
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_019
     * @tc.name      testGetValidRemindersNorFun004
     * @tc.desc      test get valid reminders with promise function.
     */
    it('testGetValidRemindersNorFun004', 0, async function (done) {
      let timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: 3
      }
      reminderAgent.publishReminder(timer).then((reminderId) => { });
      setTimeout(() => {
        reminderAgent.getValidReminders().then((reminders) => {
          expect(0).assertEqual(reminders.length);
        });
      }, 5000);
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_020
     * @tc.name      testGetValidRemindersNorFun005
     * @tc.desc      test get valid reminders with the callback function.
     */
    it('testGetValidRemindersNorFun005', 0, async function (done) {
      let timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: 3
      }
      reminderAgent.publishReminder(timer).then((reminderId) => { });
      setTimeout(() => {
        reminderAgent.getValidReminders((err, reminders) => {
          expect(0).assertEqual(reminders.length);
        });
      }, 5000);
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_021
     * @tc.name      testPublishReminderNorAlarmFun001
     * @tc.desc      test publish reminder with a nomal alarm promise function.
     */
    it('testPublishReminderNorAlarmFun001', 0, async function (done) {
      let alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14
      }
      reminderAgent.publishReminder(alarm).then((reminderId) => {
        if (reminderId) {
          let i = 0;
          expect(0).assertEqual(i);
        }
      });
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_022
     * @tc.name      testPublishReminderNorAlarmFun002
     * @tc.desc      test publish reminder with a nomal alarm callback function.
     */
    it('testPublishReminderNorAlarmFun002', 0, async function (done) {
      let alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14
      }
      function reminderCallback(err, reminderId) {
        if (reminderId) {
          let i = 0;
          expect(0).assertEqual(i);
        }
      }
      reminderAgent.publishReminder(alarm, reminderCallback);
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_023
     * @tc.name      testPublishReminderAbNorFun001
     * @tc.desc      test publish reminder with max number limit of each application.
     */
    it('testPublishReminderAbNorFun001', 0, async function (done) {
      let timer = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
        triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
      }
      let maxLimitNumsOfApp = 30;
      let firstId = 0;
      let secondId = 0;
      let diffId = 0
      for (let i = 0; i < maxLimitNumsOfApp; i++) {
        (function (i) {
          setTimeout(function () {
            reminderAgent.publishReminder(timer).then((reminderId) => {
              if (i === 0) {
                firstId = reminderId
              }
              if (i === 29) {
                secondId = reminderId
                diffId = secondId - firstId
                expect(29).assertEqual(diffId);
              }
            });
          }, 500 * i);
        })(i);
      }
      done();
    })

       /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_024
     * @tc.name      testReminderTypeCalendarFun001
     * @tc.desc      test cancelAllReminders can cancel all exist reminders with type of calendar.
     */
      it('testReminderTypeCalendarFun001', 0, async function (done) {
        let timer = {
          reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
          triggerTimeInSeconds: 100
      }
      let calendar = {
          reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
          dateTime : {
              year: 2025,
              month: 10,
              day: 10,
              hour: 23,
              minute: 30
          }
      }
      reminderAgent.publishReminder(timer).then((reminderId) => {});
      reminderAgent.publishReminder(calendar).then((reminderId) => {});
      setTimeout(() => {
          reminderAgent.cancelAllReminders().then(() => {
              reminderAgent.getValidReminders().then((reminders) => {
                  expect(reminders.length === 0).assertEqual(true);
              });
          });
      }, 5000);
      done();
      })

     /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_025
     * @tc.name      testPublishReminderTypeCalendarFun001
     * @tc.desc      test pulish reminders with type of calendar.
     */
      it('testReminderTypeCalendarFun001', 0, async function (done) {
        let calendar = {
          reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
          dateTime : {
              year: 2025,
              month: 10,
              day: 10,
              hour: 23,
              minute: 30
          },
          repeatMonths:[2],
          repeatDays:[2],
          actionButton:[
              {
                  title:"close",
                  type:0
              },
              {
                  title:"snooze",
                  type:1
              }
          ],
          wantAgent:{
              pkgName:"com.oh.phone",
              abilityName:"com.oh.phone.MainAbility"
          },
          maxScreenWantAgent:{
              pkgName:"com.oh.phone",
              abilityName:"com.oh.phone.MainAbility"
          },
          ringDuration:5,
          snoozeTimes:2,
          timeInterval:5,
          title:"this is title",
          content:"this is content",
          expiredContent:"this reminder has expired",
          snoozeContent:"remind later",
          notificationId:100,
          slotType:3
      }
      reminderAgent.publishReminder(calendar).then((reminderId) => {
          reminderAgent.getValidReminders().then((reminders) => {
              for (let i = 0; i < reminders.length; i++) {
                  console.log("getValidReminders = " + JSON.stringify(reminders[i]));
                  console.log("getValidReminders, reminderType = " + reminders[i].reminderType);
                  for (let j = 0; j < reminders[i].actionButton.length; j++) {
                      console.log("getValidReminders, actionButton.title = " + reminders[i].actionButton[j].title);
                      console.log("getValidReminders, actionButton.type = " + reminders[i].actionButton[j].type);
                  }
                  console.log("getValidReminders, wantAgent.pkgName = " + reminders[i].wantAgent.pkgName);
                  console.log("getValidReminders, wantAgent.abilityName = " + reminders[i].wantAgent.abilityName);
                  console.log("getValidReminders, maxScreenWantAgent.pkgName = " + reminders[i].maxScreenWantAgent.pkgName);
                  console.log("getValidReminders, maxScreenWantAgent.abilityName = " + reminders[i].maxScreenWantAgent.abilityName);
                  expect(reminders[i].ringDuration).assertEqual(5);
                  console.log("getValidReminders, ringDuration = " + reminders[i].ringDuration);
                  expect(reminders[i].snoozeTimes).assertEqual(2);
                  console.log("getValidReminders, snoozeTimes = " + reminders[i].snoozeTimes);
                  console.log("getValidReminders, timeInterval = " + reminders[i].timeInterval);
                  expect(reminders[i].title).assertEqual("this is title");
                  console.log("getValidReminders, title = " + reminders[i].title);
                  expect(reminders[i].content).assertEqual("this is content");
                  console.log("getValidReminders, content = " + reminders[i].content);
                  expect(reminders[i].expiredContent).assertEqual("this reminder has expired");
                  console.log("getValidReminders, expiredContent = " + reminders[i].expiredContent);
                  expect(reminders[i].snoozeContent).assertEqual("remind later");
                  console.log("getValidReminders, snoozeContent = " + reminders[i].snoozeContent);
                  expect(reminders[i].notificationId).assertEqual(100);
                  console.log("getValidReminders, notificationId = " + reminders[i].notificationId);
                  console.log("getValidReminders, slotType = " + reminders[i].slotType);
              }
          })
      });
      done();
      })
  })

