/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
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


export default function UDMFApiDescriptorTest() {
  describe('UDMFApiDescriptorTest', function () {

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100
     * @tc.desc      Text data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 start');
      let typeObj = UTD.getTypeDescriptor("general.text");
      expect(typeObj.typeId).assertEqual("general.text");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for all text, including text with markup information (HTML, RTF, and so on).");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200
     * @tc.desc      Plain text data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 start');
      let typeObj = UTD.getTypeDescriptor("general.plain-text");
      expect(typeObj.typeId).assertEqual("general.plain-text");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Text of unspecified encoding, with no markup. Equivalent to the MIME type text/plain");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300
     * @tc.desc      HTML data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 start');
      let typeObj = UTD.getTypeDescriptor("general.html");
      expect(typeObj.typeId).assertEqual("general.html");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("HTML text.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400
     * @tc.desc      Hyperlink data type.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 start');
      let typeObj = UTD.getTypeDescriptor("general.hyperlink");
      expect(typeObj.typeId).assertEqual("general.hyperlink");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Hyperlink.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500
     * @tc.desc      XML(Extensible Markup Language) data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 start');
      let typeObj = UTD.getTypeDescriptor("general.xml");
      expect(typeObj.typeId).assertEqual("general.xml");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("XML text.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600
     * @tc.desc      Source code data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 start');
      let typeObj  = UTD.getTypeDescriptor("general.source-code");
      expect(typeObj.typeId).assertEqual("general.source-code");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.plain-text");
      expect(typeObj.description).assertEqual("Generic source code.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700
     * @tc.desc      Script data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 start');
      let typeObj = UTD.getTypeDescriptor("general.script");
      expect(typeObj.typeId).assertEqual("general.script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("Base type for scripting language source code.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800
     * @tc.desc      Shell script data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 start');
      let typeObj =UTD.getTypeDescriptor("general.shell-script");
      expect(typeObj.typeId).assertEqual("general.shell-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.script");
      expect(typeObj.description).assertEqual("Shell script.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900
     * @tc.desc      C-shell script data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 start');
      let typeObj = UTD.getTypeDescriptor("general.csh-script");
      expect(typeObj.typeId).assertEqual("general.csh-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("C-shell script.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000
     * @tc.desc      Perl script data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 start');
      let typeObj = UTD.getTypeDescriptor("general.perl-script");
      expect(typeObj.typeId).assertEqual("general.perl-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Perl script.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100
     * @tc.desc      PHP script data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 start');
      let typeObj = UTD.getTypeDescriptor("general.php-script");
      expect(typeObj.typeId).assertEqual("general.php-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("PHP script.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200
     * @tc.desc      Python script data type.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 start');
      let typeObj = UTD.getTypeDescriptor("general.python-script");
      expect(typeObj.typeId).assertEqual("general.python-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Python script.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300
     * @tc.desc      Ruby script data type.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 start');
      let typeObj = UTD.getTypeDescriptor("general.ruby-script");
      expect(typeObj.typeId).assertEqual("general.ruby-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Ruby script.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400
     * @tc.desc      TypeScript data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 start');
      let typeObj = UTD.getTypeDescriptor("general.type-script");
      expect(typeObj.typeId).assertEqual("general.type-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("TypeScript source code.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500
     * @tc.desc      JavaScript data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 start');
      let typeObj = UTD.getTypeDescriptor("general.java-script");
      expect(typeObj.typeId).assertEqual("general.java-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600
     * @tc.desc      JavaScript data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 start');
      let typeObj = UTD.getTypeDescriptor("general.c-header");
      expect(typeObj.typeId).assertEqual("general.c-header");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C header file.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700
     * @tc.desc      C source code data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 start');
      let typeObj = UTD.getTypeDescriptor("general.c-source");
      expect(typeObj.typeId).assertEqual("general.c-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C source code.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800
     * @tc.desc      C++ header data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 start');
      let typeObj = UTD.getTypeDescriptor("general.c-plus-plus-header");
      expect(typeObj.typeId).assertEqual("general.c-plus-plus-header");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C++ header file.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900
     * @tc.desc      C++ source code data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 start');
      let typeObj = UTD.getTypeDescriptor("general.c-plus-plus-source");
      expect(typeObj.typeId).assertEqual("general.c-plus-plus-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C++ source code.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000
     * @tc.desc      C++ source code data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 start');
      let typeObj = UTD.getTypeDescriptor("general.java-source");
      expect(typeObj.typeId).assertEqual("general.java-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("Java source code.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100
     * @tc.desc      Ebook data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 start');
      let typeObj = UTD.getTypeDescriptor("general.ebook");
      expect(typeObj.typeId).assertEqual("general.ebook");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for ebook.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200
     * @tc.desc      EPUB ebook file format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 start');
      let typeObj = UTD.getTypeDescriptor("general.epub");
      expect(typeObj.typeId).assertEqual("general.epub");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("Electronic publication (EPUB) format.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300
     * @tc.desc      AZW ebook file format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 start');
      let typeObj = UTD.getTypeDescriptor("com.amazon.azw");
      expect(typeObj.typeId).assertEqual("com.amazon.azw");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("AZW ebook.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400
     * @tc.desc      AZW3 ebook file format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 start');
      let typeObj = UTD.getTypeDescriptor("com.amazon.azw3");
      expect(typeObj.typeId).assertEqual("com.amazon.azw3");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("AZW3 ebook.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500
     * @tc.desc      KFX ebook file format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 start');
      let typeObj = UTD.getTypeDescriptor("com.amazon.kfx");
      expect(typeObj.typeId).assertEqual("com.amazon.kfx");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("KFX ebook.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600
     * @tc.desc      MOBI ebook file format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 start');
      let typeObj = UTD.getTypeDescriptor("com.amazon.mobi");
      expect(typeObj.typeId).assertEqual("com.amazon.mobi");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("MOBI ebook.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700
     * @tc.desc      Media data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 start');
      let typeObj = UTD.getTypeDescriptor("general.media");
      expect(typeObj.typeId).assertEqual("general.media");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for media.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800
     * @tc.desc      Image data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 start');
      let typeObj = UTD.getTypeDescriptor("general.image");
      expect(typeObj.typeId).assertEqual("general.image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for images.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900
     * @tc.desc      JPEG image format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 start');
      let typeObj = UTD.getTypeDescriptor("general.jpeg");
      expect(typeObj.typeId).assertEqual("general.jpeg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("JPEG image.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000
     * @tc.desc      JPEG image format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 start');
      let typeObj = UTD.getTypeDescriptor("general.png");
      expect(typeObj.typeId).assertEqual("general.png");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("PNG image");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100
     * @tc.desc      Raw image format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 start');
      let typeObj = UTD.getTypeDescriptor("general.raw-image");
      expect(typeObj.typeId).assertEqual("general.raw-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Base type for digital camera raw image formats.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200
     * @tc.desc      TIFF image format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 start');
      let typeObj = UTD.getTypeDescriptor("general.tiff");
      expect(typeObj.typeId).assertEqual("general.tiff");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("TIFF image.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300
     * @tc.desc      Windows bitmap image data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.bmp");
      expect(typeObj.typeId).assertEqual("com.microsoft.bmp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Windows bitmap image.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400
     * @tc.desc      Windows icon data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.ico");
      expect(typeObj.typeId).assertEqual("com.microsoft.ico");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Windows icon image.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500
     * @tc.desc      Adobe Photoshop document data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 start');
      let typeObj = UTD.getTypeDescriptor("com.adobe.photoshop-image");
      expect(typeObj.typeId).assertEqual("com.adobe.photoshop-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Adobe Photoshop document.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600
     * @tc.desc      Adobe Illustrator document data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 start');
      let typeObj = UTD.getTypeDescriptor("com.adobe.illustrator.ai-image");
      expect(typeObj.typeId).assertEqual("com.adobe.illustrator.ai-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Adobe Illustrator document.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700
     * @tc.desc       Microsoft Word data type.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.word.doc");
      expect(typeObj.typeId).assertEqual("com.microsoft.word.doc");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Microsoft Word data.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800
     * @tc.desc      Microsoft Excel data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.excel.xls");
      expect(typeObj.typeId).assertEqual("com.microsoft.excel.xls");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Microsoft Excel data.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900
     * @tc.desc      Microsoft PowerPoint presentation data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.powerpoint.ppt");
      expect(typeObj.typeId).assertEqual("com.microsoft.powerpoint.ppt");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Microsoft PowerPoint presentation.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000
     * @tc.desc      PDF data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 start');
      let typeObj = UTD.getTypeDescriptor("com.adobe.pdf");
      expect(typeObj.typeId).assertEqual("com.adobe.pdf");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("PDF data.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100
     * @tc.desc      PostScript data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 start');
      let typeObj = UTD.getTypeDescriptor("com.adobe.postscript");
      expect(typeObj.typeId).assertEqual("com.adobe.postscript");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("PostScript data.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200
     * @tc.desc      Encapsulated PostScript data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 start');
      let typeObj = UTD.getTypeDescriptor("com.adobe.encapsulated-postscript");
      expect(typeObj.typeId).assertEqual("com.adobe.encapsulated-postscript");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Encapsulated PostScript.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300
     * @tc.desc      Video data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 start');
      let typeObj = UTD.getTypeDescriptor("general.video");
      expect(typeObj.typeId).assertEqual("general.video");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400
     * @tc.desc      AVI video format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 start');
      let typeObj = UTD.getTypeDescriptor("general.avi");
      expect(typeObj.typeId).assertEqual("general.avi");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("AVI video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500
     * @tc.desc      MPEG video format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 start');
      let typeObj = UTD.getTypeDescriptor("general.mpeg");
      expect(typeObj.typeId).assertEqual("general.mpeg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("MPEG-1 or MPEG-2 video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600
     * @tc.desc      MPEG4 video format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 start');
      let typeObj = UTD.getTypeDescriptor("general.mpeg-4");
      expect(typeObj.typeId).assertEqual("general.mpeg-4");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("MPEG-4 video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700
     * @tc.desc      3GPP video format data type.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 start');
      let typeObj: UTD.TypeDescriptor = UTD.getTypeDescriptor("general.3gpp");
      expect(typeObj.typeId).assertEqual("general.3gpp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("3GPP video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800
     * @tc.desc      3GPP video format data type.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 start');
      let typeObj = UTD.getTypeDescriptor("general.3gpp2");
      expect(typeObj.typeId).assertEqual("general.3gpp2");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("3GPP2 video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900
     * @tc.desc      Windows WM video format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.windows-media-wm");
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wm");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WM video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000
     * @tc.desc      Windows WMV video format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.windows-media-wmv");
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmv");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WMV video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100
     * @tc.desc      Windows WMP video format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.windows-media-wmp");
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WMP video.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200
     * @tc.desc      Audio data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 start');
      let typeObj = UTD.getTypeDescriptor("general.audio");
      expect(typeObj.typeId).assertEqual("general.audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300
     * @tc.desc      AAC audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 start');
      let typeObj = UTD.getTypeDescriptor("general.aac");
      expect(typeObj.typeId).assertEqual("general.aac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("AAC audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400
     * @tc.desc      AIFF audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 start');
      let typeObj = UTD.getTypeDescriptor("general.aiff");
      expect(typeObj.typeId).assertEqual("general.aiff");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("AIFF audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500
     * @tc.desc      ALAC audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 start');
      let typeObj = UTD.getTypeDescriptor("general.alac");
      expect(typeObj.typeId).assertEqual("general.alac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("ALAC audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600
     * @tc.desc      FLAC audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 start');
      let typeObj = UTD.getTypeDescriptor("general.flac");
      expect(typeObj.typeId).assertEqual("general.flac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("FLAC audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700
     * @tc.desc      MP3 audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 start');
      let typeObj = UTD.getTypeDescriptor("general.mp3");
      expect(typeObj.typeId).assertEqual("general.mp3");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("MPEG-3 audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800
     * @tc.desc      OGG audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 start');
      let typeObj = UTD.getTypeDescriptor("general.ogg");
      expect(typeObj.typeId).assertEqual("general.ogg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("OGG audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900
     * @tc.desc      PCM audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 start');
      let typeObj = UTD.getTypeDescriptor("general.pcm");
      expect(typeObj.typeId).assertEqual("general.pcm");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("PCM audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000
     * @tc.desc      Windows WMA audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.windows-media-wma");
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wma");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Windows WMA audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100
     * @tc.desc      Waveform audio format data type created by Microsoft
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 start');
      let typeObj  = UTD.getTypeDescriptor("com.microsoft.waveform-audio");
      expect(typeObj.typeId).assertEqual("com.microsoft.waveform-audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Waveform audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200
     * @tc.desc      Windows WMX audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.windows-media-wmx");
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmx");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Windows WMX audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300
     * @tc.desc      Windows WVX audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.windows-media-wvx");
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wvx");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Windows WVX audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400
     * @tc.desc      Windows WAX audio format data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 start');
      let typeObj = UTD.getTypeDescriptor("com.microsoft.windows-media-wax");
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wax");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Windows WAX audio.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500
     * @tc.desc      File data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 start');
      let typeObj = UTD.getTypeDescriptor("general.file");
      expect(typeObj.typeId).assertEqual("general.file");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for file.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600
     * @tc.desc      Directory data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 start');
      let typeObj = UTD.getTypeDescriptor("general.directory");
      expect(typeObj.typeId).assertEqual("general.directory");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for directory.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700
     * @tc.desc      Folder data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 start');
      let typeObj = UTD.getTypeDescriptor("general.folder");
      expect(typeObj.typeId).assertEqual("general.folder");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for folder.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800
     * @tc.desc      Symlink data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 start');
      let typeObj = UTD.getTypeDescriptor("general.symlink");
      expect(typeObj.typeId).assertEqual("general.symlink");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for symlink.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900
     * @tc.desc      Symlink data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 start');
      let typeObj = UTD.getTypeDescriptor("general.archive");
      expect(typeObj.typeId).assertEqual("general.archive");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for an archive of files and directories.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000
     * @tc.desc      Bzip2 archive file data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 start');
      let typeObj = UTD.getTypeDescriptor("general.bz2-archive");
      expect(typeObj.typeId).assertEqual("general.bz2-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("BZip2 archive.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100
     * @tc.desc      Disk image archive file data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 start');
      let typeObj = UTD.getTypeDescriptor("general.disk-image");
      expect(typeObj.typeId).assertEqual("general.disk-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Base type for items mountable as a volume.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200
     * @tc.desc      Tar archive data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 start');
      let typeObj = UTD.getTypeDescriptor("general.tar-archive");
      expect(typeObj.typeId).assertEqual("general.tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Tar archive.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300
     * @tc.desc      Zip archive data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 start');
      let typeObj = UTD.getTypeDescriptor("general.zip-archive");
      expect(typeObj.typeId).assertEqual("general.zip-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Zip archive.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400
     * @tc.desc      Java archive data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 start');
      let typeObj  = UTD.getTypeDescriptor("com.sun.java-archive");
      expect(typeObj.typeId).assertEqual("com.sun.java-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Java archive.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500
     * @tc.desc      GNU archive data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 start');
      let typeObj = UTD.getTypeDescriptor("org.gnu.gnu-tar-archive");
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("GNU archive.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600
     * @tc.desc      Gzip archive data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 start');
      let typeObj = UTD.getTypeDescriptor("org.gnu.gnu-zip-archive");
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Gzip archive.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700
     * @tc.desc      Gzip tar archive data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 start');
      let typeObj = UTD.getTypeDescriptor("org.gnu.gnu-zip-tar-archive");
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Gzip tar archive.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800
     * @tc.desc      Calendar data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 start');
      let typeObj= UTD.getTypeDescriptor("general.calendar");
      expect(typeObj.typeId).assertEqual("general.calendar");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for scheduled events.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900
     * @tc.desc      Contact data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 start');
      let typeObj = UTD.getTypeDescriptor("general.contact");
      expect(typeObj.typeId).assertEqual("general.contact");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for contact information.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000
     * @tc.desc      Database data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 start');
      let typeObj = UTD.getTypeDescriptor("general.database");
      expect(typeObj.typeId).assertEqual("general.database");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for databases.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 end");
    })
    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100
     * @tc.desc      Message data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 start');
      let typeObj = UTD.getTypeDescriptor("general.message");
      expect(typeObj.typeId).assertEqual("general.message");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for messages (email, IM, and so on).");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200
     * @tc.desc      A file format data type stand for electronic business card
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 start');
      let typeObj = UTD.getTypeDescriptor("general.vcard");
      expect(typeObj.typeId).assertEqual("general.vcard");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for electronic business card.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300
     * @tc.desc      location
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 start');
      let typeObj = UTD.getTypeDescriptor("general.navigation");
      expect(typeObj.typeId).assertEqual("general.navigation");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for navigation.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400
     * @tc.desc      Location data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 start');
      let typeObj = UTD.getTypeDescriptor("general.location");
      expect(typeObj.typeId).assertEqual("general.location");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.navigation");
      expect(typeObj.description).assertEqual("Navigation location.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500
     * @tc.desc      OpenHarmony system defined form data type(the data is provided and bound to OpenHarmony system).
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 start');
      let typeObj = UTD.getTypeDescriptor("openharmony.form");
      expect(typeObj.typeId).assertEqual("openharmony.form");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("OpenHarmony system defined form.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600
     * @tc.desc      OpenHarmony system defined app item data type(the data is provided and bound to OpenHarmony system)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 start');
      let typeObj = UTD.getTypeDescriptor("openharmony.app-item");
      expect(typeObj.typeId).assertEqual("openharmony.app-item");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("OpenHarmony system defined app item.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700
     * @tc.desc       OpenHarmony system defined pixel map data type(the data is provided and bound to OpenHarmony system)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 start');
      let typeObj = UTD.getTypeDescriptor("openharmony.pixel-map");
      expect(typeObj.typeId).assertEqual("openharmony.pixel-map");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("OpenHarmony system defined pixel map.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 end");
    })


    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800
     * @tc.desc      OpenHarmony system defined atomic service data type(the data is provided and bound to OpenHarmony system).
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 start');
      let typeObj = UTD.getTypeDescriptor("openharmony.atomic-service");
      expect(typeObj.typeId).assertEqual("openharmony.atomic-service");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("OpenHarmony system defined atomic service.");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900
     * @tc.desc      Illegal parameters null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900 start');
      try{
        let typeObj = UTD.getTypeDescriptor(null);
        console.log('typeObj start'+typeObj);
        expect(typeObj !== null ).assertFail();
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
         expect(err.code == "401").assertEqual(true);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900 end");
    })
    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000
     * @tc.desc      Illegal parameters undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000 start');
      try{
        let typeObj = UTD.getTypeDescriptor(undefined);
        console.log('typeObj start'+typeObj);
        expect(typeObj !== null ).assertFail();
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100
     * @tc.desc      Illegal parameters general.hello
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100 start');
      try {
        let typeObj = UTD.getTypeDescriptor("general.hello");
        console.log('typeObj start'+typeObj);
        if (typeObj == null){
          console.info("Illegal parameters general.hello is :" + (typeObj == null));
        }
        expect(typeObj == null ).assertEqual(true);
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
        expect(err !== null ).assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100 end");
    })
    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200
     * @tc.desc      Illegal parameters general.hello
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200 start');
      try {
        let typeObj = UTD.getTypeDescriptor("");
        console.log('typeObj start'+typeObj);
        expect(typeObj == null ).assertEqual(true);
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
        expect(err !== null ).assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200 end");
    })
    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300
     * @tc.desc      Equals the same parameter types
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300 start');
      try{
        let typeObj1  =UTD.getTypeDescriptor("general.message");
        let typeObj2  =UTD.getTypeDescriptor("general.message");
        let result = typeObj1.equals(typeObj2);
        expect(result == true ).assertEqual(true);
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
        expect(err !== null ).assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400
     * @tc.desc      Equals the different parameter types
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400 start');
      try{
        let typeObj1 =UTD.getTypeDescriptor("general.message");
        let typeObj2 =UTD.getTypeDescriptor("general.navigation");
        let result = typeObj1.equals(typeObj2);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
        expect(err !== null ).assertFail();
      }
      console.info("vSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400 end");
    })
    
    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500
     * @tc.desc      Equals the different parameter types -- Illegal params null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500 start');
      let typeObj1 = UTD.getTypeDescriptor("general.navigation");
      let typeObj2 = null;
      try{
        let result = typeObj1.equals(typeObj2);
        console.info("result" +result);
        expect(result !== undefined).assertFail();
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500 end");
    })

    /**
     * @tc.name      SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600
     * @tc.desc      Equals the different parameter types -- Illegal params undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600',0, async function () {
      console.info('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600 start');
      let typeObj1 = UTD.getTypeDescriptor("general.navigation");
      let typeObj2 = undefined;
      try{
        let result = typeObj1.equals(typeObj2);
        console.info("result" +result);
        expect(result !== undefined).assertFail();
      } catch (err) {
        console.info("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600 end");
    })
  })
}