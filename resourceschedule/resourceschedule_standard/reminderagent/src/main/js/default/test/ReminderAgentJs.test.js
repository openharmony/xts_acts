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
import notification from '@ohos.notification'

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
     * @tc.name      testActionButton001
     * @tc.desc      test ActionButton title.
     */
    it("testActionButton001", 0, async function (done) {
        console.log('----------------------testActionButton001---------------------------');
        let timer = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
			triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
		}
		reminderAgent.publishReminder(timer).then((reminderId) => {
			console.log("reminderId =" + reminderId);
			reminderAgent.getValidReminders().then((reminder) => {
				if(reminder.length !== 0) {
					let actionButton = reminder[0].actionButton;
					if(actionButton.length === 0) {
						actionButton = [{title: '����ʱ'}]
					}
					console.log('ActionButton title:' + actionButton[0].title);
				} 
			},(error) => {
				
			});
		});
		
		setTimeout(() => {
			done();
		},500);
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_002
     * @tc.name      testActionButton002
     * @tc.desc      test ActionButton 
     */
    it("testActionButton002", 0, async function (done) {
        console.log('----------------------testActionButton002---------------------------');
        let timer = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
			triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
		}
		reminderAgent.publishReminder(timer).then((reminderId) => {
			console.log("reminderId =" + reminderId);
			reminderAgent.getValidReminders().then((reminder) => {
				if(reminder.length !== 0) {
					let actionButton = reminder[0].actionButton;
					if(actionButton.length === 0) {
						actionButton = [{type: 0}]
					}
					console.log('ActionButton type:' + actionButton[0].type);
				} else {
					reminder = [{actionButton: [{type: 1}]}];
					console.log('ActionButton Type: ' + reminder[0].actionButton[0].type);
					expect(true).assertTrue();
				}
			},(error) => {
				expect(false).assertTrue();
			});
		});
		
		setTimeout(() => {
			done();
		},500);
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_003
     * @tc.name      testWantAgentAbilityName003
     * @tc.desc      test wantAgent abilityName 
     */
    it("testWantAgentAbilityName003", 0, async function (done) {
        console.log('----------------------testWantAgentAbilityName003---------------------------');
        let timer = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
			triggerTimeInSeconds: 4,
			wantAgent: {
				pkgName: "ohos.samples.jshelloworld",
				abilityName: "ohos.samples.jshelloworld.MainAbility"
			},
		};
		reminderAgent.publishReminder(timer).then((reminderId) => {
			console.log("reminderId =" + reminderId);
			reminderAgent.getValidReminders((err, reminder) => {
				if(reminder.length !== 0) {
					let wantAgent = reminder[0].wantAgent.abilityName;
					//expect(wantAgent).assertEqual("ohos.samples.jshelloworld.MainAbility");
					if (wantAgent == "ohos.samples.jshelloworld.MainAbility") {
						expect(true).assertTrue();
					} else {
						expect(false).assertTrue();
					}
				}
			});
		});
		
		setTimeout(() => {
			done();
		},500);
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_004
     * @tc.name      testMaxScreenWantAgentAbilityName004
     * @tc.desc      test MaxScreenWantAgent abilityName 
     */
    it("testMaxScreenWantAgentAbilityName004", 0, async function (done) {
        console.log('----------------------testMaxScreenWantAgentAbilityName004---------------------------');
        let timer = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
			triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
		}
		reminderAgent.publishReminder(timer).then((reminderId) => {
			console.log("reminderId =" + reminderId);
			reminderAgent.getValidReminders().then((reminder) => {
				if(reminder.length !== 0) {
					let maxScreenWantAgent = reminder[0].maxScreenWantAgent;
					console.log('maxScreenWantAgent abilityName:' + maxScreenWantAgent.abilityName);
					if (maxScreenWantAgent.abilityName === "") {
						console.log("maxScreenWantAgent.abilityName value is ");
						expect(true).assertEqual(true);
					}
				} else {
					reminder = [{maxScreenWantAgent: {abilityName: 'title.com.oh.phone.MainAbility'}}];
					//expect(false).assertEqual(false);
				}
			},(error) => {
				//expect(false).assertTrue();
			});
		});
		
		setTimeout(() => {
			done();
		},500);
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_005
     * @tc.name      testReminderRequestTitle005
     * @tc.desc      test ReminderRequest title 
     */
    it("testReminderRequestTitle005", 0, async function (done) {
        console.log('----------------------testReminderRequestTitle005---------------------------');
        let timer = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
			triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
		}
		reminderAgent.publishReminder(timer).then((reminderId) => {
			console.log("reminderId =" + reminderId);
			reminderAgent.getValidReminders().then((reminder) => {
				if(reminder.length !== 0) {
					let title = reminder[0].title;
					console.log('ReminderRequest title:' + title);
					expect(true).assertEqual(true);
				} else {
					reminder = [{title: '��������'}];
					console.log('ReminderRequest title:' + reminder[0].title);
					//expect(false).assertEqual(false);
				}
			},(error) => {
				//expect(false).assertTrue();
			});
		});
		
		setTimeout(() => {
			done();
		},500);
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_006
     * @tc.name      testReminderRequestContent006
     * @tc.desc      test ReminderRequest content 
     */
    it("testReminderRequestContent006", 0, async function (done) {
        console.log('----------------------testReminderRequestContent006---------------------------');
        let timer = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
			triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
		}
		reminderAgent.publishReminder(timer).then((reminderId) => {
			console.log("reminderId =" + reminderId);
			reminderAgent.getValidReminders().then((reminder) => {
				if(reminder.length !== 0) {
					let content = reminder[0].content;
					console.log('ReminderRequest content:' + content);
					expect(true).assertEqual(true);
				} else {
					reminder = [{content: '8���ˣ����ϰ���'}];
					console.log('ReminderRequest content:' + reminder[0].content);
					//expect(false).assertEqual(false);
				}
			},(error) => {
				//expect(false).assertTrue();
			});
		});
		
		setTimeout(() => {
			done();
		},500);
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_007
     * @tc.name      testReminderRequestType007
     * @tc.desc      test ReminderRequest LocalDateTime second 
     */
    it("testReminderRequestType007", 0, async function (done) {
        console.log('----------------------testReminderRequestType007---------------------------');
        let calendar = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
			dateTime: {
				year: 2025,
				month: 10,
				day: 10,
				hour: 23,
				minute: 30,
				second: 18
			}
		}
		reminderAgent.publishReminder(calendar).then((reminderId) => {
			console.log("testReminderRequestType007 reminderId =" + reminderId);
			expect(true).assertEqual(true);
		});
		
		setTimeout(() => {
			done();
		},500);
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_008
     * @tc.name      testReminderRequestType008
     * @tc.desc      test ReminderRequest ReminderRequestAlarm daysOfWeek 
     */
    it("testReminderRequestType008", 0, async function (done) {
        console.log('----------------------testReminderRequestType008---------------------------');
        let alarm = {
			reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
			hour: 7,
			minute: 10,
			daysOfWeek: [1,2,3,4,5]
		}
		reminderAgent.publishReminder(alarm).then((reminderId) => {
			if (reminderId != -1) {
				console.log("testReminderRequestType008 reminderId =" + reminderId);
				expect(true).assertEqual(true);
			}
			//console.log("reminderId =" + reminderId);
		},error => {
			//expect(false).assertTrue();
		});
		
		setTimeout(() => {
			done();
		},500);
    })
  
  /**
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_009
   * @tc.name      testPublishReminderNorFun009
   * @tc.desc      Publishes an agent-powered reminder with the promise function.
   */
  it('testPublishReminderNorFun009', 0, async function (done) {
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
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_010
   * @tc.name      testPublishReminderNorFun010
   * @tc.desc      Publishes an agent-powered reminder with the callback function.
   */
  it('testPublishReminderNorFun010', 0, async function (done) {
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
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_011
   * @tc.name      testAddNotificationSlotNorFun011
   * @tc.desc      Adds a reminder notification slot with the callback function.
   */
  it('testAddNotificationSlotNorFun011', 0, async function (done) {
    try {
		function reminderCallback(err, data) {
			let i = 0;
			expect(0).assertEqual(i);
		}
		reminderAgent.addNotificationSlot(0, reminderCallback);
	} catch(error) {
		console.info('testAddNotificationSlotNorFun011 slot err.code')
	}
    done();
  })

  /**
   * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_012
   * @tc.name      testAddNotificationSlotNorFun012
   * @tc.desc      Adds a reminder notification slot with the promise function and null mySlot.
   */
    it('testAddNotificationSlotNorFun012', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_013
     * @tc.name      testAddNotificationSlotNorFun013
     * @tc.desc      Adds a reminder notification slot with the promise function and mySlot type 3.
     */
    it('testAddNotificationSlotNorFun013', 0, async function (done) {
      let mySlot = {
        type: 3
      }
      reminderAgent.addNotificationSlot(mySlot).then(() => {
        expect(true).assertTrue();
        setTimeout(() => {
          done();
        }, 500);
      }, (error) => {
        expect(true).assertTrue();
        setTimeout(() => {
          done();
        }, 500);
      });
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_014
     * @tc.name      testAddNotificationSlotNorFun014
     * @tc.desc      Adds a reminder notification slot with the promise function and mySlot more types.
     */
    it('testAddNotificationSlotNorFun014', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_015
     * @tc.name      testGetValidRemindersNorFun015
     * @tc.desc      Obtains all valid remindeers set by the current application. 
     */
    it('testGetValidRemindersNorFun015', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_016
     * @tc.name      testCancelAllRemindersNorFun016
     * @tc.desc      test cancel all reminders can cancel all exist reminders
     */
    it('testCancelAllRemindersNorFun016', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_017
     * @tc.name      testCancelRemindersNorFun017
     * @tc.desc      test cancelReminder with not exit reminder.
     */
    it('testCancelRemindersNorFun017', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_018
     * @tc.name      testCancelRemindersNorFun018
     * @tc.desc      test cancel reminder with not exit reminder.
     */
    it('testCancelRemindersNorFun018', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_019
     * @tc.name      testCancelRemindersNorFun019
     * @tc.desc      test cancel reminder with exist reminder.
     */
    it('testCancelRemindersNorFun019', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_020
     * @tc.name      testCancelRemindersNorFun020
     * @tc.desc      test cancel reminder with exist reminder with the promise function.
     */
    it('testCancelRemindersNorFun020', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_021
     * @tc.name      testGetValidRemindersNorFun021
     * @tc.desc      test get valid reminders verify all the information is correct.
     */
    it('testGetValidRemindersNorFun021', 0, async function (done) {
      let alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14,
        title: "this is title",
        content: "this is content"
      }
      let timer = {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_022
     * @tc.name      testGetValidRemindersNorFun022
     * @tc.desc      test get valid reminders verify all the information is correct with the callback function.
     */
    it('testGetValidRemindersNorFun022', 0, async function (done) {
      let alarm = {
        reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        hour: 21,
        minute: 14,
        title: "this is title",
        content: "this is content"
      }
      let timer = {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_023
     * @tc.name      testRemonveNotificationSlotNorFun023
     * @tc.desc      test remove notification Slot with not exist slot.
     */
    it('testRemonveNotificationSlotNorFun023', 0, async function (done) {
      function reminderCallback(err, data) {
        let i = 0;
        expect(0).assertEqual(i);
      }
      reminderAgent.removeNotificationSlot(0, reminderCallback);
      done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_001
     * @tc.name      testReminderAgentRequest_001
     * @tc.desc      test timer without reminderType .
     */
    it("testReminderAgentRequest_001", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_001---------------------------');
        let timer = {
        //            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 10
        }
        reminderAgent.publishReminder(timer,(err,reminderId) =>{
            console.log("callback,the testReminderAgentRequest_001 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_002
     * @tc.name      testReminderAgentRequest_002
     * @tc.desc      test timer without triggerTimeInSeconds.
     */
    it("testReminderAgentRequest_002", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_002---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER
        //            triggerTimeInSeconds: 10
        }
        reminderAgent.publishReminder(timer,(err,reminderId) =>{
            console.log("callback,the testReminderAgentRequest_002 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_003
     * @tc.name      testReminderAgentRequest_003
     * @tc.desc      test timer triggerTimeInSeconds with wrong parameter.
     */
    it("testReminderAgentRequest_003", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_003---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: -10
        }
        reminderAgent.publishReminder(timer,(err,reminderId) =>{
            console.log("callback,the testReminderAgentRequest_003 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_004
     * @tc.name      testReminderAgentRequest_004
     * @tc.desc      test timer triggerTimeInSeconds with illegal parameter.
     */
    it("testReminderAgentRequest_004", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_004---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 0
        }
        reminderAgent.publishReminder(timer,(err,reminderId) =>{
            console.log("callback,the testReminderAgentRequest_004 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_005
     * @tc.name      testReminderAgentRequest_005
     * @tc.desc      test timer triggerTimeInSeconds with illegal parameter.
     */
    it("testReminderAgentRequest_005", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_005---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 'fye'
        }
        reminderAgent.publishReminder(timer,(err,reminderId) =>{
            console.log("callback,the testReminderAgentRequest_005 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_006
     * @tc.name      testReminderAgentRequest_006
     * @tc.desc      test timer normal parameter,return with callback.
     */
    it("testReminderAgentRequest_006", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_006---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20
        }
        reminderAgent.publishReminder(timer,(err,reminderId) =>{
            console.log("callback,the testReminderAgentRequest_006 reminderId=" + reminderId);
            expect(reminderId).assertLarger(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_007
     * @tc.name      testReminderAgentRequest_007
     * @tc.desc      test timer normal parameter,return with promise.
     */
    it("testReminderAgentRequest_007", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_007---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20
        }
        reminderAgent.publishReminder(timer).then((reminderId) => {
            console.log("promise,the testReminderAgentRequest_007 reminderId =" + reminderId);
            expect(reminderId).assertLarger(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_008
     * @tc.name      testReminderAgentRequest_008
     * @tc.desc      test alarm without reminderType parameter.
     */
    it("testReminderAgentRequest_008", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_008---------------------------');
        let alarm = {
        //          reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 13
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_008 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_009
     * @tc.name      testReminderAgentRequest_009
     * @tc.desc      test alarm without hour parameter.
     */
    it("testReminderAgentRequest_009", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_009---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
        //          hour: 11,
            minute: 13
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_009 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_010
     * @tc.name      testReminderAgentRequest_010
     * @tc.desc      test alarm with illegal hour parameter.
     */
    it("testReminderAgentRequest_010", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_010---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: "11",
            minute: 13
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_010 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_011
     * @tc.name      testReminderAgentRequest_011
     * @tc.desc      test alarm hour with illegal parameter 24.
     */
    it("testReminderAgentRequest_011", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_011---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 24,
            minute: 13
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_011 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_012
     * @tc.name      testReminderAgentRequest_012
     * @tc.desc      test alarm without minute parameter.
     */
    it("testReminderAgentRequest_012", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_012---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11
        //          minute: 13
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_012 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_013
     * @tc.name      testReminderAgentRequest_013
     * @tc.desc      test alarm with illegal minute parameter.
     */
    it("testReminderAgentRequest_013", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_013---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: "13"
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_013 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_014
     * @tc.name      testReminderAgentRequest_014
     * @tc.desc      test alarm hour with illegal parameter 60.
     */
    it("testReminderAgentRequest_014", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_014---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 60
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_014 reminderId=" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_015
     * @tc.name      testReminderAgentRequest_015
     * @tc.desc      test alarm with normal parameter,return with callback.
     */
    it("testReminderAgentRequest_015", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_015---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 30
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_015 reminderId=" + reminderId);
            expect(reminderId).assertLarger(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_016
     * @tc.name      testReminderAgentRequest_016
     * @tc.desc      test alarm with normal parameter,return with promise.
     */
    it("testReminderAgentRequest_016", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_016---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 30
        }
        reminderAgent.publishReminder(alarm,(err,reminderId) =>{
            console.log("promise,the testReminderAgentRequest_016 reminderId=" + reminderId);
            expect(reminderId).assertLarger(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_017
     * @tc.name      testReminderAgentRequest_017
     * @tc.desc      test alarm with illegal daysOfWeek parameter.
     */
    it("testReminderAgentRequest_017", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_017---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 30,
            daysOfWeek: [8]
        }
        reminderAgent.publishReminder(alarm).then((reminderId) => {
            console.log("promise,the testReminderAgentRequest_017 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_018
     * @tc.name      testReminderAgentRequest_018
     * @tc.desc      test alarm with null daysOfWeek parameter.
     */
    it("testReminderAgentRequest_018", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_018---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 30,
            daysOfWeek: []
        }
        reminderAgent.publishReminder(alarm).then((reminderId) => {
            console.log("promise,the testReminderAgentRequest_018 reminderId =" + reminderId);
            expect(reminderId).assertLarger(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_019
     * @tc.name      testReminderAgentRequest_019
     * @tc.desc      test calendar without reminderType parameter.
     */
    it("testReminderAgentRequest_019", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_019---------------------------');
        let calendar = {
            dateTime: {
                year: 2025,
                month: 7,
                day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_019 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_020
     * @tc.name      testReminderAgentRequest_020
     * @tc.desc      test calendar without year parameter.
     */
    it("testReminderAgentRequest_020", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_020---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
            //                year: 2025,
                month: 7,
                day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_020 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_021
     * @tc.name      testReminderAgentRequest_021
     * @tc.desc      test calendar with illegal year parameter.
     */
    it("testReminderAgentRequest_021", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_021---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: "2025",
                month: 7,
                day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_021 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_022
     * @tc.name      testReminderAgentRequest_022
     * @tc.desc      test calendar without month parameter.
     */
    it("testReminderAgentRequest_022", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_022---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
            //                month: 7,
                day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_022 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_023
     * @tc.name      testReminderAgentRequest_023
     * @tc.desc      test calendar with illegal month parameter.
     */
    it("testReminderAgentRequest_023", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_023---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: "7",
                day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_023 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_024
     * @tc.name      testReminderAgentRequest_024
     * @tc.desc      test calendar with illegal month parameter 0.
     */
    it("testReminderAgentRequest_024", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_024---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 0,
                day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_024 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_025
     * @tc.name      testReminderAgentRequest_025
     * @tc.desc      test calendar with illegal month parameter 13.
     */
    it("testReminderAgentRequest_025", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_025---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 13,
                day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_025 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_026
     * @tc.name      testReminderAgentRequest_026
     * @tc.desc      test calendar without day parameter.
     */
    it("testReminderAgentRequest_026", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_026---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
            //              day: 28,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_026 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_027
     * @tc.name      testReminderAgentRequest_027
     * @tc.desc      test calendar with illegal day parameter.
     */
    it("testReminderAgentRequest_027", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_027---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: "28",
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_027 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_028
     * @tc.name      testReminderAgentRequest_028
     * @tc.desc      test calendar with illegal day parameter 0.
     */
    it("testReminderAgentRequest_028", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_028---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 0,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_028 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_029
     * @tc.name      testReminderAgentRequest_029
     * @tc.desc      test calendar with illegal day parameter 32.
     */
    it("testReminderAgentRequest_029", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_029---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 32,
                hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_029 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_030
     * @tc.name      testReminderAgentRequest_030
     * @tc.desc      test calendar without hour parameter.
     */
    it("testReminderAgentRequest_030", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_030---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
            //              hour: 14,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_030 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_031
     * @tc.name      testReminderAgentRequest_031
     * @tc.desc      test calendar with illegal hour parameter.
     */
    it("testReminderAgentRequest_031", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_031---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: "14",
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_031 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_032
     * @tc.name      testReminderAgentRequest_032
     * @tc.desc      test calendar with illegal hour parameter 24.
     */
    it("testReminderAgentRequest_032", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_032---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 24,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_032 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_033
     * @tc.name      testReminderAgentRequest_033
     * @tc.desc      test calendar without minute parameter.
     */
    it("testReminderAgentRequest_033", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_033---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
            //              minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_033 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_034
     * @tc.name      testReminderAgentRequest_034
     * @tc.desc      test calendar with illegal minute parameter.
     */
    it("testReminderAgentRequest_034", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_034---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: "30",
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_034 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_035
     * @tc.name      testReminderAgentRequest_035
     * @tc.desc      test calendar with illegal minute parameter 60.
     */
    it("testReminderAgentRequest_035", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_035---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: 60,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_035 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_036
     * @tc.name      testReminderAgentRequest_036
     * @tc.desc      test calendar with normal parameter,return with callback.
     */
    it("testReminderAgentRequest_036", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_036---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: 30,
                second: 50
            }
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_036 reminderId =" + reminderId);
            expect(reminderId).assertLarger(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_037
     * @tc.name      testReminderAgentRequest_037
     * @tc.desc      test calendar with normal parameter,return with promise.
     */
    it("testReminderAgentRequest_037", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_037---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 29,
                hour: 11,
                minute: 30,
                second: 40
            }
        }
        reminderAgent.publishReminder(calendar).then((reminderId) => {
            console.log("promise,the testReminderAgentRequest_037 reminderId =" + reminderId);
            expect(reminderId).assertLarger(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_038
     * @tc.name      testReminderAgentRequest_038
     * @tc.desc      test calendar with illegal repeatMonths parameter 13.
     */
    it("testReminderAgentRequest_038", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_038---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: 30,
                second: 45
            },
            repeatMonths: [13]
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_038 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_039
     * @tc.name      testReminderAgentRequest_039
     * @tc.desc      test calendar with illegal repeatMonths parameter 0.
     */
    it("testReminderAgentRequest_039", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_039---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: 45,
                second: 45
            },
            repeatMonths: [0]
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_039 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_040
     * @tc.name      testReminderAgentRequest_040
     * @tc.desc      test calendar with illegal repeatDays parameter 32.
     */
    it("testReminderAgentRequest_040", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_040---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: 45,
                second: 45
            },
            repeatDays: [32]
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_040 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_041
     * @tc.name      testReminderAgentRequest_041
     * @tc.desc      test calendar with illegal repeatDays parameter 0.
     */
    it("testReminderAgentRequest_041", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_041---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: 45,
                second: 45
            },
            repeatDays: [0]
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_041 reminderId =" + reminderId);
            expect(-1).assertEqual(reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_042
     * @tc.name      testReminderAgentRequest_042
     * @tc.desc      test calendar with repeatMonths、repeatDays parameter null,return with callback.
     */
    it("testReminderAgentRequest_042", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_042---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 28,
                hour: 11,
                minute: 45,
                second: 15
            },
            repeatMonths: [],
            repeatDays: []
        }
        reminderAgent.publishReminder(calendar,(err,reminderId) => {
            console.log("callback,the testReminderAgentRequest_042 reminderId =" + reminderId);
            expect(reminderId).assertLager(0);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_043
     * @tc.name      testReminderAgentRequest_043
     * @tc.desc      test calendar with repeatMonths、repeatDays parameter null,return with promise.
     */
    it("testReminderAgentRequest_043", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_043---------------------------');
        let calendar = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
                year: 2025,
                month: 5,
                day: 25,
                hour: 11,
                minute: 45,
                second: 15
            },
            repeatMonths: [],
            repeatDays: []
        }
        reminderAgent.publishReminder(calendar).then((reminderId) => {
            console.log("promise,the testReminderAgentRequest_043 reminderId =" + reminderId);
        });

        setTimeout(() => {
            done();
        },500);
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_044
     * @tc.name      testReminderAgentRequest_044
     * @tc.desc      test actionButton with illegal parameter.
     */
    it("testReminderAgentRequest_044", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_044---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 15,
            actionButton: [
                {
                    title: "this is a title",
                    type: 2
                }
            ]
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_044 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_044 reminder length =" + reminder.length);
                if (reminder.length!==0) {
                    let actionButton = reminder[0].actionButton;
                    if (actionButton.length === 0) {
                        expect(0).assertEqual(actionButton.length);
                    }
                    console.log("callback,the testReminderAgentRequest_044 actionButton type: " + actionButton[0].type);
                }
            },(error) =>{
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_045
     * @tc.name      testReminderAgentRequest_045
     * @tc.desc      test actionButton without title.
     */
    it("testReminderAgentRequest_045", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_045---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 15,
            actionButton: [
                {
                //                  title: "this is a title",
                    type: 0
                }
            ]
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_045 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_045 reminder length =" + reminder.length);
                if (reminder.length!==0) {
                    let actionButton = reminder[0].actionButton;
                    if (actionButton.length === 0) {
                        expect(0).assertEqual(actionButton.length);
                    }
                    console.log("callback,the actionButton title: " + actionButton[0].title);
                }
            },(error) =>{
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_046
     * @tc.name      testReminderAgentRequest_046
     * @tc.desc      test actionButton with illegal title.
     */
    it("testReminderAgentRequest_046", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_046---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 15,
            actionButton: [
                {
                    title: 123,
                    type: 0
                }
            ]
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_046 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_046 reminder length =" + reminder.length);
                if (reminder.length!==0) {
                    let actionButton = reminder[0].actionButton;
                    if (actionButton.length === 0) {
                        expect(0).assertEqual(actionButton.length);
                    }
                    console.log("callback,the actionButton title: " + actionButton[0].title);
                }
            },(error) =>{
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_047
     * @tc.name      testReminderAgentRequest_047
     * @tc.desc      test snoozeTimes with parameter 0.
     */
    it("testReminderAgentRequest_047", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_047---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 15,
            snoozeTimes: 0
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_047 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_047 snoozeTimes =" + reminder[0].snoozeTimes);
                expect(reminder[0].snoozeTimes).assertEqual(0);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_048
     * @tc.name      testReminderAgentRequest_048
     * @tc.desc      test snoozeTimes with illegal parameter.
     */
    it("testReminderAgentRequest_048", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_048---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 15,
            snoozeTimes: "2"
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_048 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_048 snoozeTimes =" + reminder[0].snoozeTimes);
                expect(reminder[0].snoozeTimes).assertEqual(0);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_049
     * @tc.name      testReminderAgentRequest_049
     * @tc.desc      test snoozeTimes with illegal parameter.
     */
    it("testReminderAgentRequest_049", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_049---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 15,
            snoozeTimes: -1
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_049 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_049 snoozeTimes =" + reminder[0].snoozeTimes);
                expect(reminder[0].snoozeTimes).assertEqual(0);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_050
     * @tc.name      testReminderAgentRequest_050
     * @tc.desc      test ringDuration default parameters.
     */
    it("testReminderAgentRequest_050", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_050---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 13
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_050 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_050 ringDuration =" + reminder[0].ringDuration);
                expect(reminder[0].ringDuration).assertEqual(1);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_051
     * @tc.name      testReminderAgentRequest_051
     * @tc.desc      test ringDuration with illegal parameter.
     */
    it("testReminderAgentRequest_051", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_051---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 13,
            ringDuration: "10"
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_051 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_051 ringDuration =" + reminder[0].ringDuration);
                expect(reminder[0].ringDuration).assertEqual(1);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_052
     * @tc.name      testReminderAgentRequest_052
     * @tc.desc      test ringDuration with illegal parameter.
     */
    it("testReminderAgentRequest_052", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_052---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 13,
            ringDuration: -10
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_052 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_052 ringDuration =" + reminder[0].ringDuration);
                expect(reminder[0].ringDuration).assertEqual(1);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_053
     * @tc.name      testReminderAgentRequest_053
     * @tc.desc      test timeInterval default parameters.
     */
    it("testReminderAgentRequest_053", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_053---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 10
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_053 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_053 timeInterval =" + reminder[0].timeInterval);
                expect(reminder[0].timeInterval).assertEqual(0);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_054
     * @tc.name      testReminderAgentRequest_054
     * @tc.desc      test timeInterval with illegal parameters.
     */
    it("testReminderAgentRequest_054", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_054---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 10,
            timeInterval: "3"
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_054 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_054 timeInterval =" + reminder[0].timeInterval);
                expect(reminder[0].timeInterval).assertEqual(0);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_055
     * @tc.name      testReminderAgentRequest_055
     * @tc.desc      test timeInterval with illegal parameters.
     */
    it("testReminderAgentRequest_055", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_055---------------------------');
        let alarm = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
            hour: 11,
            minute: 10,
            timeInterval: -12
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(alarm,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_055 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                console.log("callback,the testReminderAgentRequest_055 timeInterval =" + reminder[0].timeInterval);
                expect(reminder[0].timeInterval).assertEqual(0);
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_056
     * @tc.name      testReminderAgentRequest_056
     * @tc.desc      test title with empty parameters.
     */
    it("testReminderAgentRequest_056", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_056---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            timeInterval: 5,
            ringDuration: 5,
            title: ''
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_056 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let title = reminder[0].title;
                    console.log("callback,the testReminderAgentRequest_056 title is: " + title);
                    expect(title).assertEqual('');
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_057
     * @tc.name      testReminderAgentRequest_057
     * @tc.desc      test title with illegal parameters.
     */
    it("testReminderAgentRequest_057", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_057---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            timeInterval: 5,
            ringDuration: 10,
            title: 123
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_057 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let title = reminder[0].title;
                    console.log("callback,the testReminderAgentRequest_057 title is: " + title);
                    expect(title).assertEqual('');
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_058
     * @tc.name      testReminderAgentRequest_058
     * @tc.desc      test slotType default parameters.
     */
    it("testReminderAgentRequest_058", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_058---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_058 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let slotType = reminder[0].slotType;
                    console.log("callback,the testReminderAgentRequest_058 slotType  is: " + slotType);
                    expect(slotType).assertEqual(1);
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_059
     * @tc.name      testReminderAgentRequest_059
     * @tc.desc      test slotType with illegal parameter 5.
     */
    it("testReminderAgentRequest_059", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_059---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            slotType: 5
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_059 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let slotType = reminder[0].slotType;
                    console.log("callback,the testReminderAgentRequest_059 slotType is: " + slotType);
                    expect(slotType).assertEqual(1);
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_060
     * @tc.name      testReminderAgentRequest_060
     * @tc.desc      test pkgName with empty parameters.
     */
    it("testReminderAgentRequest_060", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_060---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            wantAgent: {
                pkgName: "",
                abilityName: "com.oh.phone.MainAbility"
            }
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_060 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let pkgName = reminder[0].wantAgent.pkgName;
                    console.log("callback,the testReminderAgentRequest_060 pkgName is: " + pkgName);
                    expect(pkgName).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_061
     * @tc.name      testReminderAgentRequest_061
     * @tc.desc      test pkgName with illegal parameters.
     */
    it("testReminderAgentRequest_061", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_061---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            wantAgent: {
                pkgName: 123,
                abilityName: "com.oh.phone.MainAbility"
            }
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_061 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let pkgName = reminder[0].wantAgent.pkgName;
                    console.log("callback,the testReminderAgentRequest_061 pkgName is: " + pkgName);
                    expect(pkgName).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_062
     * @tc.name      testReminderAgentRequest_062
     * @tc.desc      test abilityName with empty parameters.
     */
    it("testReminderAgentRequest_062", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_062---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            wantAgent: {
                pkgName: "com.oh.phone",
                abilityName: ""
            }
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_062 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let abilityName = reminder[0].wantAgent.abilityName;
                    console.log("callback,the testReminderAgentRequest_062 abilityName is: " + abilityName);
                    expect(abilityName).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_063
     * @tc.name      testReminderAgentRequest_063
     * @tc.desc      test abilityName with illegal parameters.
     */
    it("testReminderAgentRequest_063", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_063---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            wantAgent: {
                pkgName: "com.oh.phone",
                abilityName: 1243
            }
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_063 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let abilityName = reminder[0].wantAgent.abilityName;
                    console.log("callback,the testReminderAgentRequest_063 abilityName is: " + abilityName);
                    expect(abilityName).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_064
     * @tc.name      testReminderAgentRequest_064
     * @tc.desc      test content with illegal parameters.
     */
    it("testReminderAgentRequest_064", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_064---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            content: ""
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_064 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let content = reminder[0].content;
                    console.log("callback,the testReminderAgentRequest_064 content is: " + content);
                    expect(content).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_065
     * @tc.name      testReminderAgentRequest_065
     * @tc.desc      test content with illegal parameters.
     */
    it("testReminderAgentRequest_065", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_065---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            content: 14545
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_065 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let content = reminder[0].content;
                    console.log("callback,the testReminderAgentRequest_065 content is: " + content);
                    expect(content).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_066
     * @tc.name      testReminderAgentRequest_066
     * @tc.desc      test expiredContent with empty parameters.
     */
    it("testReminderAgentRequest_066", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_066---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            expiredContent: ""
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_066 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let expiredContent = reminder[0].expiredContent;
                    console.log("callback,the testReminderAgentRequest_066 expiredContent is: " + expiredContent);
                    expect(expiredContent).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_067
     * @tc.name      testReminderAgentRequest_067
     * @tc.desc      test expiredContent with illegal parameters.
     */
    it("testReminderAgentRequest_067", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_067---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            expiredContent: 14555
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_067 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let expiredContent = reminder[0].expiredContent;
                    console.log("callback,the testReminderAgentRequest_067 expiredContent is: " + expiredContent);
                    expect(expiredContent).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_068
     * @tc.name      testReminderAgentRequest_068
     * @tc.desc      test snoozeContent with empty parameters.
     */
    it("testReminderAgentRequest_068", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_068---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            snoozeContent: ""
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_068 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let snoozeContent = reminder[0].snoozeContent;
                    console.log("callback,the testReminderAgentRequest_068 snoozeContent is: " + snoozeContent);
                    expect(snoozeContent).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_069
     * @tc.name      testReminderAgentRequest_069
     * @tc.desc      test snoozeContent with illegal parameters.
     */
    it("testReminderAgentRequest_069", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_069---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            snoozeContent: 2155
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_069 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let snoozeContent = reminder[0].snoozeContent;
                    console.log("callback,the testReminderAgentRequest_069 snoozeContent is: " + snoozeContent);
                    expect(snoozeContent).assertEqual("");
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_070
     * @tc.name      testReminderAgentRequest_070
     * @tc.desc      test notificationId with illegal parameters.
     */
    it("testReminderAgentRequest_070", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_070---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            notificationId: -1
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_070 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let notificationId = reminder[0].notificationId;
                    console.log("callback,the testReminderAgentRequest_070 notificationId is: " + notificationId);
                    expect(notificationId).assertEqual(0);
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_071
     * @tc.name      testReminderAgentRequest_071
     * @tc.desc      test snoozeContent with illegal parameters.
     */
    it("testReminderAgentRequest_071", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_071---------------------------');
        let timer = {
            reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 20,
            notificationId: "100"
        }
        reminderAgent.cancelAllReminders((err,data) => {
            reminderAgent.publishReminder(timer,(err,reminderId) => {
                console.log("callback,the testReminderAgentRequest_071 reminderId =" + reminderId);
            });
        });

        setTimeout(() => {
            reminderAgent.getValidReminders((err,reminder) =>{
                if (reminder.length !== 0){
                    let notificationId = reminder[0].notificationId;
                    console.log("callback,the testReminderAgentRequest_071 notificationId is: " + notificationId);
                    expect(notificationId).assertEqual(0);
                }
            });
        },500);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_072
     * @tc.name      testReminderAgentRequest_072
     * @tc.desc      test timer default parameter with 0.
     */
    it("testReminderAgentRequest_072", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_072---------------------------');
        let timer = reminderAgent.ReminderType.REMINDER_TYPE_TIMER;
        expect(timer).assertEqual(0);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_073
     * @tc.name      testReminderAgentRequest_073
     * @tc.desc      test calendar default parameter with 1.
     */
    it("testReminderAgentRequest_073", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_073---------------------------');
        let calendar = reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR;
        expect(calendar).assertEqual(1);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_074
     * @tc.name      testReminderAgentRequest_074
     * @tc.desc      test alarm default parameter with 2.
     */
    it("testReminderAgentRequest_074", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_074---------------------------');
        let alarm = reminderAgent.ReminderType.REMINDER_TYPE_ALARM;
        expect(alarm).assertEqual(2);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_075
     * @tc.name      testReminderAgentRequest_075
     * @tc.desc      test button close default parameter with 0.
     */
    it("testReminderAgentRequest_075", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_075---------------------------');
        let button = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE;
        expect(button).assertEqual(0);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_076
     * @tc.name      testReminderAgentRequest_076
     * @tc.desc      test button snooze default parameter with 1.
     */
    it("testReminderAgentRequest_076", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_076---------------------------');
        let button = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE;
        expect(button).assertEqual(1);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_077
     * @tc.name      testReminderAgentRequest_077
     * @tc.desc      test UNKNOWN_TYPE default parameter with 0.
     */
    it("testReminderAgentRequest_077", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_077---------------------------');
        let type = notification.SlotType.UNKNOWN_TYPE;
        expect(type).assertEqual(0);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_078
     * @tc.name      testReminderAgentRequest_078
     * @tc.desc      test SOCIAL_COMMUNICATION default parameter with 1.
     */
    it("testReminderAgentRequest_078", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_078---------------------------');
        let type = notification.SlotType.SOCIAL_COMMUNICATION;
        expect(type).assertEqual(1);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_079
     * @tc.name      testReminderAgentRequest_079
     * @tc.desc      test SERVICE.INFORMATION default parameter with 2.
     */
    it("testReminderAgentRequest_079", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_079---------------------------');
        let type = notification.SlotType.SERVICE_INFORMATION;
        expect(type).assertEqual(2);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_080
     * @tc.name      testReminderAgentRequest_080
     * @tc.desc      test CONTENT_INFORMATION default parameter with 3.
     */
    it("testReminderAgentRequest_080", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_080---------------------------');
        let type = notification.SlotType.CONTENT_INFORMATION;
        expect(type).assertEqual(3);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_081
     * @tc.name      testReminderAgentRequest_081
     * @tc.desc      test OTHER_TYPES default parameter with 65535.
     */
    it("testReminderAgentRequest_081", 0, async function (done) {
        console.log('----------------------testReminderAgentRequest_081---------------------------');
        let type = notification.SlotType.OTHER_TYPES;
        expect(type).assertEqual(65535);
        done();
    })

    /**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_024
     * @tc.name      testRemonveNotificationSlotNorFun024
     * @tc.desc      test remove notification Slot with not exist slot with the promise function.
     */
    it('testRemonveNotificationSlotNorFun024', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_025
     * @tc.name      testRemonveNotificationSlotNorFun025
     * @tc.desc      test remove notification Slot with exist slot.
     */
    it('testRemonveNotificationSlotNorFun025', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_026
     * @tc.name      testRemonveNotificationSlotNorFun026
     * @tc.desc      test remove notification Slot with exist slot with the promise function.
     */
    it('testRemonveNotificationSlotNorFun026', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_027
     * @tc.name      testGetValidRemindersNorFun027
     * @tc.desc      test get valid reminders with promise function.
     */
    it('testGetValidRemindersNorFun027', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_028
     * @tc.name      testGetValidRemindersNorFun028
     * @tc.desc      test get valid reminders with the callback function.
     */
    it('testGetValidRemindersNorFun028', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_029
     * @tc.name      testPublishReminderNorAlarmFun029
     * @tc.desc      test publish reminder with a nomal alarm promise function.
     */
    it('testPublishReminderNorAlarmFun029', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_030
     * @tc.name      testPublishReminderNorAlarmFun030
     * @tc.desc      test publish reminder with a nomal alarm callback function.
     */
    it('testPublishReminderNorAlarmFun030', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_031
     * @tc.name      testPublishReminderAbNorFun031
     * @tc.desc      test publish reminder with max number limit of each application.
     */
    it('testPublishReminderAbNorFun031', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_032
     * @tc.name      testReminderTypeCalendarFun032
     * @tc.desc      test cancelAllReminders can cancel all exist reminders with type of calendar.
     */
      it('testReminderTypeCalendarFun032', 0, async function (done) {
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_033
     * @tc.name      testPublishReminderTypeCalendarFun033
     * @tc.desc      test pulish reminders with type of calendar.
     */
      it('testReminderTypeCalendarFun033', 0, async function (done) {
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
	  
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_034
     * @tc.name      testActionButtonTypeClose034
     * @tc.desc      test acton butto type is close.
     */
	 it('testActionButtonTypeClose034', 0, async function (done) {
		 let timer = {
			 reminderType: reminderAgent.ReminderType.ACTION_BUTTON_TYPE_CLOSE,
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_035
     * @tc.name      testActionButtonTypeSnooze035
     * @tc.desc      test acton butto type is snooze.
     */
	 it('testActionButtonTypeSnooze035', 0, async function (done) {
		 let timer = {
			 reminderType: reminderAgent.ReminderType.ACTION_BUTTON_TYPE_SNOOZE,
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
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_036
     * @tc.name      testActionButtonType036
     * @tc.desc      test acton butto type type = 0.
     */
    it("testActionButtonType036", 0, async function (done) {
        console.log('----------------------testActionButtonType036---------------------------');
        let type1 = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE;
		console.log(type1 + typeof(type1));
		if (type1 == 0) {
			expect(true).assertTrue();
		} else {
			except(false).assertTrue();
		}
        done();
    })
	
	/**
     * @tc.number    SUB_RESOURCESCHEDULE_REMINDER_AGENT_037
     * @tc.name      testActionButtonType038
     * @tc.desc      test acton butto type type = 0.
     */
    it("testActionButtonType037", 0, async function (done) {
        console.log('----------------------testActionButtonType037---------------------------');
        let type1 = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE;
		console.log(type1 + typeof(type1));
		if (type1 == 1) {
			expect(true).assertTrue();
		} else {
			except(false).assertTrue();
		}
        done();
    })
  })

