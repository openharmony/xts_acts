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
  describe("XmlParseOptionTest", function () {
    /**
     * @tc.number: TEST_PARSE_OPTION_001
     * @tc.name  : testParseOptions001
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParseOptions001", 0, function () {
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
     * @tc.number: TEST_PARSE_OPTION_002
     * @tc.name  : testParseOptions002
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParseOptions002", 0, function () {
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
     * @tc.number: TEST_PARSE_OPTION_002
     * @tc.name  : testParseOptions002
     * @tc.desc  : Starts parsing the XML file.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParseOptions003", 0, function () {
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
  });
}
