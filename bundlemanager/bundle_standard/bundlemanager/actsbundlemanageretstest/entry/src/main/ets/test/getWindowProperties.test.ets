/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle';
import { describe, beforeAll, it, expect } from 'hypium/index';

const BUNDLE_NAME = "ohos.acts.bundle.stage"
const ABILITY_NAME = "MainAbility"
const MODUEL_NAME = "myfeature"
const ABILITY_NAME_TEST_1 = "MainAbility1"
const ABILITY_NAME_TEST_2 = "MainAbility2"
const ABILITY_NAME_TEST_3 = "MainAbility3"
const ABILITY_NAME_TEST_4 = "MainAbility4"
const ABILITY_NAME_TEST_5 = "MainAbility5"
const ABILITY_NAME_TEST_6 = "MainAbility6"
const ABILITY_NAME_TEST_7 = "MainAbility7"
const ABILITY_NAME_TEST_8 = "MainAbility8"
const ABILITY_NAME_TEST_9 = "MainAbility9"
const ABILITY_NAME_TEST_10 = "MainAbility10"
const ABILITY_NAME_TEST_11 = "MainAbility11"
const ABILITY_NAME_TEST_12 = "MainAbility12"
const ORIENTATION = "orientation"
const UNSPECIFIED = bundle.DisplayOrientation.UNSPECIFIED
const LANDSCAPE = bundle.DisplayOrientation.LANDSCAPE
const PORTRAIT = bundle.DisplayOrientation.PORTRAIT
const LANDSCAPE_INVERTED = bundle.DisplayOrientation.LANDSCAPE_INVERTED
const PORTRAIT_INVERTED = bundle.DisplayOrientation.PORTRAIT_INVERTED
const AUTO_ROTATION = bundle.DisplayOrientation.AUTO_ROTATION
const AUTO_ROTATION_LANDSCAPE = bundle.DisplayOrientation.AUTO_ROTATION_LANDSCAPE
const AUTO_ROTATION_PORTRAIT = bundle.DisplayOrientation.AUTO_ROTATION_PORTRAIT
const AUTO_ROTATION_RESTRICTED = bundle.DisplayOrientation.AUTO_ROTATION_RESTRICTED
const AUTO_ROTATION_LANDSCAPE_RESTRICTED = bundle.DisplayOrientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED
const AUTO_ROTATION_PORTRAIT_RESTRICTED = bundle.DisplayOrientation.AUTO_ROTATION_PORTRAIT_RESTRICTED
const LOCKED = bundle.DisplayOrientation.LOCKED
const DEFAULT_VALUE = 0
const MAX_WINDOW_RATIO_VALUE = 3.5
const MIN_WINDOW_RATIO_VALUE = 0.5
const MAX_WINDOW_WIDTH_VALUE = 2560
const MIN_WINDOW_WIDTH_VALUE = 1400
const MAX_WINDOW_HEIGHT_VALUE = 300
const MIN_WINDOW_HEIGHT_VALUE = 200
const FULL_SCREEN_WINDOW_MODE = bundle.SupportWindowMode.FULL_SCREEN 
const SPLIT_WINDOW_MODE = bundle.SupportWindowMode.SPLIT 
const FLOATING_WINDOW_MODE = bundle.SupportWindowMode.FLOATING 

