/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import convertxml from "@ohos.convertxml";
export default function XmlTest() {
  describe("XmlTest", function () {
    /**
     * @tc.number: TEST_CONVERT_XML_001
     * @tc.name  : testConvertXml001
     * @tc.desc  : To convert XML text to JavaScript object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertXml001", 0, function () {
      let xml = "<a/>\n<a/>";
      let conv = new convertxml.ConvertXML();
      let options = { trim: false, declarationKey: "_declaration", instructionKey: "_instruction", attributesKey: "_attributes", textKey: "_text", cdataKey: "_cdata", doctypeKey: "_doctype", commentKey: "_comment", parentKey: "_parent", typeKey: "_type", nameKey: "_name", elementsKey: "_elements" };
      let result = conv.convertToJSObject(xml, options);
      console.info(result["_elements"][0]["_name"]);
      expect(result["_elements"][0]["_name"] == "a").assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONVERT_XML_002
     * @tc.name  : testConvertXml002
     * @tc.desc  : To convert XML text to JavaScript object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertXml002", 0, function () {
      let xml = '<?xml version="1.0" encoding="utf-8"?>' + '<note importance="high" logged="true">' + "Happy" + "</note>";
      let conv = new convertxml.ConvertXML();
      let options = {
        trim: false,
        declarationKey: "_declaration",
        ignoreComment: true,
        instructionKey: "_instruction",
        attributesKey: "_attributes",
        textKey: "_text",
        cdataKey: "_cdata",
        doctypeKey: "_doctype",
        commentKey: "_comment",
        parentKey: "_parent",
        typeKey: "_type",
        nameKey: "_name",
        elementsKey: "_elements",
      };
      let result = conv.convertToJSObject(xml, options);
      console.info("================testConvert001=================");
      console.info(result["_elements"][0]["_elements"][0]["_text"]);
      console.info(result["_elements"][0]);
      console.info(result["_elements"][0]["_name"]);
      expect(result["_elements"][0]["_elements"][0]["_text"] == "Happy").assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONVERT_XML_003
     * @tc.name  : testConvertXml003
     * @tc.desc  : To convert XML text to JavaScript object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertXml003", 0, function () {
      let xml = "<a>Hi</a>";
      let conv = new convertxml.ConvertXML();
      let options = { trim: true, declarationKey: "_declaration", instructionKey: "_instruction", attributesKey: "_attributes", textKey: "_text", cdataKey: "_cdata", doctypeKey: "_doctype", commentKey: "_comment", parentKey: "_parent", typeKey: "_type", nameKey: "_name", elementsKey: "_elements" };
      let result = conv.convertToJSObject(xml, options);
      console.info("================testConvert002=================");
      console.info(result["_elements"][0]["_elements"][0]["_text"]);
      expect(result["_elements"][0]["_elements"][0]["_text"] == "Hi").assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONVERT_XML_004
     * @tc.name  : testConvertXml004
     * @tc.desc  : To convert XML text to JavaScript object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertXml004", 0, function () {
      let xml = "<?go there?>";
      let conv = new convertxml.ConvertXML();
      let options = { trim: false, declarationKey: "_declaration", instructionKey: "_instruction", attributesKey: "_attributes", textKey: "_text", cdataKey: "_cdata", doctypeKey: "_doctype", commentKey: "_comment", parentKey: "_parent", typeKey: "_type", nameKey: "_name", elementsKey: "_elements" };
      let result = conv.convertToJSObject(xml, options);
      console.info("================testConvert003=================");
      console.info(result["_elements"][0]["_instruction"]);
      expect(result["_elements"][0]["_instruction"] == "there").assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONVERT_XML_005
     * @tc.name  : testConvertXml005
     * @tc.desc  : To convert XML text to JavaScript object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertXml005", 0, function () {
      let xml = "<?go there?>";
      let conv = new convertxml.ConvertXML();
      let options = { trim: false, declarationKey: "_declaration", instructionKey: "_instruction", attributesKey: "_attributes", textKey: "_text", cdataKey: "_cdata", doctypeKey: "_doctype", commentKey: "_comment", parentKey: "_parent", typeKey: "_type", nameKey: "_name", elementsKey: "_elements" };
      let result = conv.convertToJSObject(xml, options);
      console.info("================testConvert004=================");
      console.info(result["_elements"][0]["_type"]);
      expect(result["_elements"][0]["_type"] == "instruction").assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONVERT_OPTIONS_001
     * @tc.name  : testConvertOptions001
     * @tc.desc  : To test ConvertOptions.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testConvertOptions001", 0, function () {
      let xml = '<?xml version="1.0" encoding="utf-8"?>' + '<note importance="high" logged="true">' + "    <title>Happy</title>" + "    <todo>Work</todo>" + "    <todo>Play</todo>" + "</note>";
      let conv = new convertxml.ConvertXML();
      let options = {
        trim: false,
        ignoreDeclaration: false,
        ignoreInstruction: false,
        ignoreAttributes: false,
        ignoreComment: false,
        ignoreCDATA: false,
        ignoreDoctype: false,
        ignoreText: false,
        declarationKey: "_declaration",
        instructionKey: "_instruction",
        attributesKey: "_attributes",
        textKey: "_text",
        cdataKey: "_cdata",
        doctypeKey: "_doctype",
        commentKey: "_comment",
        parentKey: "_parent",
        typeKey: "_type",
        nameKey: "_name",
        elementsKey: "_elements",
      };
      let result = conv.convertToJSObject(xml, options);
      expect(result["_declaration"] != null).assertTrue();
      expect(result["_parent"] == null).assertTrue();
      expect(result["_elements"][0]["_type"] == "element").assertTrue();
      expect(result["_elements"][0]["_name"] == "note").assertTrue();
      expect(result["_elements"][0]["_elements"] != null).assertTrue();
      expect(result["_declaration"]["_attributes"]["version"] == "1.0").assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONVERT_OPTIONS_002
     * @tc.name  : testConvertOptions002
     * @tc.desc  : To test ConvertOptions.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testConvertOptions002", 0, function () {
      let xml = '<?xml version="1.0" encoding="utf-8"?>' + "<!DOCTYPE foo>" + '<note importance="high" logged="true">' + "    <title>Happy</title>" + "    <todo>Work</todo>" + "    <todo>Play</todo>" + "</note>";
      let conv = new convertxml.ConvertXML();
      let options = { trim: false, declarationKey: "_declaration", instructionKey: "_instruction", attributesKey: "_attributes", textKey: "_text", cdataKey: "_cdata", doctypeKey: "doctype", commentKey: "_comment", parentKey: "_parent", typeKey: "_type", nameKey: "_name", elementsKey: "_elements" };
      let result = conv.convertToJSObject(xml, options);
      expect(result["_elements"][0]["doctype"] == "foo").assertTrue();
    });

    /**
     * @tc.number: TEST_CONVERT_OPTIONS_003
     * @tc.name  : testConvertOptions003
     * @tc.desc  : To test ConvertOptions.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testConvertOptions003", 0, function () {
      let xml = '<![CDATA[ \t data]]><![CDATA[< > " and & \t ]]>';
      let conv = new convertxml.ConvertXML();
      let options = { trim: false, declarationKey: "_declaration", instructionKey: "_instruction", attributesKey: "_attributes", textKey: "_text", cdataKey: "_cdata", doctypeKey: "_doctype", commentKey: "_comment", parentKey: "_parent", typeKey: "_type", nameKey: "_name", elementsKey: "_elements" };
      let result = conv.convertToJSObject(xml, options);
      expect(result["_elements"][0]["_cdata"] != null).assertTrue();
    });

    /**
     * @tc.number: TEST_CONVERT_OPTIONS_004
     * @tc.name  : testConvertOptions004
     * @tc.desc  : To test ConvertOptions.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testConvertOptions004", 0, function () {
      let xml = "<!-- \t Hello \t -->\n<!-- \t World \t -->";
      let conv = new convertxml.ConvertXML();
      let options = { trim: false, declarationKey: "_declaration", instructionKey: "_instruction", attributesKey: "_attributes", textKey: "_text", cdataKey: "_cdata", doctypeKey: "_doctype", commentKey: "_comment", parentKey: "_parent", typeKey: "_type", nameKey: "_name", elementsKey: "_elements" };
      let result = conv.convertToJSObject(xml, options);
      expect(result["_elements"][0]["_comment"] != null).assertTrue();
    });
  });
}
