/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import uri from "@ohos.uri";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
export function UriTest() {
  describe("UriTest", function () {
    /**
     * @tc.number: TEST_URI_CONSTRUCTION_001
     * @tc.name  : testUriConstruction001
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction001", 0, function () {
      try {
        let that = new uri.URI("#http://username:password@host:8080/directory/file?foo=1&bar=2");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_002
     * @tc.name  : testUriConstruction002
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction002", 0, function () {
      try {
        let that = new uri.URI("ht/tp://username:pas sword@host:8080/directory/file?foo=1&bar=2");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_003
     * @tc.name  : testUriConstruction003
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction003", 0, function () {
      try {
        let that = new uri.URI("http://username:password@[::]:8080/directory/file?Query#gaogao faofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_004
     * @tc.name  : testUriConstruction004
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction004", 0, function () {
      try {
        let that = new uri.URI("http://username:password@host:8080/directory/file?foo^=1&bar=2#gaogaofaofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_005
     * @tc.name  : testUriConstruction005
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction005", 0, function () {
      try {
        let that = new uri.URI("1http://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_006
     * @tc.name  : testUriConstruction006
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction006", 0, function () {
      try {
        let that = new uri.URI("ht@tp://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_007
     * @tc.name  : testUriConstruction007
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction007", 0, function () {
      try {
        let that = new uri.URI("http://username:password@[::]:80r80/directory/file?foo=1&bar=2#gaogaofaofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_008
     * @tc.name  : testUriConstruction008
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction008", 0, function () {
      try {
        let that = new uri.URI("http://username:password@[::12:55:8080/directory/file?foo=1&bar=2#gaogaofaofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_009
     * @tc.name  : testUriConstruction009
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction009", 0, function () {
      try {
        let that = new uri.URI("http://username:pa^ssword@[::12:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_010
     * @tc.name  : testUriConstruction010
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction010", 0, function () {
      try {
        let that = new uri.URI("http://username:password@[::1你2:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao");
        expect(false).assertEqual(true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    });

    /**
     * @tc.number: TEST_URI_CONSTRUCTION_011
     * @tc.name  : testUriConstruction011
     * @tc.desc  : Constructs a URI by parsing the given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUriConstruction011", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@www.baidu.com:99/path/path?query#fagment");
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@www.baidu.com:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@www.baidu.com:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("www.baidu.com");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    });

    /**
     * @tc.number: TEST_EQUALS_TO_001
     * @tc.name  : testEqualsTo001
     * @tc.desc  : Tests this URI for equality with another object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqualsTo001", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment");
      let gaogao1 = gaogao;
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_EQUALS_TO_002
     * @tc.name  : testEqualsTo002
     * @tc.desc  : Tests this URI for equality with another object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqualsTo002", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment");
      let gaogao1 = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment");
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_EQUALS_TO_003
     * @tc.name  : testEqualsTo003
     * @tc.desc  : Tests this URI for equality with another object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqualsTo003", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment");
      let gaogao1 = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123");
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_EQUALS_TO_004
     * @tc.name  : testEqualsTo004
     * @tc.desc  : Tests this URI for equality with another object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqualsTo004", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@wwwaaa:99/path1?query#fagment");
      let gaogao1 = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123");
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_EQUALS_TO_005
     * @tc.name  : testEqualsTo005
     * @tc.desc  : Tests this URI for equality with another object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqualsTo005", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment");
      let gaogao1 = new uri.URI("http://[1:0:0:1:2:1:2:1]/path1?query#fagment123");
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_NORMALIZE_001
     * @tc.name  : testNormalize001
     * @tc.desc  : Normalizes this URI's path.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testNormalize001", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66./../././mm/.././path1?query#fagment");
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/path1");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/path1?query#fagment");
    });

    /**
     * @tc.number: TEST_NORMALIZE_002
     * @tc.name  : testNormalize002
     * @tc.desc  : Normalizes this URI's path.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testNormalize002", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment");
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../path");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment");
    });

    /**
     * @tc.number: TEST_NORMALIZE_003
     * @tc.name  : testNormalize003
     * @tc.desc  : Normalizes this URI's path.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testNormalize003", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment");
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../../aa/bb/cc?query#fagment");
    });

    /**
     * @tc.number: TEST_NORMALIZE_004
     * @tc.name  : testNormalize004
     * @tc.desc  : Normalizes this URI's path.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testNormalize004", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../path/.././../aa/bb/cc?query");
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../aa/bb/cc?query");
    });

    /**
     * @tc.number: TEST_NORMALIZE_005
     * @tc.name  : testNormalize005
     * @tc.desc  : Normalizes this URI's path.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testNormalize005", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/./path/./aa/bb/cc?query#fagment");
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/aa/bb/cc?query#fagment");
    });

    /**
     * @tc.number: TEST_TO_STRING_001
     * @tc.name  : testToString001
     * @tc.desc  : Returns the content of this URI as a US-ASCII string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString001", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment");
      let res = gaogao.toString();
      expect(res).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment");
    });

    /**
     * @tc.number: TEST_TO_STRING_002
     * @tc.name  : testToString002
     * @tc.desc  : Returns the content of this URI as a US-ASCII string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString002", 0, function () {
      let gaogao = new uri.URI("htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment");
      let res = gaogao.toString();
      expect(res).assertEqual("htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment");
    });

    /**
     * @tc.number: TEST_TO_STRING_003
     * @tc.name  : testToString003
     * @tc.desc  : Returns the content of this URI as a US-ASCII string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString003", 0, function () {
      let gaogao = new uri.URI("ftp://username:password@www.baidu.com:88/path?query#fagment");
      let res = gaogao.toString();
      expect(res).assertEqual("ftp://username:password@www.baidu.com:88/path?query#fagment");
    });

    /**
     * @tc.number: TEST_TO_STRING_004
     * @tc.name  : testToString004
     * @tc.desc  : Returns the content of this URI as a US-ASCII string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString004", 0, function () {
      let gaogao = new uri.URI("http://gg:gao你好gao@199.98.55.44:99/path/p你好ath?qu你好ery#fag你好ment");
      let res = gaogao.toString();
      expect(res).assertEqual("http://gg:gao%E4%BD%A0%E5%A5%BDgao@199.98.55.44:99/path/" + "p%E4%BD%A0%E5%A5%BDath?qu%E4%BD%A0%E5%A5%BDery#fag%E4%BD%A0%E5%A5%BDment");
    });

    /**
     * @tc.number: TEST_TO_STRING_005
     * @tc.name  : testToString005
     * @tc.desc  : Returns the content of this URI as a US-ASCII string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString005", 0, function () {
      let gaogao = new uri.URI("http://gg:gaogao@199.98.55.44:99/path/path?query#fagment");
      let res = gaogao.toString();
      expect(res).assertEqual("http://gg:gaogao@199.98.55.44:99/path/path?query#fagment");
    });

    /**
     * @tc.number: TEST_CHECK_IS_ABSOLUTE_001
     * @tc.name  : testCheckIsAbsolute001
     * @tc.desc  : Tells whether or not this URI is absolute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCheckIsAbsolute001", 0, function () {
      let gaogao = new uri.URI("f/tp://username:password@www.baidu.com:88/path?query#fagment");
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CHECK_IS_ABSOLUTE_002
     * @tc.name  : testCheckIsAbsolute002
     * @tc.desc  : Tells whether or not this URI is absolute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCheckIsAbsolute002", 0, function () {
      let gaogao = new uri.URI("ftp://username:password@www.baidu.com:88/path?query#fagment");
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CHECK_IS_ABSOLUTE_003
     * @tc.name  : testCheckIsAbsolute003
     * @tc.desc  : Tells whether or not this URI is absolute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCheckIsAbsolute003", 0, function () {
      let gaogao = new uri.URI("htt/p://username:password@www.baidu.com:88/path?query#fagment");
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CHECK_IS_ABSOLUTE_004
     * @tc.name  : testCheckIsAbsolute004
     * @tc.desc  : Tells whether or not this URI is absolute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCheckIsAbsolute004", 0, function () {
      let gaogao = new uri.URI("https://username:password@www.baidu.com:88/path?query#fagment");
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CHECK_IS_ABSOLUTE_005
     * @tc.name  : testCheckIsAbsolute005
     * @tc.desc  : Tells whether or not this URI is absolute.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCheckIsAbsolute005", 0, function () {
      let gaogao = new uri.URI("http1://username:password@www.baidu.com:88/path?query#fagment");
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
    });
  });
}