export default function getWindowPorperties() {

  describe('getWindowPorperties', function () {
    /**
     * @tc.number getOrientation_0100
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation without configuring orientation
     */
    it('getOrientation_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(datainfo.orientation).assertEqual(UNSPECIFIED)
      done();
    })

    /**
     * @tc.number getOrientation_0200
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "unspecified"
     */
    it('getOrientation_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_1)
      expect(datainfo.orientation).assertEqual(UNSPECIFIED)
      done();
    })

    /**
     * @tc.number getOrientation_0300
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "landscape"
     */
    it('ggetOrientation_0300', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_2)
      expect(datainfo.orientation).assertEqual(LANDSCAPE)
      done();
    })

    /**
     * @tc.number getOrientation_0400
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "portrait"
     */
    it('getOrientation_0400', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_3)
      expect(datainfo.orientation).assertEqual(PORTRAIT)
      done();
    })

    /**
     * @tc.number getOrientation_0500
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "landscape_inverted"
     */
    it('getOrientation_0500', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_4)
      expect(datainfo.orientation).assertEqual(LANDSCAPE_INVERTED)
      done();
    })

    /**
     * @tc.number getOrientation_0600
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "portrait_inverted"
     */
    it('getOrientation_0600', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_5)
      expect(datainfo.orientation).assertEqual(PORTRAIT_INVERTED)
      done();
    })

    /**
     * @tc.number getOrientation_0700
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "auto_rotation"
     */
    it('getOrientation_0700', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_6)
      expect(datainfo.orientation).assertEqual(AUTO_ROTATION)
      done();
    })

    /**
     * @tc.number getOrientation_0800
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "auto_rotation_landscape"
     */
    it('getOrientation_0800', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_7)
      expect(datainfo.orientation).assertEqual(AUTO_ROTATION_LANDSCAPE)
      done();
    })

    /**
     * @tc.number getOrientation_0900
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "auto_rotation_portrait"
     */
    it('getOrientation_0900', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_8)
      expect(datainfo.orientation).assertEqual(AUTO_ROTATION_PORTRAIT)
      done();
    })

    /**
     * @tc.number getOrientation_1000
     * @tc.name BUNDLE::getOrientation
     * @tc.desc TTest window property orientation with configuring orientation as "auto_rotation_restricted"
     */
    it('getOrientation_1000', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_9)
      expect(datainfo.orientation).assertEqual(AUTO_ROTATION_RESTRICTED)
      done();
    })

    /**
     * @tc.number getOrientation_1100
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "auto_rotation_landscape_restricted"
     */
    it('getOrientation_1100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_10)
      expect(datainfo.orientation).assertEqual(AUTO_ROTATION_LANDSCAPE_RESTRICTED)
      done();
    })

    /**
     * @tc.number getOrientation_1200
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "auto_rotation_portrait_restricted"
     */
    it('getOrientation_1200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_11)
      expect(datainfo.orientation).assertEqual(AUTO_ROTATION_PORTRAIT_RESTRICTED)
      done();
    })

    /**
     * @tc.number getOrientation_1300
     * @tc.name BUNDLE::getOrientation
     * @tc.desc Test window property orientation with configuring orientation as "locked"
     */
    it('getOrientation_1300', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_12)
      expect(datainfo.orientation).assertEqual(LOCKED)
      done();
    })

    /**
     * @tc.number getSupportWindowMode_0100
     * @tc.name BUNDLE::getSupportWindowMode
     * @tc.desc Test window property supportWindowMode without configuring supportWindowMode
     */
    it('getSupportWindowMode_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(Array.isArray(datainfo.supportWindowMode)).assertTrue();
      expect(datainfo.supportWindowMode.length).assertEqual(3)
      expect(datainfo.supportWindowMode[0]).assertEqual(FULL_SCREEN_WINDOW_MODE)
      expect(datainfo.supportWindowMode[1]).assertEqual(SPLIT_WINDOW_MODE)
      expect(datainfo.supportWindowMode[2]).assertEqual(FLOATING_WINDOW_MODE)
      done();
    })

    /**
     * @tc.number getSupportWindowMode_0200
     * @tc.name BUNDLE::getSupportWindowMode
     * @tc.desc Test window property supportWindowMode with configuring supportWindowMode as ["fullscreen"]
     */
    it('getSupportWindowMode_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_1)
      expect(Array.isArray(datainfo.supportWindowMode)).assertTrue();
      expect(datainfo.supportWindowMode.length).assertEqual(1)
      expect(datainfo.supportWindowMode[0]).assertEqual(FULL_SCREEN_WINDOW_MODE)
      done();
    })

    /**
     * @tc.number getSupportWindowMode_0300
     * @tc.name BUNDLE::getSupportWindowMode
     * @tc.desc Test window property supportWindowMode with configuring supportWindowMode as ["split"]
     */
    it('getSupportWindowMode_0300', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_2)
      expect(Array.isArray(datainfo.supportWindowMode)).assertTrue();
      expect(datainfo.supportWindowMode.length).assertEqual(1)
      expect(datainfo.supportWindowMode[0]).assertEqual(SPLIT_WINDOW_MODE)
      done();
    })

    /**
     * @tc.number getSupportWindowMode_0400
     * @tc.name BUNDLE::getSupportWindowMode
     * @tc.desc Test window property supportWindowMode with configuring supportWindowMode as ["floating"]
     */
    it('getSupportWindowMode_0400', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_3)
      expect(Array.isArray(datainfo.supportWindowMode)).assertTrue();
      expect(datainfo.supportWindowMode.length).assertEqual(1)
      expect(datainfo.supportWindowMode[0]).assertEqual(FLOATING_WINDOW_MODE)
      done();
    })

    /**
     * @tc.number getSupportWindowMode_0500
     * @tc.name BUNDLE::getSupportWindowMode
     * @tc.desc Test window property supportWindowMode with configuring supportWindowMode as
                ["fullscreen", "split", "floating"]
     */
    it('getSupportWindowMode_0500', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_4)
      expect(Array.isArray(datainfo.supportWindowMode)).assertTrue();
      expect(datainfo.supportWindowMode.length).assertEqual(3)
      expect(datainfo.supportWindowMode[0]).assertEqual(FULL_SCREEN_WINDOW_MODE)
      expect(datainfo.supportWindowMode[1]).assertEqual(SPLIT_WINDOW_MODE)
      expect(datainfo.supportWindowMode[2]).assertEqual(FLOATING_WINDOW_MODE)
      done();
    })

    /**
     * @tc.number getMaxWindowRatio_0100
     * @tc.name BUNDLE::getMaxWindowRatio
     * @tc.desc Test window property maxWindowRatio without configuring maxWindowRatio
     */
    it('getMaxWindowRatio_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(datainfo.maxWindowRatio).assertEqual(DEFAULT_VALUE);
      done();
    })

    /**
     * @tc.number getMaxWindowRatio_0200
     * @tc.name BUNDLE::getMaxWindowRatio
     * @tc.desc Test window property maxWindowRatio with configuring maxWindowRatio as 3.5
     */
    it('getMaxWindowRatio_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_5)
      expect(datainfo.maxWindowRatio).assertEqual(MAX_WINDOW_RATIO_VALUE);
      done();
    })

    /**
     * @tc.number getMinWindowRatio_0100
     * @tc.name BUNDLE::getMinWindowRatio
     * @tc.desc Test window property minWindowRatio without configuring minWindowRatio
     */
    it('getMinWindowRatio_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(datainfo.minWindowRatio).assertEqual(DEFAULT_VALUE);
      done();
    })

    /**
     * @tc.number getMinWindowRatio_0200
     * @tc.name BUNDLE::getMinWindowRatio
     * @tc.desc est window property minWindowRatio with configuring minWindowRatio as 0.5
     */
    it('getMinWindowRatio_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_6)
      expect(datainfo.minWindowRatio).assertEqual(MIN_WINDOW_RATIO_VALUE);
      done();
    })

    /**
     * @tc.number getMaxWindowWidth_0100
     * @tc.name BUNDLE::getMaxWindowWidth
     * @tc.desc Test window property maxWindowWidth without configuring maxWindowWidth
     */
    it('getMaxWindowWidth_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(datainfo.maxWindowWidth).assertEqual(DEFAULT_VALUE);
      done();
    })

    /**
     * @tc.number getMaxWindowWidth_0200
     * @tc.name BUNDLE::getMaxWindowWidth
     * @tc.desc Test window property maxWindowWidth with configuring maxWindowWidth as 2560
     */
    it('getMaxWindowWidth_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_7)
      expect(datainfo.maxWindowWidth).assertEqual(MAX_WINDOW_WIDTH_VALUE);
      done();
    })

    /**
     * @tc.number getMinWindowWidth_0100
     * @tc.name BUNDLE::getMinWindowWidth
     * @tc.desc Test window property minWindowWidth without configuring minWindowWidth
     */
    it('getMinWindowWidth_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(datainfo.minWindowWidth).assertEqual(DEFAULT_VALUE);
      done();
    })

    /**
     * @tc.number getMinWindowWidth_0200
     * @tc.name BUNDLE::getMinWindowWidth
     * @tc.desc Test window property minWindowWidth with configuring minWindowWidth as 1400
     */
    it('getMinWindowWidth_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_8)
      expect(datainfo.minWindowWidth).assertEqual(MIN_WINDOW_WIDTH_VALUE);
      done();
    })

    /**
     * @tc.number getMaxWindowHeight_0100
     * @tc.name BUNDLE::getMaxWindowHeight
     * @tc.desc Test window property maxWindowHeight without configuring maxWindowHeight
     */
    it('getMaxWindowHeight_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(datainfo.maxWindowHeight).assertEqual(DEFAULT_VALUE);
      done();
    })

    /**
     * @tc.number getMaxWindowHeight_0200
     * @tc.name BUNDLE::getMaxWindowHeight
     * @tc.desc Test window property maxWindowHeight with configuring maxWindowHeight as 300
     */
    it('getMaxWindowHeight_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_9)
      expect(datainfo.maxWindowHeight).assertEqual(MAX_WINDOW_HEIGHT_VALUE);
      done();
    })

    /**
     * @tc.number getMinWindowHeight_0100
     * @tc.name BUNDLE::getMinWindowHeight
     * @tc.desc Test window property minWindowHeight without configuring minWindowHeight
     */
    it('getMinWindowHeight_0100', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME)
      expect(datainfo.minWindowHeight).assertEqual(DEFAULT_VALUE);
      done();
    })

    /**
     * @tc.number getMinWindowHeight_0200
     * @tc.name BUNDLE::getMinWindowHeight
     * @tc.desc Test window property minWindowHeight with configuring minWindowHeight as 200
     */
    it('getMinWindowHeight_0200', 0, async function (done) {
      let datainfo = await bundle.getAbilityInfo(BUNDLE_NAME, MODUEL_NAME, ABILITY_NAME_TEST_10)
      expect(datainfo.minWindowHeight).assertEqual(MIN_WINDOW_HEIGHT_VALUE);
      done();
    })
  })
}