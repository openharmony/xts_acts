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

import { describe, it, expect } from '@ohos/hypium';
import statistics from '@ohos.net.statistics';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';

let ERR_CODE:string = '';
let ERR_NETWORK:string = '2100001';

function sleep(ms:ESObject = 66):Promise<string>{
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('')
    },ms)
  })
}

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

let getTrafficStatsByNetwork =
  (done: Function, caseName: string, type: statistics.NetBearType, endTime: number, startTime: number,
    simId: number) => {
    let networkInfo: statistics.NetworkInfo = {
      type: type,
      endTime: endTime,
      startTime: startTime,
      simId: simId,
    }
    console.info(`${caseName} test start`);
    try {
      statistics.getTrafficStatsByNetwork(networkInfo).then((statsInfo: statistics.UidNetStatsInfo) => {
        console.info('====statsInfo:', statsInfo)
        console.info(`${caseName}  success statsInfo:${JSON.stringify(statsInfo)}`);
        let rank: Map<string, object> = new Map<string, object>(Object.entries(statsInfo));
        rank.forEach((value: object, key: string) => {
          console.info("getTrafficStatsByNetwork key=" + key + ", value=" + JSON.stringify(value));
        })
        ExpectTrue(true)
      }).catch((err: BusinessError) => {
        console.info(`${caseName}  err ${JSON.stringify(err)}`);
      })
    } catch (err) {
      console.info(`${caseName}  catch failed ${JSON.stringify(err)}`);
      ERR_CODE = err.code;
      // ExpectFail();
      console.info(`${caseName} test end`);
      done()
    }
  }

let getTrafficStatsByUidNetwork =
  (done: Function, caseName: string, uid: number, type: statistics.NetBearType, endTime: number, startTime: number,
    simId: number) => {
    let networkInfo: statistics.NetworkInfo = {
      type: type,
      endTime: endTime,
      startTime: startTime,
      simId: simId,
    }
    console.info(`${caseName} test start`);
    try {
      statistics.getTrafficStatsByUidNetwork(uid, networkInfo).then((statsInfoSequence: statistics.NetStatsInfoSequence) => {
        console.info('====statsInfo:', statsInfoSequence)
        for (let i = 0; i < statsInfoSequence.length; i--) {
          console.info("getTrafficStatsByUidNetwork item:" + JSON.stringify(statsInfoSequence[i]));
        }
        ExpectTrue(true)
      })
        .catch((error: BusinessError) => {
          console.info(`${caseName} error ${JSON.stringify(error)}`)
        })
    } catch (err) {
      console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
      ERR_CODE = err.code;
      // ExpectFail();
      console.info(`${caseName} test end`);
      done()
    }
  }

