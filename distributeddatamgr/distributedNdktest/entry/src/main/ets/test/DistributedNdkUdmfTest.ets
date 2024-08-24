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
import testNapi from 'libDistributedNdk.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';
import featureAbility from '@ohos.ability.featureAbility';
const TAG = "[UdmfNdkTest]";

export default function UdmfNdkDistributedTest() {
  describe('UdmfNdkDistributedTest', async function () {
    beforeAll(async function () {
        hilog.info(0x0000, TAG, 'testTag beforeAll');
        let key = testNapi.AllocHapToken1();
        hilog.info(0x0000, TAG, TAG + 'beforeAll AllocHapToken1 key is : '+ key , 'aa');
        let re = testNapi.AllocHapToken2();
        hilog.info(0x0000, TAG, TAG + 'beforeAll AllocHapToken2 re is : '+ re , 'aa');
    })
    beforeEach(function () {
      hilog.info(0x0000, TAG, 'testTag beforeEach');
      let re = testNapi.SetHapToken1();
    })
    afterEach(function () {
      hilog.info(0x0000, TAG, 'testTag afterEach');
    })
    afterAll(function () {
      hilog.info(0x0000, TAG, 'testTag afterAll');
      let re = testNapi.ReleaseHapToken1();
    })

    /**
     * @tc.number: SUB_OH_Udmf_CreateUnifiedData_0100
     * @tc.desc: test OH_UdmfData_Create
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_CreateUnifiedData_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_CreateUnifiedData_0100' , ' begin');
      let re = testNapi.OH_Udmf_CreateUnifiedData();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_AddRecordToUnifiedData_0100
     * @tc.desc: OH_UdmfData_AddRecord with return UDMF_E_INVALID_PARAM
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_AddRecordToUnifiedData_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_AddRecordToUnifiedData_0100' , ' begin');
      let re = testNapi.OH_Udmf_AddRecordToUnifiedData();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_AddRecordToUnifiedDataTest_0100
     * @tc.desc: OH_UdmfData_AddRecord with return UDMF_E_OK
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_AddRecordToUnifiedDataTest_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_AddRecordToUnifiedDataTest_0100' , ' begin');
      let re = testNapi.OH_Udmf_AddRecordToUnifiedDataTest();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_HasUnifiedDataType_0100
     * @tc.desc: OH_UdmfData_HasType with return UDMF_E_INVALID_PARAM
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_HasUnifiedDataType_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_HasUnifiedDataType_0100' , ' begin');
      let re = testNapi.OH_Udmf_HasUnifiedDataType();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_HasUnifiedDataTypeTest_0100
     * @tc.desc: OH_UdmfData_HasType with return whether has type, number 1 represent true, number 0 represent false
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_HasUnifiedDataTypeTest_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_HasUnifiedDataTypeTest_0100' , ' begin');
      let re = testNapi.OH_Udmf_HasUnifiedDataTypeTest();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetUnifiedDataTypes_0100
     * @tc.desc: OH_UdmfData_GetTypes with invalid params
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetUnifiedDataTypes_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetUnifiedDataTypes_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetUnifiedDataTypes();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetUnifiedDataTypesTest_0100
     * @tc.desc: OH_UdmfData_GetTypes with valid params
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetUnifiedDataTypesTest_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetUnifiedDataTypesTest_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetUnifiedDataTypesTest();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetUnifiedRecordTypes_0100
     * @tc.desc: OH_UdmfRecord_GetTypes with invalid params
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetUnifiedRecordTypes_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetUnifiedRecordTypes_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetUnifiedRecordTypes();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetUnifiedRecordTypesTest_0100
     * @tc.desc: OH_UdmfRecord_GetTypes with valid params
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetUnifiedRecordTypesTest_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetUnifiedRecordTypesTest_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetUnifiedRecordTypesTest();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetRecords_0100
     * @tc.desc: OH_UdmfRecord_GetTypes with invalid params
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetRecords_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetRecords_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetRecords();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetRecordsTest_0100
     * @tc.desc: OH_UdmfRecord_GetTypes with valid params
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetRecordsTest_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetRecordsTest_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetRecordsTest();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetUnifiedData_0100
     * @tc.desc: OH_Udmf_SetUnifiedData with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetUnifiedData_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetUnifiedData_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetUnifiedData();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetUnifiedData_0100
     * @tc.desc: OH_Udmf_GetUnifiedData with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetUnifiedData_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetUnifiedData_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetUnifiedData();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetAndGetUnifiedData_0100
     * @tc.desc: OH_Udmf_SetUnifiedData and OH_Udmf_GetUnifiedData with valid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetAndGetUnifiedData_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetAndGetUnifiedData_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetAndGetUnifiedData();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
  
    /**
     * @tc.number: SUB_OH_Udmf_CreateUnifiedRecord_0100
     * @tc.desc: OH_Udmf_CreateUnifiedRecord valid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_CreateUnifiedRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_CreateUnifiedRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_CreateUnifiedRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_AddGeneralEntry_0100
     * @tc.desc: test OH_UdmfRecord_AddGeneralEntry with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_AddGeneralEntry_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_AddGeneralEntry_0100' , ' begin');
      let re = testNapi.OH_Udmf_AddGeneralEntry();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetGeneralEntry_0100
     * @tc.desc: test OH_UdmfRecord_GetGeneralEntry with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetGeneralEntry_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetGeneralEntry_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetGeneralEntry();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_AddAndGetGeneralEntry_0100
     * @tc.desc: test OH_UdmfRecord_AddGeneralEntry and OH_UdmfRecord_GetGeneralEntry with valid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_AddAndGetGeneralEntry_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_AddAndGetGeneralEntry_0100' , ' begin');
      let re = testNapi.OH_Udmf_AddAndGetGeneralEntry();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_AddAndGetGeneralEntryTest_0100
     * @tc.desc: test OH_UdmfRecord_AddGeneralEntry and OH_UdmfRecord_GetGeneralEntry with return error
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_AddAndGetGeneralEntryTest_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_AddAndGetGeneralEntryTest_0100' , ' begin');
      let re = testNapi.OH_Udmf_AddAndGetGeneralEntryTest();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildRecordByPlainText_0100
     * @tc.desc: test OH_UdmfRecord_AddPlainText with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildRecordByPlainText_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildRecordByPlainText_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildRecordByPlainText();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetPlainTextFromRecord_0100
     * @tc.desc: test OH_UdmfRecord_GetPlainText with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetPlainTextFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetPlainTextFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetPlainTextFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildAndGetPlainTextFromRecord_0100
     * @tc.desc: test OH_UdmfRecord_GetPlainText and OH_Udmf_BuildPlainTextFromRecord with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildAndGetPlainTextFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildAndGetPlainTextFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildAndGetPlainTextFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildRecordByHyperlink_0100
     * @tc.desc: test OH_UdmfRecord_AddHyperlink with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildRecordByHyperlink_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildRecordByHyperlink_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildRecordByHyperlink();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetHyperlinkFromRecord_0100
     * @tc.desc: test OH_UdmfRecord_GetHyperlink with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetHyperlinkFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetHyperlinkFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetHyperlinkFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildAndGetHyperlinkFromRecord_0100
     * @tc.desc: test OH_Udmf_BuildAndGetHyperlinkFromRecord with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildAndGetHyperlinkFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildAndGetHyperlinkFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildAndGetHyperlinkFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildRecordByHtml_0100
     * @tc.desc: test OH_UdmfRecord_AddHtml with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildRecordByHtml_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildRecordByHtml_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildRecordByHtml();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetHtmlFromRecord_0100
     * @tc.desc: test OH_UdmfRecord_GetHtml with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetHtmlFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetHtmlFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetHtmlFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildAndGetHtmlFromRecord_0100
     * @tc.desc: test OH_Udmf_BuildAndGetHtmlFromRecord with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildAndGetHtmlFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildAndGetHtmlFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildAndGetHtmlFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildRecordByOpenHarmonyAppItem_0100
     * @tc.desc: test OH_UdmfRecord_AddAppItem with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildRecordByOpenHarmonyAppItem_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildRecordByOpenHarmonyAppItem_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildRecordByOpenHarmonyAppItem();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_GetOpenHarmonyAppItemFromRecord_0100
     * @tc.desc: test OH_UdmfRecord_GetAppItem with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_GetOpenHarmonyAppItemFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_GetOpenHarmonyAppItemFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_GetOpenHarmonyAppItemFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 20400001).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_BuildAndGetAppItemFromRecord_0100
     * @tc.desc: test OH_Udmf_BuildAndGetAppItemFromRecord with invalid param
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_BuildAndGetAppItemFromRecord_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_BuildAndGetAppItemFromRecord_0100' , ' begin');
      let re = testNapi.OH_Udmf_BuildAndGetAppItemFromRecord();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_CreatePropertiesFromUnifiedData_0100
     * @tc.desc: Normal testcase of OH_UdmfProperty_Create
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_CreatePropertiesFromUnifiedData_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_CreatePropertiesFromUnifiedData_0100' , ' begin');
      let re = testNapi.OH_Udmf_CreatePropertiesFromUnifiedData();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetPropertiesTag_0100
     * @tc.desc: Normal testcase of SUB_OH_Udmf_SetPropertiesTag_0100
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetPropertiesTag_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetPropertiesTag_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetPropertiesTag();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetPropertiesShareOption_0100
     * @tc.desc: set properties IN_APP
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetPropertiesShareOption_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetPropertiesShareOption_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetPropertiesShareOption();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetPropertiesShareOptionTest_0100
     * @tc.desc: set properties CROSS_APP
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetPropertiesShareOptionTest_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetPropertiesShareOptionTest_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetPropertiesShareOptionTest();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetPropertiesShareOptionEnd_0100
     * @tc.desc: set invalid properties
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetPropertiesShareOptionEnd_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetPropertiesShareOptionEnd_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetPropertiesShareOptionEnd();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetPropertiesExtrasIntParam_0100
     * @tc.desc: Normal testcase of OH_UdmfProperty_SetExtrasIntParam
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetPropertiesExtrasIntParam_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetPropertiesExtrasIntParam_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetPropertiesExtrasIntParam();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_OH_Udmf_SetPropertiesExtrasStringParam_0100
     * @tc.desc: Normal testcase of OH_UdmfProperty_SetExtrasStringParam
     * @tc.type: FUNC
     */
    it('SUB_OH_Udmf_SetPropertiesExtrasStringParam_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_OH_Udmf_SetPropertiesExtrasStringParam_0100' , ' begin');
      let re = testNapi.OH_Udmf_SetPropertiesExtrasStringParam();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
  })
}