/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import UTD from '@ohos.data.uniformTypeDescriptor'
import { BusinessError } from '@ohos.base';

export default function UtdfileNameTest() {
  describe('UtdfileNameTest', () => {
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest_0010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0010
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .bmp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0010', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0010 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".bmp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.BMP);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0020
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ico
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0020', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0020 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ico");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ICO);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1290
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .doc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1290', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1290 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".doc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WORD_DOC);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0030
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .xls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0030', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0030 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EXCEL);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0040
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ppt
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0040', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0040 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ppt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PPT);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0050
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wav
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0050', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0050 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wav");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0060
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wave
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0060', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0060 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wave");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0070
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0070', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0070 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WM);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0080
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wmv
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0080', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0080 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmv");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0090
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".wmp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0090', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0090 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMP);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0100
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wma
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0100', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0100 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wma");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0110
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wmx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0110', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0110 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMX);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0120
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wvx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0120', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0120 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wvx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WVX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0130
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .wax
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0130', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0130 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wax");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WAX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0140
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pdf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0140', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0140 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pdf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PDF);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0150
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ps
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0150', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0150 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ps");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0160
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .eps
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0160', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0160 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".eps");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0170
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .psd
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0170', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0170 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".psd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0180
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ai
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0180', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0180 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ai");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AI_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0190
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pfb
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0190', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0190 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pfb");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT_PFB_FONT);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0200
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pfa
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0200', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0200 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pfa");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT_PFA_FONT);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0210
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .exe
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0210', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0210 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".exe");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PORTABLE_EXECUTABLE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0220
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .dll
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0220', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0220 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dll");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PORTABLE_EXECUTABLE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0230
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .class
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0230', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0230 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".class");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SUN_JAVA_CLASS);

    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0240
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .jar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0240', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0240 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_ARCHIVE);

    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0250
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .gtar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0250', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0250 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gtar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_TAR_ARCHIVE);

    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0260
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0260
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .gz
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0260', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0260 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gz");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);

    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0270
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .gzip
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0270', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0270 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gzip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);

    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0280
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .tgz
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0280', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0280 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tgz");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0290
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .mobi
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0290', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0290 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mobi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MOBI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0300
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .azw
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0300', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0300 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".azw");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1300
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .azw3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1300', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1300 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".azw3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW3);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0310
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0310
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .kfx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0310', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0310 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".kfx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.KFX);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0320
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .tga
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0320', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0320 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tga");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0330
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .sgi
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0330', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0330 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sgi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SGI_IMAGE)
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0340
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .exr
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0340', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0340 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".exr");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENEXR_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0350
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .fpx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0350', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0350 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fpx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLASHPIX_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0360
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .jfx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0360', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0360 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jfx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JFX_FAX);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0370
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .efx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0370', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0370 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".efx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EFX_FAX);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0380
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .sd2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0380', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0380 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sd2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SD2_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0390
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0390
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .rm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0390', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0390 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALMEDIA);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0400
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ra
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0400', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0400 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ra");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0410
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0410
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ram
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0410', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0410 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ram");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0420
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .smil
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0420', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0420 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".smil");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SMIL);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0430
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .sitx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0430', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0430 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sitx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0440
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .sit
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0440', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0440 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0450
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .docx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0450', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0450 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".docx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0460
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .docm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0460', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0460 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".docm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.document.macroenabled");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0470
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .xlsx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0470', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0470 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xlsx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SPREADSHEETML_SHEET);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0480
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .xlsm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0480', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0480 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xlsm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.sheet.macroenabled");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0490
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pptx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0490', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0490 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pptx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0500
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pptx
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0500', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0500 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pptx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0510
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .odt
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0510', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0510 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_TEXT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0520
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .fodt
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0520', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0520 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fodt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_TEXT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0530
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0530
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ods
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0530', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0530 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ods");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0540
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .fods
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0540', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0540 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fods");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0550
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .odp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0550', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0550 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0560
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0560
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .fodp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0560', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0560 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fodp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0570
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .odg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0570', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0570 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0580
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0580
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .fodg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0580', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0580 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fodg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0590
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .odf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0590', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0590 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_FORMULA);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0600
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .hap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0600', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0600 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hap");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENHARMONY_HAP);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0610
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .hdoc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0610', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0610 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hdoc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENHARMONY_HDOC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0620
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .hinote
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0620', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0620 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hinote");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENHARMONY_HINOTE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0630
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .png
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0630', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0630 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".png");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PNG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0640
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .jpg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0640', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0640 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0650
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .jpeg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0650', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0650 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0660
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .tif
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0660', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0660 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tif");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TIFF);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0670
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .tiff
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0670', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0670 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TIFF);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0680
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .xbm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0680', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0680 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xbm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XBITMAP_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0690
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .avi
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0690', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0690 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".avi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1310
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1310
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .vfw
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1310', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1310 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vfw");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1320
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .mpg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1320', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1320 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1330
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .mpeg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1330', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1330 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0700
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .m75
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0700', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0700 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m75");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0710
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .m15
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0710', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0710 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m15");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1340
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .mp4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1340', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1340 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG4);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0720
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .3gp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0720', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0720 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3gp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0730
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .3gpp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0730', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0730 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3gpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0740
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .3g2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0740', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0740 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3g2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP2);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0750
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .3gp2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0750', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0750 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3gp2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP2);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0760
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ogg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0760', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0760 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ogg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OGG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0770
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .aiff
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0770', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0770 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFF);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0780
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pcm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0780', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0780 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pcm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PCM);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0790
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .flac
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0790', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0790 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".flac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0800
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .alac
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0800', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0800 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".alac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ALAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0810
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .mp3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0810', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0810 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MP3);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0820
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .aac
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0820', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0820 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0830
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .au
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0830', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0830 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".au");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0840
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .snd
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0840', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0840 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".snd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0850
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .aifc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0850', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0850 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aifc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFC_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0870
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .aif
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0870', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0870 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aif");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFC_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0880
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0880
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .tar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0880', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0880 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TAR_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0890
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .zip
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0890', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0890 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".zip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ZIP_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0900
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .bz2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0900', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0900 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".bz2" );
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.BZ2_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1350
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .txt
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1350', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1350 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".txt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0910
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0910
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .html
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0910', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0910 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".html");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.HTML);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0920
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0920
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .htm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0920', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0920 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".htm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.HTML);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0930
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0930
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .xml
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0930', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0930 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xml");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XML);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0940
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0940
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .md
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0940', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0940 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".md");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MARKDOWN);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0950
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .sh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0950', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0950 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sh");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SHELL_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0960
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0960
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .command
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0960', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0960 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".command");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SHELL_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0970
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0970
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .csh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0970', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0970 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".csh");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CSH_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0980
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pl
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0980', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0980 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pl");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PERL_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest0990
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0990
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .pm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0990', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0990 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PERL_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1000
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .py
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1000', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1000 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".py");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PYTHON_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1010
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .rb
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1010', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1010 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rb");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.RUBY_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1020
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .rbw
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1020', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1020 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rbw");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.RUBY_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1030
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .php
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1030', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1030 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".php");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1040
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .php3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1040', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1040 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".php3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1050
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .php4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1050', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1050 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".php4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1060
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ph3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1060', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1060 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ph3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1070
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ph4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1070', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1070 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ph4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1080
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .phtml
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1080', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1080 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".phtml");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1090
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .ts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1090', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1090 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ts");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TYPE_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1100
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .js
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1100', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1100 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".js");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1110
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .jscript
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1110', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1110 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jscript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1120
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .javascript
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1120', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1120 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".javascript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1130
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .c
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1130', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1130 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".c");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1140
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .h
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1140', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1140 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".h");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_HEADER);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1360
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .cp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1360', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1360 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cp" );
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1150
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is .cpp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1150', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1150 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1370
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".c++"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1370', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1370 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".c++");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1160
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".cc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1160', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1160 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1170
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".cxx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1170', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1170 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cxx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1180
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".hpp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1180', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1180 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1190
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".h++"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1190', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1190 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".h++");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1200
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".hxx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1200', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1200 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hxx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1210
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".java"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1210', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1210 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".java");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1220
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".jav"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1220', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1220 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jav")
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SOURCE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1230
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".epub"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1230', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1230 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".epub");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EPUB);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1240
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".vcs"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1240', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1240 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vcs");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VCS);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1250
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".ics"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1250', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1250 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ics");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ICS);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1260
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1260
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".ttf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1260', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1260 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ttf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_FONT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1270
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".ttc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1270', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1270 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ttc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdfileNameExtentionsJsAPITest1280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1280
     * @tc.desc      : getUniformDataTypeByFilenameExtension  parmater is ".otf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1280', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1280 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".otf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENTYPE_FONT);
    });
  });
}