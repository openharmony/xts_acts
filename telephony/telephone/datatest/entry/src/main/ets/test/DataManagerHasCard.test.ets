/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function dataManagerTest() {
  describe('DataManagerTest', () => {
    beforeAll(async (done: Function) => {
      await data.setDefaultCellularDataSlotId(0);
      await data.enableCellularData();
      done();
    });
    afterAll(async (done: Function) => {
      await data.setDefaultCellularDataSlotId(0);
      await data.enableCellularData();
      await data.disableCellularDataRoaming(0);
      done();
    });
    /* *
    * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0100
    * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId0100
    * @tc.desc  : Get the SIM card for default mobile data.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetDefaultCellularDataSlotId0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0100';
      console.info(`${caseName} test start `);
      try {
        data.getDefaultCellularDataSlotId((err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data != null);
          }
          done();
        });
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0200
     * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId0200
     * @tc.desc  : Get the SIM card for default mobile data.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
    */
    it('testTelephonyDataGetDefaultCellularDataSlotId0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0200';
      console.info(`${caseName} test start `);
      try {
        // Set the SIM card for default mobile data;
        await data.setDefaultCellularDataSlotId(0);
        data.getDefaultCellularDataSlotId((err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data == 0);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} catcherr->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0300
    * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId0300
    * @tc.desc  : Get the SIM card for default mobile data.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetDefaultCellularDataSlotId0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0300';
      console.info(`${caseName} test start `);
      try {
        // Get the SIM card ID of the default mobile data;
        let cardId: number = data.getDefaultCellularDataSimId();
        console.info(`${caseName} cardId->${JSON.stringify(cardId)}`);
        data.getDefaultCellularDataSlotId((err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data != null);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0400
    * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId0400
    * @tc.desc  : Get the SIM card for default mobile data.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetDefaultCellularDataSlotId0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0400';
      console.info(`${caseName} test start `);
      try {
        data.getDefaultCellularDataSlotId().then((data: number) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(data != null);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0500
     * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId0500
     * @tc.desc  : Get the SIM card for default mobile data.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
    */
    it('testTelephonyDataGetDefaultCellularDataSlotId0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0500';
      console.info(`${caseName} test start `);
      try {
        // Set the default card first;
        await data.setDefaultCellularDataSlotId(0);
        data.getDefaultCellularDataSlotId().then((data: number) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(data == 0);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catcherr->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0600
    * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId0600
    * @tc.desc  : Get the SIM card for default mobile data.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
     */
    it('testTelephonyDataGetDefaultCellularDataSlotId0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0600';
      console.info(`${caseName} test start `);
      try {
        // Get the SIM card ID of the default mobile data ID;
        let cardId: number = data.getDefaultCellularDataSimId();
        console.info(`${caseName} cardId->${JSON.stringify(cardId)}`);
        ExpectTrue(cardId != null);
        data.getDefaultCellularDataSlotId().then((data: number) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0100
     * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotIdSync0100
     * @tc.desc  : Get the SIM card for default mobile data.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyDataGetDefaultCellularDataSlotIdSync0100', 0, (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync0100';
      console.info(`${caseName} test start `);
      try {
        let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
        console.info(`${caseName} cardSlot->${JSON.stringify(cardSlot)}`);
        ExpectTrue(cardSlot !== null);
        done();
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0200
     * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotIdSync0200
     * @tc.desc  : Get the SIM card for default mobile data.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyDataGetDefaultCellularDataSlotIdSync0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync0200';
      console.info(`${caseName} test start `);
      try {
        // Set the default card first;
        await data.setDefaultCellularDataSlotId(0);
        let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
        console.info(`${caseName} cardSlot->${JSON.stringify(cardSlot)}`);
        ExpectTrue(cardSlot == 0);
        done();
      } catch (err) {
        console.info(`${caseName} catchError->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0300
    * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotIdSync0300
    * @tc.desc  : Get the SIM card for default mobile data.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetDefaultCellularDataSlotIdSync0300', 0, (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync0300';
      console.info(`${caseName} test start `);
      try {
        // Get the SIM card ID of the default mobile data ID;
        let cardId: number = data.getDefaultCellularDataSimId();
        console.info(`${caseName} cardId->${JSON.stringify(cardId)}`);
        ExpectTrue(cardId !== null);
        try {
          let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
          console.info(`${caseName} cardSlot->${JSON.stringify(cardSlot)}`);
          ExpectTrue(cardSlot != null);
          done();
        } catch (error) {
          console.info(`${caseName} catchError->${JSON.stringify(error)}`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0100
    * @tc.name  : testTelephonyDataGetCellularDataFlowType0100
    * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
   */
    it('testTelephonyDataGetCellularDataFlowType0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0100';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataFlowType((err: BusinessError, data: data.DataFlowType) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(data !== null);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0200
    * @tc.name  : testTelephonyDataGetCellularDataFlowType0200
    * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetCellularDataFlowType0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0200';
      console.info(`${caseName} test start `);
      try {
        // Turn off cellular data;
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          await data.disableCellularData();
          data.getCellularDataFlowType(async (err: BusinessError, data: data.DataFlowType) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              // The state of not having a net.
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      await data.enableCellularData();
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0600
    * @tc.name  : testTelephonyDataGetCellularDataFlowType0600
    * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
     */
    it('testTelephonyDataGetCellularDataFlowType0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0600';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataFlowType().then((data: data.DataFlowType) => {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data !== null);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0700
    * @tc.name  : testTelephonyDataGetCellularDataFlowType0700
    * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetCellularDataFlowType0700', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0700';
      console.info(`${caseName} test start `);
      try {
        // Turn off cellular data;
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          await data.disableCellularData();
          data.getCellularDataFlowType().then((data: data.DataFlowType) => {
            // The state of not having a net.
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      await data.enableCellularData();
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_GetCellularDataState_0100
     * @tc.name  : testTelephonyDataGetCellularDataState0100
     * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
    */
    it('testTelephonyDataGetCellularDataState0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0100';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(data !== null);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataState_0200
    * @tc.name  : testTelephonyDataGetCellularDataState0200
    * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetCellularDataState0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0200';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          let isEnable: boolean = await data.isCellularDataEnabled();
          if (isEnable) {
            data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
              if (err) {
                console.info(`${caseName} err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
              } else {
                // Start the cellular data with the status of linked;
                console.info(`${caseName} data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                done();
              }
            });
          } else {
            data.enableCellularData((err: BusinessError) => {
              if (err) {
                console.info(`${caseName} enableCellularData err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
              }
              data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
                if (err) {
                  console.info(`${caseName}  etCellularDataState_err->${JSON.stringify(err)}`);
                  ExpectTrue(false);
                  done();
                } else {
                  // Start the cellular data with the status of linked;
                  console.info(`${caseName} getCellularDataState_data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            });
          }
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      await data.enableCellularData();
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataState_0300
    * @tc.name  : testTelephonyDataGetCellularDataState0300
    * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetCellularDataState0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0300';
      console.info(`${caseName} test start `);
      try {
        // Disable Cellular data Service;
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          await data.disableCellularData();
          data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              // Indicates that the cellular data link is down;
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      await data.enableCellularData();
      console.info(`${caseName} test end `);
    });
  }
  );
}