/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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
import { describe, expect, it } from '@ohos/hypium';
import call from '@ohos.telephony.call';

export function toString(data) {
  if (typeof data === 'object') {
    return JSON.stringify(data);
  } else {
    return data;
  }
}
;

export default function callJsunit() {
  describe('callTest', function () {
    console.log("==========> call Test start ==========>");

    /**
     * @tc.number Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.name Checks whether a device supports voice calls.
     * @tc.desc Return type test
     */
    it("Telephony_Call_HasVoiceCapability_HasVoiceCapability", 0, async function (done) {
      let caseName = 'Telephony_Call_HasVoiceCapability_HasVoiceCapability';
      console.log(`==========> ${caseName} Test start ==========>`);
      let ret = false;
      let voiceCapablity = call.hasVoiceCapability();
      if (voiceCapablity === true || voiceCapablity === false) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_CallTransferInfo_Type
     * @tc.name Interface CallTransferInfo
     * @tc.desc Interface value test
     */
    it('Telephony_Call_CallTransferInfo_Type', 0, function (done) {
      let caseName = 'Telephony_Call_CallTransferInfo_Type';
      console.log(`==========> ${caseName} Test start ==========>`);
      let callTransferInfo = {
        transferNum: '10000000001', type: 2, settingType: 1
      };
      expect(callTransferInfo.type === 2).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_CallTransferResult_Status
     * @tc.name Interface CallTransferResult
     * @tc.desc Interface value test
     */
    it('Telephony_Call_CallTransferResult_Status', 0, function (done) {
      let caseName = 'Telephony_Call_CallTransferResult_Status';
      console.log(`==========> ${caseName} Test start ==========>`);
      let callTransferResult = {
        status: 0, number: '10000000001'
      };
      expect(callTransferResult.status === 0).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_CallTransferResult_Number
     * @tc.name Interface CallTransferResult
     * @tc.desc Interface value test
     */
    it('Telephony_Call_CallTransferResult_Number', 0, function (done) {
      let caseName = 'Telephony_Call_CallTransferResult_Number';
      console.log(`==========> ${caseName} Test start ==========>`);
      let callTransferResult = {
        status: 0, number: '10000000001'
      };
      expect(callTransferResult.number === '10000000001').assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_CallAttributeOptions_CallId
     * @tc.name Interface CallAttributeOptions
     * @tc.desc Interface value test
     */
    it('Telephony_Call_CallAttributeOptions_CallId', 0, function (done) {
      let caseName = 'Telephony_Call_CallAttributeOptions_CallId';
      console.log(`==========> ${caseName} Test start ==========>`);
      let callAttributeOptions = {
        callId: 1
      };
      expect(callAttributeOptions.callId === 1).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_CallRestrictionInfo_Type
     * @tc.name Interface CallRestrictionInfo
     * @tc.desc Interface value test
     */
    it('Telephony_Call_CallRestrictionInfo_Type', 0, function (done) {
      let caseName = 'Telephony_Call_CallRestrictionInfo_Type';
      console.log(`==========> ${caseName} Test start ==========>`);
      let callRestrictionInfo = {
        type: 0, password: '123456', mode: 1
      };
      expect(callRestrictionInfo.type === 0).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_CallRestrictionInfo_Mode
     * @tc.name Interface CallRestrictionInfo
     * @tc.desc Interface value test
     */
    it('Telephony_Call_CallRestrictionInfo_Mode', 0, function (done) {
      let caseName = 'Telephony_Call_CallRestrictionInfo_Mode';
      console.log(`==========> ${caseName} Test start ==========>`);
      let callRestrictionInfo = {
        type: 0, password: '123456', mode: 1
      };
      expect(callRestrictionInfo.mode === 1).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_CallEventOptions_EventId
     * @tc.name Interface CallEventOptions
     * @tc.desc Interface value test
     */
    it('Telephony_Call_CallEventOptions_EventId', 0, function (done) {
      let caseName = 'Telephony_Call_CallEventOptions_EventId';
      console.log(`==========> ${caseName} Test start ==========>`);
      let callEventOptions = {
        eventId: 1
      };
      expect(callEventOptions.eventId === 1).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_Call_MakeCall_0100
     * @tc.name Make a call.
     * @tc.desc Function test
     */
    it("Telephony_Call_Call_MakeCall_0100", 0, async function (done) {
      let caseName: string = "Telephony_Call_Call_MakeCall_0100";
      console.log(`==========> ${caseName} Test start ==========>`);
      try {
        let telNumber = "";
        call.makeCall(telNumber, (error) => {
          if (error) {
            console.log("makeCall callback: err->" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
            return;
          }
          done();
        });
      } catch (err) {
        console.log("makeCall callback: err->" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.number Telephony_Call_Call_MakeCall_0200
     * @tc.name Makes a call.
     * @tc.desc Function test
     */
    it("Telephony_Call_Call_MakeCall_0200", 0, async function (done) {
      let caseName: string = "Telephony_Call_Call_MakeCall_0200";
      console.log(`==========> ${caseName} Test start ==========>`);
      let telNumber = "";
      try {
        call.makeCall(telNumber).then(() => {
          done();
        }).catch(error => {
          console.log("makeCall callback: err->" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.log("makeCall callback: err->" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });
  });
}