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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import eSIM from '@ohos.telephony.esim';

const SLOT_0: number = 0;
const SLOT_1: number = -1;
const SLOT_2: null = null;
const PORT_INDEX: number = 0;
let isEsimSupport: boolean = false;
let forceDisableProfile: boolean = false;
let switchAfterDownload: boolean = false;
let iccid: string = 'test';
let nickname: string = 'testName';
let options: eSIM.ResetOption = eSIM.ResetOption.DELETE_OPERATIONAL_PROFILES;
let address: string = 'test';
let transactionId: string = '';
let cancelReason: eSIM.CancelReason = eSIM.CancelReason.CANCEL_REASON_END_USER_REJECTION;

let profile: eSIM.DownloadableProfile = {
  activationCode: '123456',
  confirmationCode: '',
  carrierName: '',
  accessRules:[{
    certificateHashHexStr: '',
    packageName: '',
    accessType: 0
  }]
};

export default function EsimTest() {
  describe('EsimTest', () => {
    beforeAll(async (done: Function) => {
      try {
        isEsimSupport = eSIM.isSupported(SLOT_0);
        if (isEsimSupport) {
          console.info(`eSIM is supported`);
        }
        done();
      } catch (err) {
        console.info(`an error occurred to check eSIM, ${JSON.stringify(err)}`);
        done();
      }
    });
    beforeEach(() => {
      console.log(`beforeEach come in`);
    })
    afterEach(async () => {
      console.log(`afterEach come in`);
    })
    afterAll(() => {
      console.log(`afterAll come in`);
    })

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0100
     * @tc.name      : testTelephonyEsimIsSupported0100
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0100';
      console.info(`${caseName} test start`);
      let isEsimSupport: boolean = eSIM.isSupported(SLOT_0);
      if (isEsimSupport) {
        console.info(`eSIM is supported`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } else {
        console.info(`${caseName} eSIM is not supported`);
        expect().assertFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0200
     * @tc.name      : testTelephonyEsimIsSupported0200
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0200';
      console.info(`${caseName} test start`);
      try {
        let data: boolean = eSIM.isSupported(SLOT_1);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} IsSupported failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0300
     * @tc.name      : testTelephonyEsimIsSupported0300
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0300';
      console.info(`${caseName} test start`);
      try {
        let data: boolean = eSIM.isSupported(SLOT_2);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} IsSupported failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_0400
     * @tc.name      : testTelephonyEsimGetEid0400
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid0400';
      console.info(`${caseName} test start`);
      let data: string = eSIM.getEid(SLOT_0);
      if (data.length != 0) {
        console.info(`${caseName} success : the EID is:${data}`);
                expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } else {
        console.info(`${caseName} err Return an empty EID`);
        expect().assertFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_0500
     * @tc.name      : testTelephonyEsimGetEid0500
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid0500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid0500';
      console.info(`${caseName} test start`);
      try {
        let data: string = eSIM.getEid(SLOT_1);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_0600
     * @tc.name      : testTelephonyEsimGetEid0600
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid0600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid0600';
      console.info(`${caseName} test start`);
      try {
        let data: string = eSIM.getEid(SLOT_2);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });


    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_0700
     * @tc.name      : testTelephonyEsimGetOsuStatus0700
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus0700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus0700';
      console.info(`${caseName} test start`);
      eSIM.getOsuStatus(SLOT_0).then((data: eSIM.OsuStatus) => {
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_0800
     * @tc.name      : testTelephonyEsimGetOsuStatus0800
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus0800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_1);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_0900
     * @tc.name      : testTelephonyEsimGetOsuStatus0900
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus0900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus0900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_2);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_1000
     * @tc.name      : testTelephonyEsimStartOsu1000
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu1000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu1000';
      console.info(`${caseName} test start`);
      eSIM.startOsu(SLOT_0).then((data: eSIM.OsuStatus) => {
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_1100
     * @tc.name      : testTelephonyEsimStartOsu1100
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu1100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu1100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_1);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_1200
     * @tc.name      : testTelephonyEsimStartOsu1200
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu1200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu1200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_2);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_1300
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata1300
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata1300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata1300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_1, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_1400
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata1400
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata1400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata1400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_2, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_1500
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles1500
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles1500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles1500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_1, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_1600
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles1600
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles1600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles1600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_2, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_1700
     * @tc.name      : testTelephonyEsimDownloadProfile1700
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile1700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile1700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_1, PORT_INDEX, profile, switchAfterDownload, forceDisableProfile);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_1800
     * @tc.name      : testTelephonyEsimDownloadProfile1800
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile1800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile1800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_2, PORT_INDEX, profile, switchAfterDownload, forceDisableProfile);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_1900
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList1900
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList1900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList1900';
      console.info(`${caseName} test start`);
      eSIM.getEuiccProfileInfoList(SLOT_0).then((data: eSIM.GetEuiccProfileInfoListResult) => {
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_2000
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList2000
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList2000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList2000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_1);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
              }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_2100
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList2100
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList2100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList2100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_2);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_2200
     * @tc.name      : testTelephonyEsimGetEuiccInfo2200
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo2200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo2200';
      console.info(`${caseName} test start`);
      eSIM.getEuiccInfo(SLOT_0).then((data: eSIM.EuiccInfo) => {
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_2300
     * @tc.name      : testTelephonyEsimGetEuiccInfo2300
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo2300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo2300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_1);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_2400
     * @tc.name      : testTelephonyEsimGetEuiccInfo2400
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo2400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo2400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_2);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_2500
     * @tc.name      : testTelephonyEsimDeleteProfile2500
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile2500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile2500';
      console.info(`${caseName} test start`);
      eSIM.deleteProfile(SLOT_0, iccid).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_2600
     * @tc.name      : testTelephonyEsimDeleteProfile2600
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile2600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile2600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_1, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_2700
     * @tc.name      : testTelephonyEsimDeleteProfile2700
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile2700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile2700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_2, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_2800
     * @tc.name      : testTelephonyEsimSwitchToProfile2800
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile2800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile2800';
      console.info(`${caseName} test start`);
      eSIM.switchToProfile(SLOT_0, PORT_INDEX, iccid, forceDisableProfile).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_2900
     * @tc.name      : testTelephonyEsimSwitchToProfile2900
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile2900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile2900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_1, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_3000
     * @tc.name      : testTelephonyEsimSwitchToProfile3000
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile3000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile3000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_2, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_3100
     * @tc.name      : testTelephonyEsimSetProfileNickname3100
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname3100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname3100';
      console.info(`${caseName} test start`);
      eSIM.setProfileNickname(SLOT_0, iccid, nickname).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_3200
     * @tc.name      : testTelephonyEsimSetProfileNickname3200
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname3200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname3200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_1, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_3300
     * @tc.name      : testTelephonyEsimSetProfileNickname3300
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname3300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname3300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_2, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_3400
     * @tc.name      : testTelephonyEsimResetMemory3400
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory3400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory3400';
      console.info(`${caseName} test start`);
      eSIM.resetMemory(SLOT_0, options).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_3500
     * @tc.name      : testTelephonyEsimResetMemory3500
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory3500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory3500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_1, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_3600
     * @tc.name      : testTelephonyEsimResetMemory3600
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory3600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory3600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_2, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_3700
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore3700
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore3700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore3700';
      console.info(`${caseName} test start`);
      eSIM.reserveProfilesForFactoryRestore(SLOT_0).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_3800
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore3800
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore3800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore3800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_1);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_3900
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore3900
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore3900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore3900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_2);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_4000
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress4000
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress4000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress4000';
      console.info(`${caseName} test start`);
      eSIM.setDefaultSmdpAddress(SLOT_0, address).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_4100
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress4100
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress4100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress4100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_1, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_4200
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress4200
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress4200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress4200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_2, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_4300
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress4300
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress4300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress4300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_1);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_4400
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress4400
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress4400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress4400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_2);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4500
     * @tc.name      : testTelephonyEsimCancelSession4500
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_1, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(8300001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4600
     * @tc.name      : testTelephonyEsimCancelSession4600
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_2, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    }); 
  })
}