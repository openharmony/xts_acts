
/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import missionManager  from '@ohos.application.missionManager';
import abilityFeatureAbility from '@ohos.ability.featureAbility';
import bundleManager from '@ohos.bundle';
import appManager from "@ohos.application.appManager"
import commonEvent from '@ohos.commonEvent';
import {onDestroys} from "../MainAbility2/app.js"
import abilityManager from '@ohos.application.abilityManager'
import ConfigurationConstant from "@ohos.application.ConfigurationConstant";
import AbilityConstant from '@ohos.application.AbilityConstant'
describe('AbilityDisableTests', function () {

    /*
       * @tc.number  SUB_AA_OpenHarmony_AbilityStart_6200
       * @tc.name    Verify the enumeration values LaunchReason. CONTINUATION
       * @tc.desc    Function test
       * @tc.level   0
       */
    it("SUB_AA_OpenHarmony_AbilityStart_6200", 0, async function (done) {
        console.info("--------logMessage SUB_AA_OpenHarmony_AbilityStart_6300----");
        console.info("SUB_AA_OpenHarmony_AbilityStart_6200 LaunchReason.CONTINUATION: " + AbilityConstant.LaunchReason.CONTINUATION);
        expect(AbilityConstant.LaunchReason.CONTINUATION==3).assertTrue();
        done();
    });

    /*
       * @tc.number  SUB_AA_OpenHarmony_AbilityStart_6300
       * @tc.name    Verify the enumeration value launchreason.start UNKNOWN
       * @tc.desc    Function test
       * @tc.level   0
       */
    it("SUB_AA_OpenHarmony_AbilityStart_6300", 0, async function (done) {
        console.info("--------logMessage SUB_AA_OpenHarmony_AbilityStart_6300----");
        console.info("SUB_AA_OpenHarmony_AbilityStart_6300 LaunchReason.UNKNOWN: " + 
AbilityConstant.LaunchReason.UNKNOWN);
        expect(AbilityConstant.LaunchReason.UNKNOWN==0).assertTrue();
        done();
    });

    /*
       * @tc.number  SUB_AA_OpenHarmony_AbilityStart_6400
       * @tc.name    Verify the enumeration value launchreason.START_ABILITY
       * @tc.desc    Function test
       * @tc.level   0
       */
    it("SUB_AA_OpenHarmony_AbilityStart_6400", 0, async function (done) {
        console.info("------logMessage SUB_AA_OpenHarmony_AbilityStart_6400-----");
        console.info("SUB_AA_OpenHarmony_AbilityStart_6400 LaunchReason.START_ABILITY: " + AbilityConstant.LaunchReason.START_ABILITY);
        expect(AbilityConstant.LaunchReason.START_ABILITY==1).assertTrue();
        done();
    });

    /*
       * @tc.number  SUB_AA_OpenHarmony_AbilityStart_6500
       * @tc.name    Verify the enumeration values LaunchReason. CALL
       * @tc.desc    Function test
       * @tc.level   0
       */
    it("SUB_AA_OpenHarmony_AbilityStart_6500", 0, async function (done) {
        console.info("-------logMessage SUB_AA_OpenHarmony_AbilityStart_6500-----");
        console.info("SUB_AA_OpenHarmony_AbilityStart_6500 LaunchReason.CALL: " + 
AbilityConstant.LaunchReason.CALL);
        expect(AbilityConstant.LaunchReason.CALL==2).assertTrue();
        done();
    });

    /*
       * @tc.number  SUB_AA_OpenHarmony_AbilityStart_6600
       * @tc.name    Verify the enumeration values LastExitReason.UNKNOWN
       * @tc.desc    Function test
       * @tc.level   0
       */
    it("SUB_AA_OpenHarmony_AbilityStart_6600", 0, async function (done) {
        console.info("---------logMessage SUB_AA_OpenHarmony_AbilityStart_6600---------");
        console.info("SUB_AA_OpenHarmony_AbilityStart_6600 LastExitReason.UNKNOWN: " +
 AbilityConstant.LastExitReason.UNKNOWN);
        expect(AbilityConstant.LastExitReason.UNKNOWN==0).assertTrue();
        done();
    });

    /*
       * @tc.number  SUB_AA_OpenHarmony_AbilityStart_6700
       * @tc.name    Verify the enumeration values LastExitReason.ABILITY_NOT_RESPONDING
       * @tc.desc    Function test
       * @tc.level   0
       */
    it("SUB_AA_OpenHarmony_AbilityStart_6700", 0, async function (done) {
        console.info("--------logMessage SUB_AA_OpenHarmony_AbilityStart_6700---------");
        console.info("SUB_AA_OpenHarmony_AbilityStart_6700 LastExitReason.ABILITY_NOT_RESPONDING: " + AbilityConstant.LastExitReason.ABILITY_NOT_RESPONDING);
        expect(AbilityConstant.LastExitReason.ABILITY_NOT_RESPONDING==1).assertTrue();
        done();
    });

    /*
       * @tc.number  SUB_AA_OpenHarmony_AbilityStart_6700
       * @tc.name    Verify the enumeration values LastExitReason.NORMAL
       * @tc.desc    Function test
       * @tc.level   0
       */
    it("SUB_AA_OpenHarmony_AbilityStart_6800", 0, async function (done) {
        console.info("-----logMessage SUB_AA_OpenHarmony_AbilityStart_6800-----------");
        console.info("SUB_AA_OpenHarmony_AbilityStart_6800 LastExitReason.NORMAL: " +
 AbilityConstant.LastExitReason.NORMAL);
        expect(AbilityConstant.LastExitReason.NORMAL==2).assertTrue();
        done();
    });
})
