/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from "@ohos/hypium";
import { buffer, JSON, util } from "@kit.ArkTS";

export default function stringDecoderTest() {
  describe('StringDecoderTest', () => {
    beforeAll(() => {

    })

    beforeEach(() => {

    })

    afterAll(() => {

    })

    afterEach(() => {

    })

    let newArr = ['utf-8', 'ibm866', 'iso-8859-2', 'iso-8859-3', 'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
      'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
      'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
      'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'gb18030', 'big5',
      'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0100
     * @tc.name       : test_Decode_Test_001
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("test_Decode_Test_001", 0, (done: Function) => {
      newArr.forEach(item => {
        console.log('nztest', item)
        let decoder = new util.StringDecoder(item);
        let input1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
        let input2 = 'HelloWorld123?HelloWorld123?';
        const decoded1 = decoder.write(input1)
        const decoded2 = decoder.write(input2)
        if (item === 'utf-16be') {
          let input2 = 'HelloWorld123?HelloWorld123?';
        }
        expect(decoded1 === 'HelloWorld123?').assertTrue()
        expect(decoded2 === 'HelloWorld123?HelloWorld123?').assertTrue()

        let input3 = input1.slice(0, 5);
        let input33 = input1.slice(5);
        const decoded3 = decoder.write(input3)
        const decodedend3 = decoder.write(input33)
        expect(decoded3 === 'Hello').assertTrue()
        expect(decodedend3 === 'World123?').assertTrue()

        let input4 = input1.slice(0, 1);
        let input44 = input1.slice(1);
        const decoded4 = decoder.write(input4)
        const decodedend4 = decoder.write(input44)
        expect(decoded4 === 'H').assertTrue()
        expect(decodedend4 === 'elloWorld123?').assertTrue()
      })
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0200
     * @tc.name       : test_Decode_Test_002
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("test_Decode_Test_002", 0, (done: Function) => {
      let that = new util.TextEncoder('utf-16be')
      let result = that.encodeInto('HelLoWorLd123?')
      let decoder = new util.StringDecoder('utf-16be')
      const decoded1 = decoder.write(result)
      expect(decoded1).assertEqual('HelLoWorLd123?')
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0300
     * @tc.name       : test_Decode_Test_003
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("test_Decode_Test_003", 0, (done: Function) => {
      let that = new util.TextEncoder('utf-16le')
      let result = that.encodeInto('HelLoWorLd123?')
      let decoder = new util.StringDecoder('utf-16le')
      const decoded1 = decoder.write(result)
      expect(decoded1).assertEqual('HelLoWorLd123?')
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0400
     * @tc.name       : testArrayScenarios0100
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0100", 0, (done: Function) => {
      const TAG = 'testArrayScenarios0100 == ';
      let encodingArr =
        ['utf-8', 'UTF-8', 'GBK', 'GB2312', 'GB18030', 'gb18030', 'ibm866', 'iso-8859-1', 'iso-8859-2', 'iso-8859-3',
          'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
          'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
          'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
          'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'big5',
          'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']
      let uint8Array = new Uint8Array([0, 0, 0, 0, 0, 72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      encodingArr.forEach(item => {
        console.log(TAG + "encoding", item)
        let textDecoder = util.TextDecoder.create(item, {
          ignoreBOM: false
        })
        let decoded1 = textDecoder.decodeToString(uint8Array)
        let urlcode = encodeURI(decoded1)
        console.info(TAG + `urlcode: ${urlcode}`)
        expect(urlcode).assertEqual('%00%00%00%00%00HelloWorld123?')
      })

      let textDecoderBe = util.TextDecoder.create('utf-16be', {
        ignoreBOM: false
      })
      let decodedBe = textDecoderBe.decodeToString(uint8Array)
      let urlcodeBe = encodeURI(decodedBe)
      console.info(TAG + `urlcodeBe: ${urlcodeBe}`)
      expect(urlcodeBe).assertEqual('%00%00H%E6%95%AC%E6%B1%AF%E5%9D%AF%E7%89%AC%E6%90%B1%E3%88%B3%EF%BF%BD')

      let textDecoderLe = util.TextDecoder.create('utf-16le', {
        ignoreBOM: false
      })
      let decodedLe = textDecoderLe.decodeToString(uint8Array)
      let urlcodeLe = encodeURI(decodedLe)
      console.info(TAG + `urlcodeLe: ${urlcodeLe}`)
      expect(urlcodeLe).assertEqual('%00%00%E4%A0%80%E6%B1%A5%E6%BD%AC%E6%BD%97%E6%B1%B2%E3%85%A4%E3%8C%B2%EF%BF%BD')
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0500
     * @tc.name       : testArrayScenarios0200
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0200", 0, (done: Function) => {
      const TAG = 'testArrayScenarios0200 == ';

      let base64 = new util.Base64Helper();
      let uint8Array = new Uint8Array([
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28
      ])
      let resultEncode1 = base64.encodeSync(uint8Array, util.Type.BASIC)
      let result1 = base64.decodeSync(resultEncode1, util.Type.BASIC)
      console.info(TAG + `result1: ${result1.length} ${result1}`)
      let resultEncode2 = base64.encodeSync(uint8Array, util.Type.BASIC_URL_SAFE)
      let result2 = base64.decodeSync(resultEncode2, util.Type.BASIC_URL_SAFE)
      console.info(TAG + `result2: ${result2.length} ${result2}`)

      expect(result1.length).assertEqual(360)
      expect(JSON.stringify(uint8Array)).assertEqual(JSON.stringify(result1))
      expect(result2.length).assertEqual(360)
      expect(JSON.stringify(uint8Array)).assertEqual(JSON.stringify(result2))
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0600
     * @tc.name       : testArrayScenarios0300
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0300", 0, async (done: Function) => {
      const TAG = 'testArrayScenarios0300 == ';

      let base64 = new util.Base64Helper();
      let uint8Array = new Uint8Array([
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28
      ])

      let resultEncode1 = await base64.encode(uint8Array, util.Type.BASIC)
      let result1 = await base64.decode(resultEncode1, util.Type.BASIC)
      console.info(TAG + `result1: ${result1.length} ${result1}`)
      let resultEncode2 = await base64.encode(uint8Array, util.Type.BASIC_URL_SAFE)
      let result2 = await base64.decode(resultEncode2, util.Type.BASIC_URL_SAFE)
      console.info(TAG + `result2: ${result2.length} ${result2}`)

      expect(result1.length).assertEqual(360)
      expect(JSON.stringify(uint8Array)).assertEqual(JSON.stringify(result1))
      expect(result2.length).assertEqual(360)
      expect(JSON.stringify(uint8Array)).assertEqual(JSON.stringify(result2))
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0700
     * @tc.name       : testArrayScenarios0400
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0400", 0, async (done: Function) => {
      const TAG = 'testArrayScenarios0400 == ';
      let buf = buffer.from([
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28
      ])
      console.info(TAG + `buf: ${buf.length}`)
      expect(buf.length).assertEqual(360)
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0800
     * @tc.name       : testArrayScenarios0500
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0500", 0, (done: Function) => {
      const TAG = 'testArrayScenarios0500 == ';
      let uint8Array = new Uint8Array([0, 0, 0, 0, 0, 72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      let newBuf = buffer.transcode(uint8Array, 'utf-8', 'ascii')
      console.info(TAG + `buf: ${newBuf.toString('ascii')}`)
      expect(newBuf.toString('ascii')).assertEqual('0,0,0,0,0,72,101,108,108,111,87,111,114,108,100,49,50,51,63')
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0900
     * @tc.name       : testArrayScenarios0600
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0600", 0, async (done: Function) => {
      const TAG = 'testArrayScenarios0600 == ';
      let encodingArr =
        ['utf-8', 'UTF-8', 'GBK', 'GB2312', 'GB18030', 'gb18030', 'ibm866', 'iso-8859-1', 'iso-8859-2', 'iso-8859-3',
          'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
          'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
          'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
          'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'big5',
          'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']
      let uint8Array = new Uint8Array([0, 0, 0, 0, 0, 72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      encodingArr.forEach(item => {
        console.log(TAG + "encoding", item)
        let decoder = new util.StringDecoder(item)
        let decoded1 = decoder.write(uint8Array)
        let urlcode = encodeURI(decoded1)
        console.info(TAG + `urlcode: ${urlcode}`)
        expect(urlcode).assertEqual('%00%00%00%00%00HelloWorld123?')
      })

      let decoder1 = new util.StringDecoder('utf-16be')
      let decodedBe = decoder1.write(uint8Array)
      let urlcodeBe = encodeURI(decodedBe)
      console.info(TAG + `urlcodeBe: ${urlcodeBe}`)
      expect(urlcodeBe).assertEqual('%00%00H%E6%95%AC%E6%B1%AF%E5%9D%AF%E7%89%AC%E6%90%B1%E3%88%B3')

      let decoder2 = new util.StringDecoder('utf-16le')
      let decodedLe = decoder2.write(uint8Array)
      let urlcodeLe = encodeURI(decodedLe)
      console.info(TAG + `urlcodeLe: ${urlcodeLe}`)
      expect(urlcodeLe).assertEqual('%00%00%E4%A0%80%E6%B1%A5%E6%BD%AC%E6%BD%97%E6%B1%B2%E3%85%A4%E3%8C%B2')
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1000
     * @tc.name       : testArrayScenarios0700
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0700", 0, async (done: Function) => {
      const TAG = 'testArrayScenarios0700 == ';
      let encodingArr =
        ['utf-8', 'UTF-8', 'GBK', 'GB2312', 'GB18030', 'gb18030', 'ibm866', 'iso-8859-1', 'iso-8859-2', 'iso-8859-3',
          'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
          'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
          'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
          'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'big5',
          'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63, 0, 0, 0, 0, 0])

      encodingArr.forEach(item => {
        console.log(TAG + "encoding", item)
        let decoder = new util.StringDecoder(item)
        let decoded1 = decoder.end(uint8Array.slice(14))
        let urlcode = encodeURI(decoded1)
        console.info(TAG + `urlcode: ${urlcode}`)
        expect(urlcode).assertEqual('%00%00%00%00%00')
      })

      let decoder1 = new util.StringDecoder('utf-16be')
      let decodedBe = decoder1.end(uint8Array.slice(14))
      let urlcodeBe = encodeURI(decodedBe)
      console.info(TAG + `urlcodeBe: ${urlcodeBe}`)
      expect(urlcodeBe).assertEqual('%00%00%EF%BF%BD')

      let decoder2 = new util.StringDecoder('utf-16le')
      let decodedLe = decoder2.end(uint8Array.slice(14))
      let urlcodeLe = encodeURI(decodedLe)
      console.info(TAG + `urlcodeLe: ${urlcodeLe}`)
      expect(urlcodeLe).assertEqual('%00%00%EF%BF%BD')
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1100
     * @tc.name       : testURI_utf8_001
     * @tc.desc       : Test UTF-8 by URI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testURI_utf8_001", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  单字节场景
      for (let i = 0; i <= 127; i++) {
        let binary = i.toString(2);
        if (binary.length === 1) {
          binary = '%0' + binary;
        }
        let de1 = decodeURI(binary)
        let de2 = decodeURIComponent(binary)
        let en1 = encodeURI(de1);
        let en2 = encodeURIComponent(de2);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1200
     * @tc.name       : testURI_utf8_002
     * @tc.desc       : Test UTF-8 by URI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testURI_utf8_002", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  双字节场景
      for (let i = 128; i <= 2047; i++) {
        let binary = i.toString(2);
        if (binary.length === 10) {
          binary = '0' + binary;
        } else if (binary.length === 9) {
          binary = '00' + binary;
        } else if (binary.length === 8) {
          binary = '000' + binary;
        }
        let ziJie1 = binary.substring(0, 5);
        let ziJie2 = binary.substring(5, 11);
        let res1 = '110' + ziJie1;
        let res2 = '10' + ziJie2;
        let binary1 = '%' + parseInt(res1, 2).toString(16);
        let binary2 = '%' + parseInt(res2, 2).toString(16);
        let de1 = decodeURI(binary1 + binary2)
        let de2 = decodeURIComponent(binary1 + binary2)
        let en1 = encodeURI(de1);
        let en2 = encodeURIComponent(de2);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1300
     * @tc.name       : testURI_utf8_003
     * @tc.desc       : Test UTF-8 by URI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testURI_utf8_003", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  三字节场景
      for (let i = 2048; i <= 35535; i++) {
        if (i >= 55296 && i <= 57343) {
          continue;
        }
        let binary = i.toString(2);
        if (binary.length === 15) {
          binary = '0' + binary;
        } else if (binary.length === 14) {
          binary = '00' + binary;
        } else if (binary.length === 13) {
          binary = '000' + binary;
        } else if (binary.length === 12) {
          binary = '0000' + binary;
        }
        let ziJie1 = binary.substring(0, 4);
        let ziJie2 = binary.substring(4, 10);
        let ziJie3 = binary.substring(10, 16);
        let res1 = '1110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let binary1 = '%' + parseInt(res1, 2).toString(16);
        let binary2 = '%' + parseInt(res2, 2).toString(16);
        let binary3 = '%' + parseInt(res3, 2).toString(16);
        let de1 = decodeURI(binary1 + binary2 + binary3)
        let de2 = decodeURIComponent(binary1 + binary2 + binary3)
        let en1 = encodeURI(de1);
        let en2 = encodeURIComponent(de2);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1400
     * @tc.name       : testURI_utf8_004
     * @tc.desc       : Test UTF-8 by URI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testURI_utf8_004", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  三字节场景
      for (let i = 35535; i <= 65535; i++) {
        if (i >= 55296 && i <= 57343) {
          continue;
        }
        let binary = i.toString(2);
        if (binary.length === 15) {
          binary = '0' + binary;
        } else if (binary.length === 14) {
          binary = '00' + binary;
        } else if (binary.length === 13) {
          binary = '000' + binary;
        } else if (binary.length === 12) {
          binary = '0000' + binary;
        }
        let ziJie1 = binary.substring(0, 4);
        let ziJie2 = binary.substring(4, 10);
        let ziJie3 = binary.substring(10, 16);
        let res1 = '1110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let binary1 = '%' + parseInt(res1, 2).toString(16);
        let binary2 = '%' + parseInt(res2, 2).toString(16);
        let binary3 = '%' + parseInt(res3, 2).toString(16);
        let de1 = decodeURI(binary1 + binary2 + binary3)
        let de2 = decodeURIComponent(binary1 + binary2 + binary3)
        let en1 = encodeURI(de1);
        let en2 = encodeURIComponent(de2);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1500
     * @tc.name       : testURI_utf8_005
     * @tc.desc       : Test UTF-8 by URI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testURI_utf8_005", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  四字节场景
      for (let i = 65536; i <= 85535; i++) {
        let binary = i.toString(2);
        if (binary.length === 20) {
          binary = '0' + binary;
        } else if (binary.length === 19) {
          binary = '00' + binary;
        } else if (binary.length === 18) {
          binary = '000' + binary;
        } else if (binary.length === 17) {
          binary = '0000' + binary;
        } else if (binary.length === 16) {
          binary = '00000' + binary;
        }
        let ziJie1 = binary.substring(0, 3);
        let ziJie2 = binary.substring(3, 9);
        let ziJie3 = binary.substring(9, 15);
        let ziJie4 = binary.substring(15, 21);
        let res1 = '11110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let res4 = '10' + ziJie4;
        let binary1 = '%' + parseInt(res1, 2).toString(16);
        let binary2 = '%' + parseInt(res2, 2).toString(16);
        let binary3 = '%' + parseInt(res3, 2).toString(16);
        let binary4 = '%' + parseInt(res4, 2).toString(16);
        let de1 = decodeURI(binary1 + binary2 + binary3 + binary4)
        let de2 = decodeURIComponent(binary1 + binary2 + binary3 + binary4)
        let en1 = encodeURI(de1);
        let en2 = encodeURIComponent(de2);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1600
     * @tc.name       : testURI_utf8_006
     * @tc.desc       : Test UTF-8 by URI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testURI_utf8_006", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  四字节场景
      for (let i = 85535; i <= 104111; i++) {
        let binary = i.toString(2);
        if (binary.length === 20) {
          binary = '0' + binary;
        } else if (binary.length === 19) {
          binary = '00' + binary;
        } else if (binary.length === 18) {
          binary = '000' + binary;
        } else if (binary.length === 17) {
          binary = '0000' + binary;
        } else if (binary.length === 16) {
          binary = '00000' + binary;
        }
        let ziJie1 = binary.substring(0, 3);
        let ziJie2 = binary.substring(3, 9);
        let ziJie3 = binary.substring(9, 15);
        let ziJie4 = binary.substring(15, 21);
        let res1 = '11110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let res4 = '10' + ziJie4;
        let binary1 = '%' + parseInt(res1, 2).toString(16);
        let binary2 = '%' + parseInt(res2, 2).toString(16);
        let binary3 = '%' + parseInt(res3, 2).toString(16);
        let binary4 = '%' + parseInt(res4, 2).toString(16);
        let de1 = decodeURI(binary1 + binary2 + binary3 + binary4)
        let de2 = decodeURIComponent(binary1 + binary2 + binary3 + binary4)
        let en1 = encodeURI(de1);
        let en2 = encodeURIComponent(de2);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1700
     * @tc.name       : testURI_utf8_007
     * @tc.desc       : Test UTF-8 by URI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testURI_utf8_007", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  四字节场景
      for (let i = 104111; i <= 114111; i++) {
        let binary = i.toString(2);
        if (binary.length === 20) {
          binary = '0' + binary;
        } else if (binary.length === 19) {
          binary = '00' + binary;
        } else if (binary.length === 18) {
          binary = '000' + binary;
        } else if (binary.length === 17) {
          binary = '0000' + binary;
        } else if (binary.length === 16) {
          binary = '00000' + binary;
        }
        let ziJie1 = binary.substring(0, 3);
        let ziJie2 = binary.substring(3, 9);
        let ziJie3 = binary.substring(9, 15);
        let ziJie4 = binary.substring(15, 21);
        let res1 = '11110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let res4 = '10' + ziJie4;
        let binary1 = '%' + parseInt(res1, 2).toString(16);
        let binary2 = '%' + parseInt(res2, 2).toString(16);
        let binary3 = '%' + parseInt(res3, 2).toString(16);
        let binary4 = '%' + parseInt(res4, 2).toString(16);
        let de1 = decodeURI(binary1 + binary2 + binary3 + binary4)
        let de2 = decodeURIComponent(binary1 + binary2 + binary3 + binary4)
        let en1 = encodeURI(de1);
        let en2 = encodeURIComponent(de2);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1800
     * @tc.name       : testBuffer_utf8_001
     * @tc.desc       : Test UTF-8 by BUFFER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBuffer_utf8_001", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  单字节场景
      for (let i = 0; i <= 127; i++) {
        let binary = i.toString(2);
        if (binary.length === 1) {
          binary = '0' + binary;
        }
        let decimalNum = parseInt(binary, 2);
        const binaryData = new Uint8Array([decimalNum]);
        const decoder = util.TextDecoder.create('utf-8');
        const test = decoder.decodeToString(binaryData);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1900
     * @tc.name       : testBuffer_utf8_002
     * @tc.desc       : Test UTF-8 by BUFFER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBuffer_utf8_002", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  双字节场景
      for (let i = 128; i <= 2047; i++) {
        let binary = i.toString(2);
        if (binary.length === 10) {
          binary = '0' + binary;
        } else if (binary.length === 9) {
          binary = '00' + binary;
        } else if (binary.length === 8) {
          binary = '000' + binary;
        }
        let ziJie1 = binary.substring(0, 5);
        let ziJie2 = binary.substring(5, 11);
        let res1 = '110' + ziJie1;
        let res2 = '10' + ziJie2;
        let decimalNum = parseInt(res1 + res2, 2);
        const binaryData = new Uint8Array([decimalNum]);
        const decoder = util.TextDecoder.create('utf-8');
        const test = decoder.decodeToString(binaryData);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_2000
     * @tc.name       : testBuffer_utf8_003
     * @tc.desc       : Test UTF-8 by BUFFER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBuffer_utf8_003", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  三字节场景
      for (let i = 2048; i <= 35535; i++) {
        if (i >= 55296 && i <= 57343) {
          continue;
        }
        let binary = i.toString(2);
        if (binary.length === 15) {
          binary = '0' + binary;
        } else if (binary.length === 14) {
          binary = '00' + binary;
        } else if (binary.length === 13) {
          binary = '000' + binary;
        } else if (binary.length === 12) {
          binary = '0000' + binary;
        }
        let ziJie1 = binary.substring(0, 4);
        let ziJie2 = binary.substring(4, 10);
        let ziJie3 = binary.substring(10, 16);
        let res1 = '1110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let decimalNum = parseInt(res1 + res2 + res3, 2);
        const binaryData = new Uint8Array([decimalNum]);
        const decoder = util.TextDecoder.create('utf-8');
        const test = decoder.decodeToString(binaryData);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_2100
     * @tc.name       : testBuffer_utf8_004
     * @tc.desc       : Test UTF-8 by BUFFER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBuffer_utf8_004", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  三字节场景
      for (let i = 35535; i <= 65535; i++) {
        if (i >= 55296 && i <= 57343) {
          continue;
        }
        let binary = i.toString(2);
        if (binary.length === 15) {
          binary = '0' + binary;
        } else if (binary.length === 14) {
          binary = '00' + binary;
        } else if (binary.length === 13) {
          binary = '000' + binary;
        } else if (binary.length === 12) {
          binary = '0000' + binary;
        }
        let ziJie1 = binary.substring(0, 4);
        let ziJie2 = binary.substring(4, 10);
        let ziJie3 = binary.substring(10, 16);
        let res1 = '1110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let decimalNum = parseInt(res1 + res2 + res3, 2);
        const binaryData = new Uint8Array([decimalNum]);
        const decoder = util.TextDecoder.create('utf-8');
        const test = decoder.decodeToString(binaryData);
      }
      done();
    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_2200
     * @tc.name       : testBuffer_utf8_005
     * @tc.desc       : Test UTF-8 by BUFFER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBuffer_utf8_005", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  四字节场景
      for (let i = 65536; i <= 85536; i++) {
        let binary = i.toString(2);
        if (binary.length === 20) {
          binary = '0' + binary;
        } else if (binary.length === 19) {
          binary = '00' + binary;
        } else if (binary.length === 18) {
          binary = '000' + binary;
        } else if (binary.length === 17) {
          binary = '0000' + binary;
        } else if (binary.length === 16) {
          binary = '00000' + binary;
        }
        let ziJie1 = binary.substring(0, 3);
        let ziJie2 = binary.substring(3, 9);
        let ziJie3 = binary.substring(9, 15);
        let ziJie4 = binary.substring(15, 21);
        let res1 = '11110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let res4 = '10' + ziJie4;
        let decimalNum = parseInt(res1 + res2 + res3 + res4, 2);
        const binaryData = new Uint8Array([decimalNum]);
        const decoder = util.TextDecoder.create('utf-8');
        const test = decoder.decodeToString(binaryData);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_2300
     * @tc.name       : testBuffer_utf8_006
     * @tc.desc       : Test UTF-8 by BUFFER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBuffer_utf8_006", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  四字节场景
      for (let i = 85536; i <= 104111; i++) {
        let binary = i.toString(2);
        if (binary.length === 20) {
          binary = '0' + binary;
        } else if (binary.length === 19) {
          binary = '00' + binary;
        } else if (binary.length === 18) {
          binary = '000' + binary;
        } else if (binary.length === 17) {
          binary = '0000' + binary;
        } else if (binary.length === 16) {
          binary = '00000' + binary;
        }
        let ziJie1 = binary.substring(0, 3);
        let ziJie2 = binary.substring(3, 9);
        let ziJie3 = binary.substring(9, 15);
        let ziJie4 = binary.substring(15, 21);
        let res1 = '11110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let res4 = '10' + ziJie4;
        let decimalNum = parseInt(res1 + res2 + res3 + res4, 2);
        const binaryData = new Uint8Array([decimalNum]);
        const decoder = util.TextDecoder.create('utf-8');
        const test = decoder.decodeToString(binaryData);
      }
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_2400
     * @tc.name       : testBuffer_utf8_007
     * @tc.desc       : Test UTF-8 by BUFFER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBuffer_utf8_007", 0, async (done: Function) => {
      // 遍历所有utf-8字符查看是否存在异常  四字节场景
      for (let i = 104111; i <= 114111; i++) {
        let binary = i.toString(2);
        if (binary.length === 20) {
          binary = '0' + binary;
        } else if (binary.length === 19) {
          binary = '00' + binary;
        } else if (binary.length === 18) {
          binary = '000' + binary;
        } else if (binary.length === 17) {
          binary = '0000' + binary;
        } else if (binary.length === 16) {
          binary = '00000' + binary;
        }
        let ziJie1 = binary.substring(0, 3);
        let ziJie2 = binary.substring(3, 9);
        let ziJie3 = binary.substring(9, 15);
        let ziJie4 = binary.substring(15, 21);
        let res1 = '11110' + ziJie1;
        let res2 = '10' + ziJie2;
        let res3 = '10' + ziJie3;
        let res4 = '10' + ziJie4;
        let decimalNum = parseInt(res1 + res2 + res3 + res4, 2);
        const binaryData = new Uint8Array([decimalNum]);
        const decoder = util.TextDecoder.create('utf-8');
        const test = decoder.decodeToString(binaryData);
      }
      done();
    })

  })
}