/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import { describe, it, expect, beforeAll } from '@ohos/hypium';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.simtest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function Sim2Public() {
  describe('Sim2Public', () => {

    beforeAll(async (done: Function) => {
      console.log('getPermission beforeAll');
      await getPermissions();
      done();
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetDefaultVoiceSlotId_0100
     * @tc.name   : testTelephonySimGetDefaultVoiceSlotId0100
     * @tc.desc   : SIMCard required Obtain the slot ID for the default voice service. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetDefaultVoiceSlotId0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetDefaultVoiceSlotId0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.setDefaultVoiceSlotId(0, (error: BusinessError) => {
            if (error) {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: setDefaultVoiceSlotId success`);
              sim.getDefaultVoiceSlotId((err: BusinessError, data: number) => {
                if (data === 0) {
                  console.info(`${caseName} success: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end `);
                  done();
                } else {
                  ExpectFail();
                  console.info(`${caseName} test end `);
                  done();
                }
              });
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetDefaultVoiceSlotId_0400
     * @tc.name   : testTelephonySimGetDefaultVoiceSlotId0400
     * @tc.desc   : SIMCard required Obtain the slot ID for the default voice service. Use promise for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetDefaultVoiceSlotId0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetDefaultVoiceSlotId0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.setDefaultVoiceSlotId(0).then(() => {
            console.info(`${caseName}: setDefaultVoiceSlotId success`);
            sim.getDefaultVoiceSlotId().then((data: number) => {
              if (data === 0) {
                console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            }).catch((err: BusinessError) => {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            });
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, setDefaultVoiceSlotId promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName}:success has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasOperaterPrivileges_0700
     * @tc.name   : testTelephonySimHasOperaterPrivileges0700
     * @tc.desc   : SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimHasOperaterPrivileges0700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges0700';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has SimCard1,data->${JSON.stringify(data)}`);
          try {
            sim.hasOperatorPrivileges(null, (err: BusinessError, data: boolean) => {
              if (err.code === 401) {
                console.info(`${caseName}:Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}:Parameter error. err->${JSON.stringify(error)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:fail Do not have SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasOperaterPrivileges_0800
     * @tc.name   : testTelephonySimHasOperaterPrivileges0800
     * @tc.desc   : SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimHasOperaterPrivileges0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has SimCard1,data->${JSON.stringify(data)}`);
          sim.hasOperatorPrivileges(-1, (err: BusinessError, data: boolean) => {
            if (err.code === 8300001) {
              console.info(`${caseName}:Invalid parameter value. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:fail Do not have SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasOperaterPrivileges_1600
     * @tc.name   : testTelephonySimHasOperaterPrivileges1600
     * @tc.desc   : SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimHasOperaterPrivileges1600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges1600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has  SimCard1,data->${JSON.stringify(data)}`);
          try {
            sim.hasOperatorPrivileges(null).then((data: boolean) => {
              console.info(`${caseName} success , promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName}:Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}:Parameter error. err->${JSON.stringify(error)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:success has not SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasOperaterPrivileges_1700
     * @tc.name   : testTelephonySimHasOperaterPrivileges1700
     * @tc.desc   : SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimHasOperaterPrivileges1700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges1700';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has  SimCard1,data->${JSON.stringify(data)}`);
          sim.hasOperatorPrivileges(-1).then((data: boolean) => {
            console.info(`${caseName} success   , promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName}:Invalid parameter value. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:success has not SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0100
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0100
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0, (err: BusinessError, data: string) => {
            if (data.length > 0) {
              console.info(`${caseName}: success data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0300
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0300
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(-1, (err: BusinessError, data: string) => {
            if (err.code === 8300001) {
              console.info(`${caseName}: Invalid parameter value success  data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0400
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0400
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            sim.getISOCountryCodeForSim(null, (err: BusinessError, data: string) => {
              if (err.code === 401) {
                console.info(`${caseName}: Parameter error success  data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName}: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}: Parameter error success  data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0800
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0800
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success have card,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0).then((data: string) => {
            if (data.length > 0) {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_1000
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim1000
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim1000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          sim.getISOCountryCodeForSim(-1).then((data: string) => {
            console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} success Invalid parameter value., promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_1100
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim1100
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim1100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          try {
            sim.getISOCountryCodeForSim(null).then((data: string) => {
              console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName} success Parameter error, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} success Parameter error, promise: error->${JSON.stringify(error)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSimSync_0100
     * @tc.name   : testTelephonySimGetISOCountryCodeForSimSync0100
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetISOCountryCodeForSimSync0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSimSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            let countryCode: string = sim.getISOCountryCodeForSimSync(0);
            if (countryCode.length > 0) {
              console.info(`${caseName} success:` + countryCode);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          } catch (err) {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSimSync_0300
     * @tc.name   : testTelephonySimGetISOCountryCodeForSimSync0300
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetISOCountryCodeForSimSync0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSimSync0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            let countryCode: string = sim.getISOCountryCodeForSimSync(-1);
            if (countryCode.length === 0) {
              console.info(`${caseName} success:` + countryCode);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          } catch (err) {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumeric_0100
     * @tc.name   : testTelephonySimGetSimOperatorNumeric0100
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimOperatorNumeric0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(0, (err: BusinessError, data: string) => {
            if (data.length > 0) {
              console.info(`${caseName}: success err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:success has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumeric_0300
     * @tc.name   : testTelephonySimGetSimOperatorNumeric0300
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimOperatorNumeric0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(-1, (err: BusinessError, data: string) => {
            if (err.code === 8300001) {
              console.info(`${caseName}: success Invalid parameter value err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumeric_0400
     * @tc.name   : testTelephonySimGetSimOperatorNumeric0400
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimOperatorNumeric0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            sim.getSimOperatorNumeric(null, (err: BusinessError, data: string) => {
              if (err.code === 401) {
                console.info(`${caseName}: success Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}: success Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumeric_0800
     * @tc.name   : testTelephonySimGetSimOperatorNumeric0800
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimOperatorNumeric0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(0).then((data: string) => {
            if (data.length > 0) {
              console.info(`${caseName}  success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName}  failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName} :failed hasSimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumeric_1000
     * @tc.name   : testTelephonySimGetSimOperatorNumeric1000
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimOperatorNumeric1000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(-1).then((data: string) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} success Invalid parameter value, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:failed hasSimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumeric_1100
     * @tc.name   : testTelephonySimGetSimOperatorNumeric1100
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimOperatorNumeric1100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            sim.getSimOperatorNumeric(null).then((data: string) => {
              console.info(`${caseName}  success, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName}  success Parameter value, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName}  failed, promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}  success Parameter value, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}  failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName} :failed hasSimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumericSync_0100
     * @tc.name   : testTelephonySimGetSimOperatorNumericSync0100
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetSimOperatorNumericSync0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumericSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          let numeric: string = sim.getSimOperatorNumericSync(0);
          if (numeric.length > 0) {
            console.info(`${caseName}the sim operator numeric is success:` + numeric);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName}the sim operator numeric  is:` + numeric);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimOperatorNumericSync_0300
     * @tc.name   : testTelephonySimGetSimOperatorNumericSync0300
     * @tc.desc   : SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetSimOperatorNumericSync0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumericSync0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          let numeric: string = sim.getSimOperatorNumericSync(-1);
          if (numeric.length === 0) {
            console.info(`${caseName}the sim operator numeric is success:` + numeric);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName}the sim operator numeric  is:` + numeric);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0100
     * @tc.name   : testTelephonySimGetSimState0100
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimState0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0, (err: BusinessError, data: sim.SimState) => {
            if (!err) {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              const simStateAry: number[] = [
              sim.SimState.SIM_STATE_UNKNOWN,
              sim.SimState.SIM_STATE_LOCKED,
              sim.SimState.SIM_STATE_NOT_PRESENT,
              sim.SimState.SIM_STATE_NOT_READY,
              sim.SimState.SIM_STATE_LOADED,
              sim.SimState.SIM_STATE_READY
              ]
              ExpectTrue(simStateAry.includes(data));
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0300
     * @tc.name   : testTelephonySimGetSimState0300
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimState0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getSimState(null, (err: BusinessError, data: sim.SimState) => {
              if (err.code === 401) {
                console.info(`${caseName} 	Parameter error callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} 	Parameter error callback: err->${JSON.stringify(error)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0400
     * @tc.name   : testTelephonySimGetSimState0400
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimState0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1, (err: BusinessError, data: sim.SimState) => {
            if (err.code === 8300001) {
              console.info(`${caseName} 	Invalid parameter value. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0600
     * @tc.name   : testTelephonySimGetSimState0600
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimState0600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0).then((data: sim.SimState) => {
            console.info(`${caseName}getSimState success, promise: data->${JSON.stringify(data)}`);
            const simStateAry: number[] = [
            sim.SimState.SIM_STATE_UNKNOWN,
            sim.SimState.SIM_STATE_LOCKED,
            sim.SimState.SIM_STATE_NOT_PRESENT,
            sim.SimState.SIM_STATE_NOT_READY,
            sim.SimState.SIM_STATE_LOADED,
            sim.SimState.SIM_STATE_READY
            ]
            ExpectTrue(simStateAry.includes(data));
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName}getSimState failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0800
     * @tc.name   : testTelephonySimGetSimState0800
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimState0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getSimState(null).then((data: sim.SimState) => {
              console.info(`${caseName} getSimState success, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName} getSimState failed Parameter error, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} getSimState failed Parameter error, promise: err->${JSON.stringify(error)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0900
     * @tc.name   : testTelephonySimGetSimState0900
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimState0900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1).then((data: sim.SimState) => {
            console.info(`${caseName} getSimState success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} getSimState failed Invalid parameter value, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimCardType_0100
     * @tc.name   : testTelephonySimGetSimCardType0100
     * @tc.desc   : SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback..
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimCardType0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(0, (err: BusinessError, data: sim.CardType) => {
            if (!err) {
              console.info(`${caseName}  callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              const simStateAry: number[] = [
              sim.CardType.UNKNOWN_CARD,
              sim.CardType.SINGLE_MODE_SIM_CARD,
              sim.CardType.SINGLE_MODE_USIM_CARD,
              sim.CardType.SINGLE_MODE_RUIM_CARD,
              sim.CardType.DUAL_MODE_CG_CARD,
              sim.CardType.CT_NATIONAL_ROAMING_CARD,
              sim.CardType.CU_DUAL_MODE_CARD,
              sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
              sim.CardType.DUAL_MODE_UG_CARD,
              sim.CardType.SINGLE_MODE_ISIM_CARD
              ];
              ExpectTrue(simStateAry.includes(data));
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimCardType_0300
     * @tc.name   : testTelephonySimGetSimCardType0300
     * @tc.desc   : SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback..
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimCardType0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getCardType(null, (err: BusinessError, data: sim.CardType) => {
              if (err.code === 401) {
                console.info(`${caseName} Parameter error. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} Parameter error. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimCardType_0400
     * @tc.name   : testTelephonySimGetSimCardType0400
     * @tc.desc   : SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback..
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimCardType0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(-1, (err: BusinessError, data: sim.CardType) => {
            if (err.code === 8300001) {
              console.info(`${caseName} Invalid parameter value. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimCardType_0800
     * @tc.name   : testTelephonySimGetSimCardType0800
     * @tc.desc   : SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimCardType0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(0).then((data: sim.CardType) => {
            const simStateAry: number[] = [
            sim.CardType.UNKNOWN_CARD,
            sim.CardType.SINGLE_MODE_SIM_CARD,
            sim.CardType.SINGLE_MODE_USIM_CARD,
            sim.CardType.SINGLE_MODE_RUIM_CARD,
            sim.CardType.DUAL_MODE_CG_CARD,
            sim.CardType.CT_NATIONAL_ROAMING_CARD,
            sim.CardType.CU_DUAL_MODE_CARD,
            sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
            sim.CardType.DUAL_MODE_UG_CARD,
            sim.CardType.SINGLE_MODE_ISIM_CARD
            ];
            const isCard: boolean = simStateAry.includes(data);
            if (isCard) {
              console.info(`${caseName} getCardType success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} getCardType failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimCardType_1000
     * @tc.name   : testTelephonySimGetSimCardType1000
     * @tc.desc   : SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimCardType1000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getCardType(null).then((data: sim.CardType) => {
              console.info(`${caseName} getCardType failed, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName} Parameter error. getCardType success, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} Parameter error. getCardType success, promise: err->${JSON.stringify(error)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimCardType_1100
     * @tc.name   : testTelephonySimGetSimCardType1100
     * @tc.desc   : SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimCardType1100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(-1).then((data: sim.CardType) => {
            console.info(`${caseName} getCardType failed, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} Invalid parameter value. getCardType success, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimCardTypeSync_0100
     * @tc.name   : testTelephonySimGetSimCardTypeSync0100
     * @tc.desc   : SIMCard required Obtain the SIM card type for the specified slot.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetSimCardTypeSync0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardTypeSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          let cardType: sim.CardType = sim.getCardTypeSync(0);
          const simStateAry: number[] = [
          sim.CardType.UNKNOWN_CARD,
          sim.CardType.SINGLE_MODE_SIM_CARD,
          sim.CardType.SINGLE_MODE_USIM_CARD,
          sim.CardType.SINGLE_MODE_RUIM_CARD,
          sim.CardType.DUAL_MODE_CG_CARD,
          sim.CardType.CT_NATIONAL_ROAMING_CARD,
          sim.CardType.CU_DUAL_MODE_CARD,
          sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
          sim.CardType.DUAL_MODE_UG_CARD,
          sim.CardType.SINGLE_MODE_ISIM_CARD
          ];
          ExpectTrue(simStateAry.includes(cardType));
          console.info(`${caseName} the card type is:` + cardType);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetMaxSimCount_0100
     * @tc.name   : testTelephonySimGetMaxSimCount0100
     * @tc.desc   : Obtain the number of card slots.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetMaxSimCount0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetMaxSimCount0100';
      console.info(`${caseName} test start `);
      let maxSimCount: number = sim.getMaxSimCount();
      ExpectTrue(maxSimCount >= 0);
      console.info(`${caseName} test end `);
      done();
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0100
     * @tc.name   : testTelephonySimHasSimCard0100
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0300
     * @tc.name   : testTelephonySimHasSimCard0300
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0300';
      console.info(`${caseName} test start `);
      try {
        sim.hasSimCard(null, (err: BusinessError, data: boolean) => {
          if (err.code === 401) {
            console.info(`${caseName}	Parameter error.: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName}	Parameter error.: err->${JSON.stringify(error)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0400
     * @tc.name   : testTelephonySimHasSimCard0400
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(-1, (err: BusinessError, data: boolean) => {
        if (err.code === 8300001) {
          console.info(`${caseName}	Invalid parameter value: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0600
     * @tc.name   : testTelephonySimHasSimCard0600
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0).then((data: boolean) => {
        if (data) {
          console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}:data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      }).catch((err: BusinessError) => {
        console.info(`hasSimCard failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      });
    });
  });
}