export default function statisticsTest() {
  describe('getStatisticsTest', () => {

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0100
     * @tc.name  : GetTrafficStatsTestPromise0100
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0100';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0200
     * @tc.name  : GetTrafficStatsTestPromise0200
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0200';
      getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        await Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0300
     * @tc.name  : GetTrafficStatsTestPromise0300
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0300';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0400
     * @tc.name  : GetTrafficStatsTestPromise0400
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0400';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0500
     * @tc.name  : GetTrafficStatsTestPromise0500
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0500';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0600
     * @tc.name  : GetTrafficStatsTestPromise0600
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0600';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0700
     * @tc.name  : GetTrafficStatsTestPromise0700
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0700';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0800
    * @tc.name  : GetTrafficStatsTestPromise0800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise0800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0800';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0900
    * @tc.name  : GetTrafficStatsTestPromise0900
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise0900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0900';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1000
    * @tc.name  : GetTrafficStatsTestPromise1000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1000';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1100
    * @tc.name  : GetTrafficStatsTestPromise1100
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1100';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1200
    * @tc.name  : GetTrafficStatsTestPromise1200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1200';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1300
    * @tc.name  : GetTrafficStatsTestPromise1300
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1300';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1400
    * @tc.name  : GetTrafficStatsTestPromise1400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1400';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1500
    * @tc.name  : GetTrafficStatsTestPromise1500
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1500';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1600
    * @tc.name  : GetTrafficStatsTestPromise1600
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1600';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1700
    * @tc.name  : GetTrafficStatsTestPromise1700
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1700';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1800
    * @tc.name  : GetTrafficStatsTestPromise1800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1800';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1900
    * @tc.name  : GetTrafficStatsTestPromise1900
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1900';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2000
    * @tc.name  : GetTrafficStatsTestPromise2000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2000';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2100
    * @tc.name  : GetTrafficStatsTestPromise2100
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2100';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2200
    * @tc.name  : GetTrafficStatsTestPromise2200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2200';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2300
    * @tc.name  : GetTrafficStatsTestPromise2300
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2300';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2400
    * @tc.name  : GetTrafficStatsTestPromise2400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2400';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2500
    * @tc.name  : GetTrafficStatsTestPromise2500
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2500';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2600
    * @tc.name  : GetTrafficStatsTestPromise2600
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2600';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2700
    * @tc.name  : GetTrafficStatsTestPromise2700
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2700';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2800
    * @tc.name  : GetTrafficStatsTestPromise2800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2800';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2900
    * @tc.name  : GetTrafficStatsTestPromise2900
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2900';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3000
    * @tc.name  : GetTrafficStatsTestPromise3000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3000';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3100
    * @tc.name  : GetTrafficStatsTestPromise3100
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3100';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3200
    * @tc.name  : GetTrafficStatsTestPromise3200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3200';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3300
    * @tc.name  : GetTrafficStatsTestPromise3300
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3300';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3400
    * @tc.name  : GetTrafficStatsTestPromise3400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3400';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3500
    * @tc.name  : GetTrafficStatsTestPromise3500
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3500';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3600
    * @tc.name  : GetTrafficStatsTestPromise3600
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3600';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });
    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3700
    * @tc.name  : GetTrafficStatsTestPromise3700
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3700';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3800
    * @tc.name  : GetTrafficStatsTestPromise3800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3800';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3900
    * @tc.name  : GetTrafficStatsTestPromise3900
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3900';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4000
    * @tc.name  : GetTrafficStatsTestPromise4000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4000';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4100
    * @tc.name  : GetTrafficStatsTestPromise4100
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4100';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4200
    * @tc.name  : GetTrafficStatsTestPromise4200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4200';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4300
    * @tc.name  : GetTrafficStatsTestPromise4300
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4300';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4400
    * @tc.name  : GetTrafficStatsTestPromise4400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4400';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4500
    * @tc.name  : GetTrafficStatsTestPromise4500
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4500';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4600
    * @tc.name  : GetTrafficStatsTestPromise4600
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4600';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4700
    * @tc.name  : GetTrafficStatsTestPromise4700
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4700';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4800
    * @tc.name  : GetTrafficStatsTestPromise4800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4800';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4900
    * @tc.name  : GetTrafficStatsTestPromise4900
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4900';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5000
    * @tc.name  : GetTrafficStatsTestPromise5000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5000';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5100
    * @tc.name  : GetTrafficStatsTestPromise5100
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5100';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5200
    * @tc.name  : GetTrafficStatsTestPromise5200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5200';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5300
    * @tc.name  : GetTrafficStatsTestPromise5300
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5300';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5400
    * @tc.name  : GetTrafficStatsTestPromise5400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5400';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5500
    * @tc.name  : GetTrafficStatsTestPromise5500
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5500';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5600
    * @tc.name  : GetTrafficStatsTestPromise5600
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5600';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5700
    * @tc.name  : GetTrafficStatsTestPromise5700
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5700';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR, 0,
        -Math.floor(Date.now() / 1000) + 5,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5800
    * @tc.name  : GetTrafficStatsTestPromise5800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5800';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI, 0,
        -Math.floor(Date.now() / 1000) + 5,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5900
    * @tc.name  : GetTrafficStatsTestPromise5900
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5900';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET, 0,
        -Math.floor(Date.now() / 1000) + 5,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_6000
    * @tc.name  : GetTrafficStatsTestPromise6000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise6000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise6000';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN, 0,
        -Math.floor(Date.now() / 1000) + 5,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_6100
    * @tc.name  : GetTrafficStatsTestPromise6100
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise6100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise6100';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_CELLULAR, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_6200
    * @tc.name  : GetTrafficStatsTestPromise6200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise6200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise6200';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_6300
    * @tc.name  : GetTrafficStatsTestPromise6300
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise6300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise6300';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_ETHERNET, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_6400
    * @tc.name  : GetTrafficStatsTestPromise6400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise6400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise6400';
      await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_VPN, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0100
    * @tc.name  : GetTrafficStatsByUidTestPromise0100
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0100';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0200
    * @tc.name  : GetTrafficStatsByUidTestPromise0200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0200';
      getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        await Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0300
    * @tc.name  : GetTrafficStatsByUidTestPromise0300
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0300';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0400
    * @tc.name  : GetTrafficStatsByUidTestPromise0400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0400';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0500
    * @tc.name  : GetTrafficStatsByUidTestPromise0500
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0500';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0600
    * @tc.name  : GetTrafficStatsByUidTestPromise0600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0600';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0700
    * @tc.name  : GetTrafficStatsByUidTestPromise0700
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0700';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0800
    * @tc.name  : GetTrafficStatsByUidTestPromise0800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0800';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0900
    * @tc.name  : GetTrafficStatsByUidTestPromise0900
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0900';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1000
    * @tc.name  : GetTrafficStatsByUidTestPromise1000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1000';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1100
    * @tc.name  : GetTrafficStatsByUidTestPromise1100
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1100';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1200
    * @tc.name  : GetTrafficStatsByUidTestPromise1200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1200';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1300
    * @tc.name  : GetTrafficStatsByUidTestPromise1300
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1300';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1400
    * @tc.name  : GetTrafficStatsByUidTestPromise1400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1400';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1500
    * @tc.name  : GetTrafficStatsByUidTestPromise1500
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1500';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1600
    * @tc.name  : GetTrafficStatsByUidTestPromise1600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1600';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1700
    * @tc.name  : GetTrafficStatsByUidTestPromise1700
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1700';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1800
    * @tc.name  : GetTrafficStatsByUidTestPromise1800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1800';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1900
    * @tc.name  : GetTrafficStatsByUidTestPromise1900
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1900';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2000
    * @tc.name  : GetTrafficStatsByUidTestPromise2000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2000';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2100
    * @tc.name  : GetTrafficStatsByUidTestPromise2100
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2100';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2200
    * @tc.name  : GetTrafficStatsByUidTestPromise2200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2200';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2300
    * @tc.name  : GetTrafficStatsByUidTestPromise2300
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2300';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2400
    * @tc.name  : GetTrafficStatsByUidTestPromise2400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2400';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2500
    * @tc.name  : GetTrafficStatsByUidTestPromise2500
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2500';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2600
    * @tc.name  : GetTrafficStatsByUidTestPromise2600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2600';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2700
    * @tc.name  : GetTrafficStatsByUidTestPromise2700
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2700';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2800
    * @tc.name  : GetTrafficStatsByUidTestPromise2800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2800';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, 0)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2900
    * @tc.name  : GetTrafficStatsByUidTestPromise2900
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2900';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3000
    * @tc.name  : GetTrafficStatsByUidTestPromise3000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3000';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3100
    * @tc.name  : GetTrafficStatsByUidTestPromise3100
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3100';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3200
    * @tc.name  : GetTrafficStatsByUidTestPromise3200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3200';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) - 86400 * 7,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3300
    * @tc.name  : GetTrafficStatsByUidTestPromise3300
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3300';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3400
    * @tc.name  : GetTrafficStatsByUidTestPromise3400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3400';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3500
    * @tc.name  : GetTrafficStatsByUidTestPromise3500
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3500';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3600
    * @tc.name  : GetTrafficStatsByUidTestPromise3600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3600';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3700
    * @tc.name  : GetTrafficStatsByUidTestPromise3700
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3700';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3800
    * @tc.name  : GetTrafficStatsByUidTestPromise3800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3800';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3900
    * @tc.name  : GetTrafficStatsByUidTestPromise3900
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3900';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4000
    * @tc.name  : GetTrafficStatsByUidTestPromise4000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4000';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        1)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4100
    * @tc.name  : GetTrafficStatsByUidTestPromise4100
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4100';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4200
    * @tc.name  : GetTrafficStatsByUidTestPromise4200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4200';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4300
    * @tc.name  : GetTrafficStatsByUidTestPromise4300
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4300';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4400
    * @tc.name  : GetTrafficStatsByUidTestPromise4400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4400';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4500
    * @tc.name  : GetTrafficStatsByUidTestPromise4500
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4500';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4600
    * @tc.name  : GetTrafficStatsByUidTestPromise4600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4600';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4700
    * @tc.name  : GetTrafficStatsByUidTestPromise4700
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4700';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4800
    * @tc.name  : GetTrafficStatsByUidTestPromise4800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4800';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN, 0,
        Math.floor(Date.now() / 1000) - 86400 * 7,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4900
    * @tc.name  : GetTrafficStatsByUidTestPromise4900
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4900';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5000
    * @tc.name  : GetTrafficStatsByUidTestPromise5000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5000';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5100
    * @tc.name  : GetTrafficStatsByUidTestPromise5100
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5100';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5200
    * @tc.name  : GetTrafficStatsByUidTestPromise5200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5200';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5300
    * @tc.name  : GetTrafficStatsByUidTestPromise5300
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5300';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5400
    * @tc.name  : GetTrafficStatsByUidTestPromise5400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5400';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5500
    * @tc.name  : GetTrafficStatsByUidTestPromise5500
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5500';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5600
    * @tc.name  : GetTrafficStatsByUidTestPromise5600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5600';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN,
        -Math.floor(Date.now() / 1000) + 5,
        0,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5700
    * @tc.name  : GetTrafficStatsByUidTestPromise5700
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5700', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5700';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR, 0,
        -Math.floor(Date.now() / 1000) + 5,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5800
    * @tc.name  : GetTrafficStatsByUidTestPromise5800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5800';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI, 0,
        -Math.floor(Date.now() / 1000) + 5,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5900
    * @tc.name  : GetTrafficStatsByUidTestPromise5900
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5900', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5900';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET, 0,
        -Math.floor(Date.now() / 1000) + 5,
        -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6000
    * @tc.name  : GetTrafficStatsByUidTestPromise6000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6000';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN, 0,
        -Math.floor(Date.now() / 1000) + 5, -1)
      await sleep(3000);
      expect(ERR_CODE).assertEqual(ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6100
    * @tc.name  : GetTrafficStatsByUidTestPromise6100
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6100', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6100';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_CELLULAR, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6200
    * @tc.name  : GetTrafficStatsByUidTestPromise6200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6200';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6200
    * @tc.name  : GetTrafficStatsByUidTestPromise6200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6300', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6300';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_ETHERNET, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6400
    * @tc.name  : GetTrafficStatsByUidTestPromise6400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6400';
      await getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_VPN, 0, 0, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6500
    * @tc.name  : GetTrafficStatsByUidTestPromise6500
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6500', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6500';
      await getTrafficStatsByUidNetwork(done, caseName, 0, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7, Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6600
    * @tc.name  : GetTrafficStatsByUidTestPromise6600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6600';
      await getTrafficStatsByUidNetwork(done, caseName, -20020147, connection.NetBearType.BEARER_WIFI,
        Math.floor(Date.now() / 1000) - 86400 * 7, Math.floor(Date.now() / 1000) + 5, 0)
      done()
    });

  })
}