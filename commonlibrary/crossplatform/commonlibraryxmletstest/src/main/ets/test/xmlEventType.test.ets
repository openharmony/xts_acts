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
  describe("XmlEventTypeTest", function () {
    /**
     * @tc.number: TEST_START_DOCUMENT_001
     * @tc.name  : testSTART_DOCUMENT001
     * @tc.desc  : Start file event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testSTART_DOCUMENT001", 0, function () {
      var event = xml.EventType.START_DOCUMENT;
      expect(event).assertEqual(0);
    });

    /**
     * @tc.number: TEST_END_DOCUMENT_001
     * @tc.name  : testEND_DOCUMENT001
     * @tc.desc  : End file event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testEND_DOCUMENT001", 0, function () {
      var event = xml.EventType.END_DOCUMENT;
      expect(event).assertEqual(1);
    });

    /**
     * @tc.number: TEST_START_TAG_001
     * @tc.name  : testSTART_TAG001
     * @tc.desc  : Start the tag event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testSTART_TAG001", 0, function () {
      var event = xml.EventType.START_TAG;
      expect(event).assertEqual(2);
    });

    /**
     * @tc.number: TEST_END_TAG_001
     * @tc.name  : testEND_TAG001
     * @tc.desc  : End tag event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testEND_TAG001", 0, function () {
      var event = xml.EventType.END_TAG;
      expect(event).assertEqual(3);
    });

    /**
     * @tc.number: TEST_TEXT_001
     * @tc.name  : testTEXT001
     * @tc.desc  : Text event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testTEXT001", 0, function () {
      var event = xml.EventType.TEXT;
      expect(event).assertEqual(4);
    });

    /**
     * @tc.number: TEST_CDSECT_001
     * @tc.name  : testCDSECT001
     * @tc.desc  : CDATA Event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testCDSECT001", 0, function () {
      var event = xml.EventType.CDSECT;
      expect(event).assertEqual(5);
    });

    /**
     * @tc.number: TEST_COMMENT_001
     * @tc.name  : testCOMMENT001
     * @tc.desc  : XML comment event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testCOMMENT001", 0, function () {
      var event = xml.EventType.COMMENT;
      expect(event).assertEqual(6);
    });

    /**
     * @tc.number: TEST_DOCDECL_001
     * @tc.name  : testDOCDECL001
     * @tc.desc  : XML document type declaration event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testDOCDECL001", 0, function () {
      var event = xml.EventType.DOCDECL;
      expect(event).assertEqual(7);
    });

    /**
     * @tc.number: TEST_INSTRUCTION_001
     * @tc.name  : testINSTRUCTION001
     * @tc.desc  : XML processing instruction declaration event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testINSTRUCTION001", 0, function () {
      var event = xml.EventType.INSTRUCTION;
      expect(event).assertEqual(8);
    });

    /**
     * @tc.number: TEST_ENTITY_REFERENCE_001
     * @tc.name  : testENTITY_REFERENCE001
     * @tc.desc  : Entity reference event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testENTITY_REFERENCE001", 0, function () {
      var event = xml.EventType.ENTITY_REFERENCE;
      expect(event).assertEqual(9);
    });

    /**
     * @tc.number: TEST_WHITESPACE_001
     * @tc.name  : testWHITESPACE001
     * @tc.desc  : Blank event.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it("testWHITESPACE001", 0, function () {
      var event = xml.EventType.WHITESPACE;
      expect(event).assertEqual(10);
    });
  });
}
