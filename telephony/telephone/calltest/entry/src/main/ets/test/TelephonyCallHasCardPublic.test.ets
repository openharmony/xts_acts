/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, it, expect, beforeAll } from '@ohos/hypium'
import call from '@ohos.telephony.call';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { Driver, MatchPattern, Component, ON } from '@ohos.UiTest';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';

const rightPhone: string = "17301740854";
const emptyStr: string = "";
const errPhone: string = "125qqqq555";
const emergencyPhone: string = "120";
const specialPhone: string = "10086";

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

function hangUpCall(caseName: string): void {
  try {
    call.hangUpCall((err: BusinessError) => {
      if (err) {
        console.error(`${caseName} hangUpCall fail, err->${JSON.stringify(err)}`);
      } else {
        console.log(`${caseName} hangUpCall success.`);
      }
    });
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function HasCardPublicTest() {
  describe('TelephonyCallHasCardPublicTest', () => {
    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_0100
     * @tc.name   : testTelephonyCallManagerDial0100
     * @tc.desc   : Make a phone call. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial0100';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_0200
     * @tc.name   : testTelephonyCallManagerDial0200
     * @tc.desc   : Make a phone call. Use callback for asynchronous callback deprecated.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial0200';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(emergencyPhone, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim2 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_0250
     * @tc.name   : testTelephonyCallManagerDial0250
     * @tc.desc   : Make a phone call. Use callback for asynchronous callback deprecated.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial0250', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial0250';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(specialPhone, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim2 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_0500
     * @tc.name   : testTelephonyCallManagerDial0500
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial0500';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: false
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_0600
     * @tc.name   : testTelephonyCallManagerDial0600
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial0600';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: true
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_0700
     * @tc.name   : testTelephonyCallManagerDial0700
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial0700', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial0700';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: false,
        accountId: 0,
        videoState: 0,
        dialScene: 0,
        dialType: 0,
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_1000
     * @tc.name   : testTelephonyCallManagerDial1000
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial1000', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial1000';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: false,
        accountId: 0,
        videoState: 1,
        dialScene: 0,
        dialType: 0,
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_1200
     * @tc.name   : testTelephonyCallManagerDial1200
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial1200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial1200';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: false,
        accountId: 0,
        videoState: 0,
        dialScene: 1,
        dialType: 0,
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_1350
     * @tc.name   : testTelephonyCallManagerDial1350
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial1350', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial1350';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: false,
        accountId: 0,
        videoState: 0,
        dialScene: 2,
        dialType: 0,
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(emergencyPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_1400
     * @tc.name   : testTelephonyCallManagerDial1400
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial1400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial1400';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: false,
        accountId: 0,
        videoState: 0,
        dialScene: 0,
        dialType: 1,
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_1500
     * @tc.name   : testTelephonyCallManagerDial1500
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial1500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial1500';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {
        extras: false,
        accountId: 0,
        videoState: 0,
        dialScene: 0,
        dialType: 2,
      }
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_Dial_1800
     * @tc.name   : testTelephonyCallManagerDial1800
     * @tc.desc   : Make a phone call and set call parameters. Use callback for asynchronous callback deprecated
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerDial1800', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerDial1800';
      console.info(`${caseName} test start `);
      let dialOptions: call.DialOptions = {}
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dial(rightPhone, dialOptions, (err: BusinessError, data: boolean) => {
              if (data == false) {
                console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.info(`${caseName} success.`);
                ExpectTrue(true);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_HasCall_0200
     * @tc.name   : testTelephonyCallManagerHasCall0200
     * @tc.desc   : Determine if there is a call. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerHasCall0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCall0200';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dialCall(emptyStr).then(() => {
              console.info(`${caseName} dialCall success`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} dialCall fail, err->${JSON.stringify(err)}`);
              call.hasCall((err: BusinessError, data: boolean) => {
                if (err) {
                  console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                  ExpectFail();
                  console.info(`${caseName} test end `);
                  done();
                } else {
                  console.info(`${caseName} success, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end `);
                  done();
                }
              });
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });

    });

    /*
     * @tc.number : SUB_Telephony_CallManager_HasCall_0300
     * @tc.name   : testTelephonyCallManagerHasCall0300
     * @tc.desc   : Determine if there is a call. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerHasCall0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCall0300';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          try {
            call.dialCall(errPhone).then(() => {
              console.info(`${caseName} dialCall success`);
              ExpectFail();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} dialCall fail, err->${JSON.stringify(err)}`);
              call.hasCall((err: BusinessError, data: boolean) => {
                if (err) {
                  console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
                  ExpectFail();
                  console.info(`${caseName} test end `);
                  done();
                } else {
                  console.info(`${caseName} success, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end `);
                  done();
                }
              });
            });
          } catch (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_HasCall_0600
     * @tc.name   : testTelephonyCallManagerHasCall0600
     * @tc.desc   : Determine if there is a call. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerHasCall0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCall0600';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          call.dialCall(emptyStr).then(() => {
            console.info(`${caseName} dialCall success`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} dialCall fail, err->${JSON.stringify(err)}`);
            call.hasCall().then(() => {
              console.info(`${caseName} success`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            });
          });
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_HasCall_0800
     * @tc.name   : testTelephonyCallManagerHasCall0800
     * @tc.desc   : Determine if there is a call. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerHasCall0800', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCall0800';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          call.dialCall(specialPhone).then(() => {
            console.info(`${caseName} dialCall success`);
            call.hasCall().then(() => {
              console.info(`${caseName} success`);
              ExpectTrue(true);
              hangUpCall(caseName);
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
              ExpectFail();
              hangUpCall(caseName);
              console.info(`${caseName} test end `);
              done();
            });
          }).catch((err: BusinessError) => {
            console.info(`${caseName} dialCall fail, err->${JSON.stringify(err)}`);
            console.info(`${caseName} test end `);
            done();
          });
        }
        else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_HasCall_0900
     * @tc.name   : testTelephonyCallManagerHasCall0900
     * @tc.desc   : Determine if there is a call. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerHasCall0900', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCall0900';
      console.info(`${caseName} test start `);
      sim.isSimActive(0, (err: BusinessError, data: boolean) => {
        console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        if (data == true) {
          call.dialCall(errPhone).then(() => {
            console.info(`${caseName} dialCall success`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} dialCall fail, err->${JSON.stringify(err)}`);
            call.hasCall().then(() => {
              console.info(`${caseName} success`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            });
          });
        } else {
          console.info(`${caseName} fail, err->Unactivated sim1 card`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_HasCall_1100
     * @tc.name   : testTelephonyCallManagerHasCall1100
     * @tc.desc   : Determine if there is a call.Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerHasCall1100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCall1100';
      console.info(`${caseName} test start `);
      call.hasCall((err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
        } else {
          console.info(`${caseName} success, data->${JSON.stringify(data)}`);
          ExpectTrue(true);
        }
        console.info(`${caseName} test end `);
        done();
      });
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_0100
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1640100
     * @tc.desc   : Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640100';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            call.dialCall(data, (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} dialCall fail, err->${JSON.stringify(err)}`);
              } else {
                console.info(`${caseName} dialCall success.`);
                hangUpCall(caseName);
              }
              console.info(`${caseName} test end `);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_0150
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1640150
     * @tc.desc   : Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640150', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640150';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(specialPhone, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_0300
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1640300
     * @tc.desc   : Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640300';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(errPhone, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_0400
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1640400
     * @tc.desc   : Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640400';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emergencyPhone, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });


    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_0600
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1640600
     * @tc.desc   : Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640600';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "AAA", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_0700
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1640700
     * @tc.desc   :Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640700', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640700';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          call.dialCall(data, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} dialCall fail, err->${JSON.stringify(err)}`);
            } else {
              console.info(`${caseName} dialCall success.`);
              hangUpCall(caseName);
            }
            console.info(`${caseName} test end `);
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_0900
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1640900
     * @tc.desc   :Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640900', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640900';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(errPhone, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });


    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_1100
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1641100
     * @tc.desc   : Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641100';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emergencyPhone, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_1150
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1641150
     * @tc.desc   : Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641150', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641150';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(specialPhone, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_1200
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1641200
     * @tc.desc   : Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641200';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "AAA").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_1300
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1641300
     * @tc.desc   : Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641300';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164("0980000000", "TW", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_1400
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1641400
     * @tc.desc   : Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641400';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "TW", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test2 end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });
  });
}