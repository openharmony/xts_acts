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
import hilog from '@ohos.hilog';
import testNapi from 'libUtdNdk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';

const TAG = "[ UdsNdkTest ] ------ ";

export default function UtdNdkTest() {
  describe('UtdNdkTest', async function () {
    beforeAll(async function () {
    })
    beforeEach(function () {
    })
    afterEach(function () {     
    })
    afterAll(function () {
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000
     * @tc.name OH_Utd_Create_0001
     * @tc.desc OH_Utd_Create_0001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000' , ' begin');
      let result = testNapi.OH_Utd_Create_0001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010
     * @tc.name OH_Utd_Create_0002
     * @tc.desc OH_Utd_Create_0002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010' , ' begin');
      let result = testNapi.OH_Utd_Create_0002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020
     * @tc.name OH_Utd_Create_0003
     * @tc.desc OH_Utd_Create_0003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020' , ' begin');
      let result = testNapi.OH_Utd_Create_0003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030
     * @tc.name OH_Utd_Create_0004
     * @tc.desc OH_Utd_Create_0004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030' , ' begin');
      let result = testNapi.OH_Utd_Create_0004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040
     * @tc.name OH_Utd_Create_0005
     * @tc.desc OH_Utd_Create_0005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040' , ' begin');
      let result = testNapi.OH_Utd_Create_0005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050
     * @tc.name OH_Utd_Create_0006
     * @tc.desc OH_Utd_Create_0006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050' , ' begin');
      let result = testNapi.OH_Utd_Create_0006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060
     * @tc.name OH_Utd_Create_0007
     * @tc.desc OH_Utd_Create_0007
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060' , ' begin');
      let result = testNapi.OH_Utd_Create_0007();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070
     * @tc.name OH_Utd_Create_0007
     * @tc.desc OH_Utd_Create_0007
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070' , ' begin');
      let result = testNapi.OH_Utd_Create_0008();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080
     * @tc.name OH_Utd_Create_0009
     * @tc.desc OH_Utd_Create_0009
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080' , ' begin');
      let result = testNapi.OH_Utd_Create_0009();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090
     * @tc.name OH_Utd_Create_0010
     * @tc.desc OH_Utd_Create_0010
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090' , ' begin');
      let result = testNapi.OH_Utd_Create_0010();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100
     * @tc.name OH_Utd_Create_0011
     * @tc.desc OH_Utd_Create_0011
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100' , ' begin');
      let result = testNapi.OH_Utd_Create_0011();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110
     * @tc.name OH_Utd_Create_0012
     * @tc.desc OH_Utd_Create_0012
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110' , ' begin');
      let result = testNapi.OH_Utd_Create_0012();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120
     * @tc.name OH_Utd_Create_0013
     * @tc.desc OH_Utd_Create_0013
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120' , ' begin');
      let result = testNapi.OH_Utd_Create_0013();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130
     * @tc.name OH_Utd_Create_0014
     * @tc.desc OH_Utd_Create_0014
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130' , ' begin');
      let result = testNapi.OH_Utd_Create_0014();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140
     * @tc.name OH_Utd_Create_0015
     * @tc.desc OH_Utd_Create_0015
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140' , ' begin');
      let result = testNapi.OH_Utd_Create_0015();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160
     * @tc.name OH_Utd_Create_0017
     * @tc.desc OH_Utd_Create_0017
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160' , ' begin');
      let result = testNapi.OH_Utd_Create_0017();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170
     * @tc.name OH_Utd_Create_0018
     * @tc.desc OH_Utd_Create_0018
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170' , ' begin');
      let result = testNapi.OH_Utd_Create_0018();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180
     * @tc.name OH_Utd_Create_0019
     * @tc.desc OH_Utd_Create_0019
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180' , ' begin');
      let result = testNapi.OH_Utd_Create_0019();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190
     * @tc.name OH_Utd_Create_0020
     * @tc.desc OH_Utd_Create_0020
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190' , ' begin');
      let result = testNapi.OH_Utd_Create_0020();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200
     * @tc.name OH_Utd_Create_0021
     * @tc.desc OH_Utd_Create_0021
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200' , ' begin');
      let result = testNapi.OH_Utd_Create_0021();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210
     * @tc.name OH_Utd_Create_0022
     * @tc.desc OH_Utd_Create_0022
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210' , ' begin');
      let result = testNapi.OH_Utd_Create_0022();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220
     * @tc.name OH_Utd_Create_0023
     * @tc.desc OH_Utd_Create_0023
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220' , ' begin');
      let result = testNapi.OH_Utd_Create_0023();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230
     * @tc.name OH_Utd_Create_0024
     * @tc.desc OH_Utd_Create_0024
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230' , ' begin');
      let result = testNapi.OH_Utd_Create_0024();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240
     * @tc.name OH_Utd_Create_0025
     * @tc.desc OH_Utd_Create_0025
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240' , ' begin');
      let result = testNapi.OH_Utd_Create_0025();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250
     * @tc.name OH_Utd_Create_0026
     * @tc.desc OH_Utd_Create_0026
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250' , ' begin');
      let result = testNapi.OH_Utd_Create_0026();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260
     * @tc.name OH_Utd_Create_0027
     * @tc.desc OH_Utd_Create_0027
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260' , ' begin');
      let result = testNapi.OH_Utd_Create_0027();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290
     * @tc.name OH_Utd_Create_0030
     * @tc.desc OH_Utd_Create_0030
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290' , ' begin');
      let result = testNapi.OH_Utd_Create_0030();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300
     * @tc.name OH_Utd_Create_0031
     * @tc.desc OH_Utd_Create_0031
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300' , ' begin');
      let result = testNapi.OH_Utd_Create_0031();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310
     * @tc.name OH_Utd_Create_0032
     * @tc.desc OH_Utd_Create_0032
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310' , ' begin');
      let result = testNapi.OH_Utd_Create_0032();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320
     * @tc.name OH_Utd_Create_0033
     * @tc.desc OH_Utd_Create_0033
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320' , ' begin');
      let result = testNapi.OH_Utd_Create_0033();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330
     * @tc.name OH_Utd_Create_0034
     * @tc.desc OH_Utd_Create_0034
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330' , ' begin');
      let result = testNapi.OH_Utd_Create_0034();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340
     * @tc.name OH_Utd_Create_0035
     * @tc.desc OH_Utd_Create_0035
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340' , ' begin');
      let result = testNapi.OH_Utd_Create_0035();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350
     * @tc.name OH_Utd_Create_0036
     * @tc.desc OH_Utd_Create_0036
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350' , ' begin');
      let result = testNapi.OH_Utd_Create_0036();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360
     * @tc.name OH_Utd_Create_0037
     * @tc.desc OH_Utd_Create_0037
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360' , ' begin');
      let result = testNapi.OH_Utd_Create_0037();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370
     * @tc.name OH_Utd_Create_0038
     * @tc.desc OH_Utd_Create_0038
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370' , ' begin');
      let result = testNapi.OH_Utd_Create_0038();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380
     * @tc.name OH_Utd_Create_0039
     * @tc.desc OH_Utd_Create_0039
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380' , ' begin');
      let result = testNapi.OH_Utd_Create_0039();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390
     * @tc.name OH_Utd_Create_0040
     * @tc.desc OH_Utd_Create_0040
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390' , ' begin');
      let result = testNapi.OH_Utd_Create_0040();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400
     * @tc.name OH_Utd_Create_0041
     * @tc.desc OH_Utd_Create_0041
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400' , ' begin');
      let result = testNapi.OH_Utd_Create_0041();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410
     * @tc.name OH_Utd_Create_0042
     * @tc.desc OH_Utd_Create_0042
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410' , ' begin');
      let result = testNapi.OH_Utd_Create_0042();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420
     * @tc.name OH_Utd_Create_0043
     * @tc.desc OH_Utd_Create_0043
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420' , ' begin');
      let result = testNapi.OH_Utd_Create_0043();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430
     * @tc.name OH_Utd_Create_0044
     * @tc.desc OH_Utd_Create_0044
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430' , ' begin');
      let result = testNapi.OH_Utd_Create_0044();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440
     * @tc.name OH_Utd_Create_0045
     * @tc.desc OH_Utd_Create_0045
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440' , ' begin');
      let result = testNapi.OH_Utd_Create_0045();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450
     * @tc.name OH_Utd_Create_0046
     * @tc.desc OH_Utd_Create_0046
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450' , ' begin');
      let result = testNapi.OH_Utd_Create_0046();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460
     * @tc.name OH_Utd_Create_0047
     * @tc.desc OH_Utd_Create_0047
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460' , ' begin');
      let result = testNapi.OH_Utd_Create_0047();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470
     * @tc.name OH_Utd_Create_0048
     * @tc.desc OH_Utd_Create_0048
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470' , ' begin');
      let result = testNapi.OH_Utd_Create_0048();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480
     * @tc.name OH_Utd_Create_0049
     * @tc.desc OH_Utd_Create_0049
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480' , ' begin');
      let result = testNapi.OH_Utd_Create_0049();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490
     * @tc.name OH_Utd_Create_0050
     * @tc.desc OH_Utd_Create_0050
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490' , ' begin');
      let result = testNapi.OH_Utd_Create_0050();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500
     * @tc.name OH_Utd_Create_0051
     * @tc.desc OH_Utd_Create_0051
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500' , ' begin');
      let result = testNapi.OH_Utd_Create_0051();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510
     * @tc.name OH_Utd_Create_0052
     * @tc.desc OH_Utd_Create_0052
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510' , ' begin');
      let result = testNapi.OH_Utd_Create_0052();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520
     * @tc.name OH_Utd_Create_0053
     * @tc.desc OH_Utd_Create_0053
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520' , ' begin');
      let result = testNapi.OH_Utd_Create_0053();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540
     * @tc.name OH_Utd_Create_0055
     * @tc.desc OH_Utd_Create_0055
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540' , ' begin');
      let result = testNapi.OH_Utd_Create_0055();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560
     * @tc.name OH_Utd_Create_0056
     * @tc.desc OH_Utd_Create_0056
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560' , ' begin');
      let result = testNapi.OH_Utd_Create_0056();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570
     * @tc.name OH_Utd_Create_0058
     * @tc.desc OH_Utd_Create_0058
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570' , ' begin');
      let result = testNapi.OH_Utd_Create_0058();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580
     * @tc.name OH_Utd_Create_0059
     * @tc.desc OH_Utd_Create_0059
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580' , ' begin');
      let result = testNapi.OH_Utd_Create_0059();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590
     * @tc.name OH_Utd_Create_0060
     * @tc.desc OH_Utd_Create_0060
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590' , ' begin');
      let result = testNapi.OH_Utd_Create_0060();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600
     * @tc.name OH_Utd_Create_0061
     * @tc.desc OH_Utd_Create_0061
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600' , ' begin');
      let result = testNapi.OH_Utd_Create_0061();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610
     * @tc.name OH_Utd_Create_0062
     * @tc.desc OH_Utd_Create_0062
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610' , ' begin');
      let result = testNapi.OH_Utd_Create_0062();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620
     * @tc.name OH_Utd_Create_0063
     * @tc.desc OH_Utd_Create_0063
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620' , ' begin');
      let result = testNapi.OH_Utd_Create_0063();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630
     * @tc.name OH_Utd_Create_0064
     * @tc.desc OH_Utd_Create_0064
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630' , ' begin');
      let result = testNapi.OH_Utd_Create_0064();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640
     * @tc.name OH_Utd_Create_0065
     * @tc.desc OH_Utd_Create_0065
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640' , ' begin');
      let result = testNapi.OH_Utd_Create_0065();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650
     * @tc.name OH_Utd_Create_0066
     * @tc.desc OH_Utd_Create_0066
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650' , ' begin');
      let result = testNapi.OH_Utd_Create_0066();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660
     * @tc.name OH_Utd_Create_0067
     * @tc.desc OH_Utd_Create_0067
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660' , ' begin');
      let result = testNapi.OH_Utd_Create_0067();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670
     * @tc.name OH_Utd_Create_0068
     * @tc.desc OH_Utd_Create_0068
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670' , ' begin');
      let result = testNapi.OH_Utd_Create_0068();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680
     * @tc.name OH_Utd_Create_0069
     * @tc.desc OH_Utd_Create_0069
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680' , ' begin');
      let result = testNapi.OH_Utd_Create_0069();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690
     * @tc.name OH_Utd_Create_0070
     * @tc.desc OH_Utd_Create_0070
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690' , ' begin');
      let result = testNapi.OH_Utd_Create_0070();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700
     * @tc.name OH_Utd_Create_0071
     * @tc.desc OH_Utd_Create_0071
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700' , ' begin');
      let result = testNapi.OH_Utd_Create_0071();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710
     * @tc.name OH_Utd_Create_0072
     * @tc.desc OH_Utd_Create_0072
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710' , ' begin');
      let result = testNapi.OH_Utd_Create_0072();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720
     * @tc.name OH_Utd_Create_0073
     * @tc.desc OH_Utd_Create_0073
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720' , ' begin');
      let result = testNapi.OH_Utd_Create_0073();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730
     * @tc.name OH_Utd_Create_0074
     * @tc.desc OH_Utd_Create_0074
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730' , ' begin');
      let result = testNapi.OH_Utd_Create_0074();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740
     * @tc.name OH_Utd_Create_0075
     * @tc.desc OH_Utd_Create_0075
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740' , ' begin');
      let result = testNapi.OH_Utd_Create_0075();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750
     * @tc.name OH_Utd_Create_0076
     * @tc.desc OH_Utd_Create_0076
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750' , ' begin');
      let result = testNapi.OH_Utd_Create_0076();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760
     * @tc.name OH_Utd_Create_0077
     * @tc.desc OH_Utd_Create_0077
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760' , ' begin');
      let result = testNapi.OH_Utd_Create_0077();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770
     * @tc.name OH_Utd_Create_0078
     * @tc.desc OH_Utd_Create_0078
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770' , ' begin');
      let result = testNapi.OH_Utd_Create_0078();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780
     * @tc.name OH_Utd_Create_0079
     * @tc.desc OH_Utd_Create_0079
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780' , ' begin');
      let result = testNapi.OH_Utd_Create_0079();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790
     * @tc.name OH_Utd_Create_0080
     * @tc.desc OH_Utd_Create_0080
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790' , ' begin');
      let result = testNapi.OH_Utd_Create_0080();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800
     * @tc.name OH_Utd_Create_0081
     * @tc.desc OH_Utd_Create_0081
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800' , ' begin');
      let result = testNapi.OH_Utd_Create_0081();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810
     * @tc.name OH_Utd_Create_0082
     * @tc.desc OH_Utd_Create_0082
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810' , ' begin');
      let result = testNapi.OH_Utd_Create_0082();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820
     * @tc.name OH_Utd_Create_0083
     * @tc.desc OH_Utd_Create_0083
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820' , ' begin');
      let result = testNapi.OH_Utd_Create_0083();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830
     * @tc.name OH_Utd_Create_0084
     * @tc.desc OH_Utd_Create_0084
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830' , ' begin');
      let result = testNapi.OH_Utd_Create_0084();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840
     * @tc.name OH_Utd_Create_0085
     * @tc.desc OH_Utd_Create_0085
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840' , ' begin');
      let result = testNapi.OH_Utd_Create_0085();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840 key is : '+ result , 'aa');
    })
  })
}