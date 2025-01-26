/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from "@ohos/hypium"
import native from 'libnativendk.so'

export default function nativeNdkTest() {
  describe('AvcodecAVCapabilityTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0200
     * @tc.name       : testOHAvCapabilityIsHardware002
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware002', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 1);
        expect(result != null).assertTrue();
        done();
      } catch (err) {
        console.info('testOHAvCapabilityIsHardware002 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0300
     * @tc.name       : testOHAvCapabilityIsHardware003
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware003', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0400
     * @tc.name       : testOHAvCapabilityIsHardware004
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0500
     * @tc.name       : testOHAvCapabilityIsHardware005
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0600
     * @tc.name       : testOHAvCapabilityIsHardware006
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware006', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0700
     * @tc.name       : testOHAvCapabilityIsHardware007
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware007', 0, async (done: Function) => {
      try{
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 1);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsHardware007 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0800
     * @tc.name       : testOHAvCapabilityIsHardware008
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware008', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0900
     * @tc.name       : testOHAvCapabilityIsHardware009
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware009', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1000
     * @tc.name       : testOHAvCapabilityIsHardware010
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware010', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1100
     * @tc.name       : testOHAvCapabilityIsHardware011
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware011', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1200
     * @tc.name       : testOHAvCapabilityIsHardware012
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1300
     * @tc.name       : testOHAvCapabilityIsHardware013
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware013', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1400
     * @tc.name       : testOHAvCapabilityIsHardware014
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware014', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 1);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsHardware014 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1500
     * @tc.name       : testOHAvCapabilityIsHardware015
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware015', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1600
     * @tc.name       : testOHAvCapabilityIsHardware016
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware016', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1700
     * @tc.name       : testOHAvCapabilityIsHardware017
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware017', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1800
     * @tc.name       : testOHAvCapabilityIsHardware018
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware018', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1900
     * @tc.name       : testOHAvCapabilityIsHardware019
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware019', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2000
     * @tc.name       : testOHAvCapabilityIsHardware020
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware020', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2100
     * @tc.name       : testOHAvCapabilityIsHardware021
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware021', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2200
     * @tc.name       : testOHAvCapabilityIsHardware022
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware022', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2300
     * @tc.name       : testOHAvCapabilityIsHardware023
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware023', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2400
     * @tc.name       : testOHAvCapabilityIsHardware024
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware024', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2500
     * @tc.name       : testOHAvCapabilityIsHardware025
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware025', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2600
     * @tc.name       : testOHAvCapabilityIsHardware026
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware026', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2700
     * @tc.name       : testOHAvCapabilityIsHardware027
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware027', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2800
     * @tc.name       : testOHAvCapabilityIsHardware028
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware028', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0200
     * @tc.name       : testOHAvCapabilityGetName002
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName002', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0300
     * @tc.name       : testOHAvCapabilityGetName003
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName003', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0400
     * @tc.name       : testOHAvCapabilityGetName004
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0500
     * @tc.name       : testOHAvCapabilityGetName005
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0600
     * @tc.name       : testOHAvCapabilityGetName006
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName006', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0700
     * @tc.name       : testOHAvCapabilityGetName007
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName007', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0800
     * @tc.name       : testOHAvCapabilityGetName008
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName008', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0900
     * @tc.name       : testOHAvCapabilityGetName009
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName009', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1000
     * @tc.name       : testOHAvCapabilityGetName010
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName010', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1100
     * @tc.name       : testOHAvCapabilityGetName011
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName011', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1200
     * @tc.name       : testOHAvCapabilityGetName012
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1300
     * @tc.name       : testOHAvCapabilityGetName013
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName013', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1400
     * @tc.name       : testOHAvCapabilityGetName014
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName014', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1500
     * @tc.name       : testOHAvCapabilityGetName015
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName015', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1600
     * @tc.name       : testOHAvCapabilityGetName016
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName016', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1700
     * @tc.name       : testOHAvCapabilityGetName017
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName017', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1800
     * @tc.name       : testOHAvCapabilityGetName018
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName018', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1900
     * @tc.name       : testOHAvCapabilityGetName019
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName019', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2000
     * @tc.name       : testOHAvCapabilityGetName020
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName020', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2100
     * @tc.name       : testOHAvCapabilityGetName021
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName021', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2200
     * @tc.name       : testOHAvCapabilityGetName022
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName022', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2300
     * @tc.name       : testOHAvCapabilityGetName023
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName023', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2400
     * @tc.name       : testOHAvCapabilityGetName024
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName024', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2500
     * @tc.name       : testOHAvCapabilityGetName025
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName025', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2600
     * @tc.name       : testOHAvCapabilityGetName026
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName026', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2700
     * @tc.name       : testOHAvCapabilityGetName027
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName027', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2800
     * @tc.name       : testOHAvCapabilityGetName028
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName028', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2900
     * @tc.name       : testOHAvCapabilityGetName029
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName029', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3000
     * @tc.name       : testOHAvCapabilityGetName030
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName030', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3100
     * @tc.name       : testOHAvCapabilityGetName031
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName031', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3200
     * @tc.name       : testOHAvCapabilityGetName032
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName032', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3300
     * @tc.name       : testOHAvCapabilityGetName033
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName033', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3400
     * @tc.name       : testOHAvCapabilityGetName034
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName034', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3500
     * @tc.name       : testOHAvCapabilityGetName035
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName035', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3600
     * @tc.name       : testOHAvCapabilityGetName036
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName036', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3700
     * @tc.name       : testOHAvCapabilityGetName037
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName037', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3800
     * @tc.name       : testOHAvCapabilityGetName038
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName038', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3900
     * @tc.name       : testOHAvCapabilityGetName039
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName039', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_4000
     * @tc.name       : testOHAvCapabilityGetName040
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName040', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_4100
     * @tc.name       : testOHAvCapabilityGetName041
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName041', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_4200
     * @tc.name       : testOHAvCapabilityGetName042
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName042', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances002
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances002', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances003
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances003', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances004
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances005
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances006
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances006', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances007
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances007', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances008
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances008', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances009
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances009', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances010
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances010', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances011
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances011', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances012
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances013
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances013', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances014
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances014', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances015
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances015', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances016
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances016', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances017
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances017', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances018
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances018', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances019
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances019', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances020
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances020', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances021
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances021', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances022
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances022', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances023
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances023', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances024
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances024', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances025
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances025', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances026
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances026', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances027
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances027', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances028
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances028', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances029
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances029', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances030
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances030', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances031
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances031', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances032
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances032', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances033
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances033', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances034
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances034', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances035
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances035', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances036
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances036', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances037
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances037', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances038
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances038', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances039
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances039', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_4000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances040
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances040', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_4100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances041
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances041', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_4200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances042
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances042', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange002
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange002', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange003
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange003', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0400
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange004
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0500
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange005
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0600
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange006
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange006', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange006 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0700
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange007
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange007', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0800
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange008
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange008', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 4);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange008 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0900
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange009
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange009', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1000
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange010
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange010', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1100
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange011
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange011', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange012
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange013
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange013', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1400
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange014
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange014', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1500
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange015
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange015', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1600
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange016
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange016', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 1, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange016 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1700
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange017
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange017', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1800
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange018
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange018', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1900
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange019
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange019', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 1, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2000
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange020
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange020', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2100
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange021
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange021', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 1, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange021 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange022
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange022', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 1, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange023
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange023', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 1, 1, 5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported002
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported002', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0300
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported003
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported003', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0400
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported004
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });