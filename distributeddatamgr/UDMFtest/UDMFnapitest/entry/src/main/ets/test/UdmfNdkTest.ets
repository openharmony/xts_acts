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
import testNapi from 'libUdmfNdk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';

const TAG = "[ UdmfNdkTest ] ------ ";

export default function UdmfNdkTest() {
  describe('UdmfNdkTest', async function () {
    beforeAll(async function () {
    })
    beforeEach(function () {
    })
    afterEach(function () {     
    })
    afterAll(function () {
    })

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0100
     * @tc.name OH_Udmf_CreatePropertiesFromUnifiedData001
     * @tc.desc OH_Udmf_CreatePropertiesFromUnifiedData
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_CreatePropertiesFromUnifiedData001',0, async function () {
      console.info( TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001' );
      let data = testNapi.OH_Udmf_CreatePropertiesFromUnifiedData001();
      console.info( TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0200
     * @tc.name OH_Udmf_SetPropertiesTag001
     * @tc.desc OH_Udmf_SetPropertiesTag
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_SetPropertiesTag001',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesTag001' );
      let data = testNapi.OH_Udmf_SetPropertiesTag001();
      console.info( TAG + 'OH_Udmf_SetPropertiesTag001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    
  })
}