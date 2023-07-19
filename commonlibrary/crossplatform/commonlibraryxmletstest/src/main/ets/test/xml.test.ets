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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
} from "@ohos/hypium";
import xml from "@ohos.xml";
import util from "@ohos.util";
export default function XmlSerializerXmlPullParserTest() {
  describe("XmlSerializerXmlPullParserTest", function () {
    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an xml instance. For example: let xml = new xml.XmlSerializer(arrayBuffer).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      try {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        expect(thatSer != null).assertEqual(true);
      } catch (err) {
        console.log("testConstructor001 meet error: " + err);
      }
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_002
     * @tc.name  : testConstructor002
     * @tc.desc  : Create an xml instance. For example: let xml = new xml.XmlSerializer(arrayBuffer, encoding).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor002", 0, function () {
      try {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        expect(thatSer != null).assertEqual(true);
      } catch (err) {
        console.log("testConstructor001 meet error: " + err);
      }
    });

    /**
     * @tc.number: TEST_SET_ATTRIBUTES_001
     * @tc.name  : testsetAttributes001
     * @tc.desc  : Write an attribute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetAttributes001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.endElement();
      var result = '<note importance1="high1"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_ATTRIBUTES_002
     * @tc.name  : testsetAttributes002
     * @tc.desc  : Write an attribute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetAttributes002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.endElement();
      var result = '<note importance1="high1" importance2="high2"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_ATTRIBUTES_003
     * @tc.name  : testsetAttributes003
     * @tc.desc  : Write an attribute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetAttributes003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.endElement();
      var result =
        '<note importance1="high1" importance2="high2" importance3="high3"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_ATTRIBUTES_004
     * @tc.name  : testsetAttributes004
     * @tc.desc  : Write an attribute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetAttributes004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.setAttributes("importance4", "high4");
      thatSer.endElement();
      var result =
        '<note importance1="high1" importance2="high2" importance3="high3" importance4="high4"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_ADD_EMPTY_ELEMENT_001
     * @tc.name  : testAddEmptyElement001
     * @tc.desc  : Add an empty element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAddEmptyElement001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.addEmptyElement("a");
      thatSer.endElement();
      var result = "<note>\r\n  <a/>\r\n</note>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_ADD_EMPTY_ELEMENT_002
     * @tc.name  : testAddEmptyElement002
     * @tc.desc  : Add an empty element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAddEmptyElement002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.addEmptyElement("b");
      var result = "<note/>\r\n<b/>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_ADD_EMPTY_ELEMENT_003
     * @tc.name  : testAddEmptyElement003
     * @tc.desc  : Add an empty element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAddEmptyElement003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.addEmptyElement("c");
      thatSer.startElement("note");
      thatSer.endElement();
      var result = "<c/>\r\n<note/>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_ADD_EMPTY_ELEMENT_004
     * @tc.name  : testAddEmptyElement004
     * @tc.desc  : Add an empty element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAddEmptyElement004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.addEmptyElement("d");
      var result = "<d/>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_ADD_EMPTY_ELEMENT_005
     * @tc.name  : testAddEmptyElement005
     * @tc.desc  : Add an empty element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAddEmptyElement005", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.addEmptyElement("c");
      thatSer.addEmptyElement("d");
      thatSer.endElement();
      var result = "<note>\r\n  <c/>\r\n  <d/>\r\n</note>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_DECLARATION_001
     * @tc.name  : testSetDeclaration001
     * @tc.desc  : Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetDeclaration001", 0, function () {
      var arrayBuffer = new ArrayBuffer(2048);
      var thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
      thatSer.setDeclaration();
      var result = '<?xml version="1.0" encoding="utf-8"?>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_START_ELEMENT_001
     * @tc.name  : testStartElement001
     * @tc.desc  : Writes an elemnet start tag with the given name.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testStartElement001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.endElement();
      var result = "<note1/>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_START_ELEMENT_002
     * @tc.name  : testStartElement002
     * @tc.desc  : Writes an elemnet start tag with the given name.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testStartElement002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.endElement();
      thatSer.startElement("note2");
      thatSer.endElement();
      var result = "<note1/>\r\n<note2/>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_START_ELEMENT_003
     * @tc.name  : testStartElement003
     * @tc.desc  : Writes an elemnet start tag with the given name.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testStartElement003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      var result = "<note1>\r\n  <note2/>\r\n</note1>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_START_ELEMENT_004
     * @tc.name  : testStartElement004
     * @tc.desc  : Writes an elemnet start tag with the given name.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testStartElement004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      thatSer.endElement();
      var result =
        "<note1>\r\n  <note2>\r\n    <note3/>\r\n  </note2>\r\n</note1>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_START_ELEMENT_005
     * @tc.name  : testStartElement005
     * @tc.desc  : Writes an elemnet start tag with the given name.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testStartElement005", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      var result = "<note1>\r\n  <note2/>\r\n  <note3/>\r\n</note1>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_END_ELEMENT_001
     * @tc.name  : testEndElement001
     * @tc.desc  : Writes end tag of the element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEndElement001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      var result = "<note/>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_END_ELEMENT_002
     * @tc.name  : testEndElement002
     * @tc.desc  : Writes end tag of the element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEndElement002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.endElement();
      var result = '<note importance="high"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_END_ELEMENT_003
     * @tc.name  : testEndElement003
     * @tc.desc  : Writes end tag of the element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEndElement003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("impo", "hi");
      thatSer.endElement();
      var result = '<note impo="hi"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_END_ELEMENT_004
     * @tc.name  : testEndElement004
     * @tc.desc  : Writes end tag of the element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEndElement004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      var result = "<note1>\r\n  <note2/>\r\n</note1>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_END_ELEMENT_005
     * @tc.name  : testEndElement005
     * @tc.desc  : Writes end tag of the element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEndElement005", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note2");
      thatSer.setAttributes("importance", "high");
      thatSer.endElement();
      var result = '<note2 importance="high"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_NAMESPECE_001
     * @tc.name  : testSetNamespace001
     * @tc.desc  : Writes the namespace of the current element tag.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetNamespace001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      var result =
        '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.w3.org/TR/html4/"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_NAMESPECE_002
     * @tc.name  : testSetNamespace002
     * @tc.desc  : Writes the namespace of the current element tag.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetNamespace002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("b", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      var result =
        '<?xml version="1.0" encoding="utf-8"?>\r\n<b:note xmlns:b="http://www.w3.org/TR/html4/"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_NAMESPECE_003
     * @tc.name  : testSetNamespace003
     * @tc.desc  : Writes the namespace of the current element tag.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetNamespace003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.111/");
      thatSer.startElement("note");
      thatSer.endElement();
      var result =
        '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.111/"/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_NAMESPECE_004
     * @tc.name  : testSetNamespace004
     * @tc.desc  : Writes the namespace of the current element tag.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetNamespace004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      var result =
        '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note1 xmlns:h="http://www.w3.org/TR/html4/">' +
        "\r\n  <h:note2/>\r\n</h:note1>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_COMMENT_001
     * @tc.name  : testSetComment001
     * @tc.desc  : Writes the comment.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetComment001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setComment("Hi!");
      thatSer.endElement();
      var result = "<note>\r\n  <!--Hi!-->\r\n</note>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_COMMENT_002
     * @tc.name  : testSetComment002
     * @tc.desc  : Writes the comment.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetComment002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setComment("Hello, World!");
      thatSer.endElement();
      var result = "<note>\r\n  <!--Hello, World!-->\r\n</note>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_COMMENT_003
     * @tc.name  : testSetComment003
     * @tc.desc  : Writes the comment.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetComment003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      var result = "<!--Hello, World!-->";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_COMMENT_005
     * @tc.name  : testSetComment005
     * @tc.desc  : Writes the comment.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetComment004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      thatSer.startElement("note");
      thatSer.endElement();
      var result = "<!--Hello, World!-->\r\n<note/>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_CDATA_001
     * @tc.name  : testSetCDATA001
     * @tc.desc  : Writes the CDATA.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetCDATA001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA("root SYSTEM");
      var result = "<![CDATA[root SYSTEM]]>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_CDATA_002
     * @tc.name  : testSetCDATA002
     * @tc.desc  : Writes the CDATA.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetCDATA002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"');
      var result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_CDATA_003
     * @tc.name  : testSetCDATA003
     * @tc.desc  : Writes the CDATA.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetCDATA003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"');
      var result =
        '<note/>\r\n<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_CDATA_004
     * @tc.name  : testSetCDATA004
     * @tc.desc  : Writes the CDATA.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetCDATA004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.endElement();
      var result =
        '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n<note/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_CDATA_005
     * @tc.name  : testSetCDATA005
     * @tc.desc  : Writes the CDATA.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetCDATA005", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.endElement();
      var result =
        '<note>\r\n  <![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n</note>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_TEXT_001
     * @tc.name  : testSetText001
     * @tc.desc  : Writes the CDATA.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetText001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy1");
      thatSer.endElement();
      var result = '<note importance="high">Happy1</note>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_TEXT_002
     * @tc.name  : testSetText002
     * @tc.desc  : Writes the CDATA.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetText002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy2");
      thatSer.endElement();
      var result = '<note importance="high">Happy2</note>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_DOC_TYPE_001
     * @tc.name  : testSetDocType001
     * @tc.desc  : Writes the DOCTYPE.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetDocType001", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType("root SYSTEM");
      var result = "<!DOCTYPE root SYSTEM>";
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_DOC_TYPE_002
     * @tc.name  : testSetDocType002
     * @tc.desc  : Writes the DOCTYPE.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetDocType002", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      var result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_DOC_TYPE_003
     * @tc.name  : testSetDocType003
     * @tc.desc  : Writes the DOCTYPE.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetDocType003", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      var result =
        '<note/>\r\n<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_DOC_TYPE_004
     * @tc.name  : testSetDocType004
     * @tc.desc  : Writes the DOCTYPE.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetDocType004", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.endElement();
      var result =
        '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n<note/>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_SET_DOC_TYPE_005
     * @tc.name  : testSetDocType005
     * @tc.desc  : Writes the DOCTYPE.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetDocType005", 0, function () {
      const myMAX = 2048;
      var arrayBuffer = new ArrayBuffer(myMAX);
      var thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.endElement();
      var result =
        '<note>\r\n  <!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n</note>';
      var view = new Uint8Array(arrayBuffer);
      var view1 = "";
      for (var i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    });

    /**
     * @tc.number: TEST_GET_COLUMN_NUMBER_001
     * @tc.name  : testGetColumnNumber001
     * @tc.desc  : Get the current column number, starting from 1.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetColumnNumber001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getColumnNumber();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:1key:2 value:77key:10 value:81key:2 value:88key:4 value:93key:3 value:101" +
        "key:3 value:108key:1 value:215";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_GET_DEPTH_001
     * @tc.name  : testGetDepth001
     * @tc.desc  : Gets the current depth of the element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetDepth001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getDepth();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:0key:2 value:1key:10 value:1key:2 value:2key:4 value:2key:3 value:2key:3 value:1key:1 value:0";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_GET_LINE_NUMBER_001
     * @tc.name  : testGetLineNumber001
     * @tc.desc  : Get the current line number, starting from 1.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLineNumber001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;

      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getLineNumber();
        str += arrTag[i];
        i++;
        return true;
      }

      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:1key:2 value:1key:10 value:1key:2 value:1key:4 value:1key:3 value:1key:3 value:1key:1 value:1";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_GET_NAME_001
     * @tc.name  : testGetName001
     * @tc.desc  : Gets the current element name.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetName001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getName();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:key:2 value:notekey:10 value:key:2 value:titlekey:4 value:key:3 value:titlekey:3 value:notekey:1 value:";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_GET_NAME_SPACE_001
     * @tc.name  : testGetNamespace001
     * @tc.desc  : Gets the namespace of the current element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetNamespace001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getNamespace();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:key:2 value:key:10 value:key:2 value:key:4 value:key:3 value:key:3 value:key:1 value:";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_GET_PREFIX_001
     * @tc.name  : testGetPrefix001
     * @tc.desc  : Gets the namespace of the current element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetPrefix001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getPrefix();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:key:2 value:key:10 value:key:2 value:key:4 value:key:3 value:key:3 value:key:1 value:";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_GET_TEXT_001
     * @tc.name  : testGetText001
     * @tc.desc  : Gets the text content of the current event.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetText001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getText();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:key:2 value:key:10 value:    key:2 value:key:4 value:Happykey:3 value:key:3 value:key:1 value:";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_IS_EMPTY_ELEMENT_001
     * @tc.name  : testIsEmptyElementTag001
     * @tc.desc  : Determine whether the current element is an empty element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmptyElementTag001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.isEmptyElementTag();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:falsekey:2 value:falsekey:10 value:falsekey:2 value:falsekey:4 value:falsekey:3 value:falsekey:3 value:falsekey:1 value:false";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_IS_WHITE_SPACE_001
     * @tc.name  : testIsWhitespace001
     * @tc.desc  : Determine whether the current element is an empty element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWhitespace001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.isWhitespace();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:truekey:2 value:falsekey:10 value:truekey:2 value:truekey:4 value:falsekey:3 value:truekey:3 value:truekey:1 value:true";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_GET_ATTRIBUTE_COUNT_001
     * @tc.name  : testGetAttributeCount001
     * @tc.desc  : Gets the number of attributes for the current start tag.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetAttributeCount001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let arrTag = {};
      let str = "";
      let i = 0;
      function func(key, value) {
        arrTag[i] = "key:" + key + " value:" + value.getAttributeCount();
        str += arrTag[i];
        i++;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      const expectResult =
        "key:0 value:0key:2 value:2key:10 value:0key:2 value:0key:4 value:0key:3 value:0key:3 value:0key:1 value:0";
      expect(expectResult == str).assertTrue();
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Construct and return an XmlPullParser object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
        '<note importance="high" logged="true">' +
        "    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>" +
        "    <!--Hello, World!-->" +
        "    <company>John &amp; Hans</company>" +
        "    <title>Happy</title>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer, "UTF-8");
      let str = "";
      function func1(name, value) {
        str += name + ":" + value;
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: func1,
      };
      that.parse(options);
      const expectResult =
        ':: note [<!ENTITY foo "baa">]note::    :funcrion matchwo(a,6){return 1;}:    :Hello, World!:    company::John amp;:amp;: Hanscompany::    title::Happytitle:note::';
      expect(expectResult == str).assertTrue();
    });
    /**
     * @tc.number: TEST_PARSE_001
     * @tc.name  : testParse001
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParse001", 0, function () {
      var strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
        '<note importance="high" logged="true">' +
        "    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>" +
        "    <!--Hello, World!-->" +
        "    <company>John &amp; Hans</company>" +
        "    <title>Happy</title>" +
        "    <title>Happy</title>" +
        "    <lens>Work</lens>" +
        "    <lens>Play</lens>" +
        "    <?go there?>" +
        "    <a><b/></a>" +
        '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
        "        <h:tr>" +
        "            <h:td>Apples</h:td>" +
        "            <h:td>Bananas</h:td>" +
        "        </h:tr>" +
        "    </h:table>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer, "UTF-8");
      var str = "";
      function func2(name, value) {
        str += name + ":" + value;
        return true;
      }
      var options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeValueCallbackFunction: func2,
      };
      that.parse(options);
      var str1 =
        "importance:highlogged:truexmlns:h:http://www.w3.org/TR/html4/";
      expect(str).assertEqual(str1);
    });

    /**
     * @tc.number: TEST_PARSE_002
     * @tc.name  : testParse002
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParse002", 0, function () {
      var strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
        '<note importance="high" logged="true">' +
        "    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>" +
        "    <!--Hello, World!-->" +
        "    <company>John &amp; Hans</company>" +
        "    <title>Happy</title>" +
        "    <title>Happy</title>" +
        "    <lens>Work</lens>" +
        "    <lens>Play</lens>" +
        "    <?go there?>" +
        "    <a><b/></a>" +
        '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
        "        <h:tr>" +
        "            <h:td>Apples</h:td>" +
        "            <h:td>Bananas</h:td>" +
        "        </h:tr>" +
        "    </h:table>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      var str1 = "";
      function func1(name, value) {
        str1 += name + value + " ";
        return true;
      }
      var options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: func1,
      };
      that.parse(options);
      var str3 =
        '  note [<!ENTITY foo "baa">] note      funcrion matchwo(a,6){return 1;}      Hello, World!      ' +
        "company John  amp;amp;  Hans company      title Happy title      title Happy title      " +
        "lens Work lens      lens Play lens      go there      a b b a      h:table          " +
        "h:tr              h:td Apples h:td              h:td Bananas h:td          h:tr      " +
        "h:table note  ";
      expect(str1).assertEqual(str3);
    });

    /**
     * @tc.number: TEST_PARSE_003
     * @tc.name  : testParse003
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParse003", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "    <todo>Work</todo>" +
        "    <todo>Play</todo>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let str = "";
      function func(key, value) {
        str += "key:" + key + " value:" + value.getColumnNumber() + "  ";
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      let result =
        "key:0 value:1  key:2 value:77  key:10 value:81  key:2 value:88  key:4 value:93  " +
        "key:3 value:101  key:10 value:105  key:2 value:111  key:4 value:115  key:3 value:122  key:10 value:126  " +
        "key:2 value:132  key:4 value:136  key:3 value:143  key:3 value:150  key:1 value:299  ";
      expect(str).assertEqual(result);
    });

    /**
     * @tc.number: TEST_PARSE_004
     * @tc.name  : testParse004
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParse004", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "    <todo>Work</todo>" +
        "    <todo>Play</todo>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let str = "";
      function func(key, value) {
        str += "key:" + key + " value:" + value.getDepth() + "  ";
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      let result =
        "key:0 value:0  key:2 value:1  key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  " +
        "key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  key:10 value:1  key:2 value:2  " +
        "key:4 value:2  key:3 value:2  key:3 value:1  key:1 value:0  ";
      expect(str).assertEqual(result);
    });

    /**
     * @tc.number: TEST_PARSE_005
     * @tc.name  : testParse005
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParse005", 0, function () {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        "    <title>Happy</title>" +
        "    <todo>Work</todo>" +
        "    <todo>Play</todo>" +
        "</note>";
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let str = "";
      function func(key, value) {
        str += "key:" + key + " value:" + value.getLineNumber() + "  ";
        return true;
      }
      let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func,
      };
      that.parse(options);
      let result =
        "key:0 value:1  key:2 value:1  key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  " +
        "key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  key:10 value:1  key:2 value:1  " +
        "key:4 value:1  key:3 value:1  key:3 value:1  key:1 value:1  ";
      expect(str).assertEqual(result);
    });
  });
}
