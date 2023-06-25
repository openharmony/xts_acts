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
import UDMF from '@ohos.data.UDMF';

const TAG = '[ttt]'

export default function UDMFApiPromise() {
  describe('UDMFApiPromise', function () {

    beforeEach(async function () {
      console.info(TAG + "beforeEach")
      let options = {
        intention: UDMF.Intention.DATA_HUB
      };
      await UDMF.deleteData(options).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    console.info(TAG + "*************Unit Test Begin*************")

    /**
     * @tc.number SUB_DDM_UDMF_InsertData_Promise_0100
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_InsertData_Promise_0100', 0, function (done) {
      let Options = {}
      let plainText = new UDMF.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      }
      catch (error) {
        console.error(TAG, `Failed to insertData0100 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_InsertData_Promise_0200
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_InsertData_Promise_0200', 0, function (done) {
      let Options = {
        intention: undefined
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      }
      catch (error) {
        console.error(TAG, `Failed to insertData0200 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_InsertData_Promise_0300
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_InsertData_Promise_0300', 0, function (done) {
      let Options = {
        intention:null
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      }
      catch (error) {
        console.error(TAG, `Failed to insertData0300 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_InsertData_Promise_0400
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_InsertData_Promise_0400', 0, function (done) {
      let Options = {
        intention: undefined,
        key: undefined
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      }
      catch (error) {
        console.error(TAG, `Failed to insertData0400 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_InsertData_Promise_0500
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_InsertData_Promise_0500', 0, function (done) {
      let Options = {
        key: null
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      }
      catch (error) {
        console.error(TAG, `Failed to insertData0500 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_InsertData_Promise_0600
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_InsertData_Promise_0600', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try{
        UDMF.insertData(options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${options}`);
          expect(data !== null).assertTrue();
          done()
        }).catch((err) => {
          console.error(TAG, `Failed to insertData0600 code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        });
      }catch(error){
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_UpdateData_Promise_0100
     * @tc.name UDMF updateData promise interface test
     * @tc.desc UDMF updateData promise interface test.
     */
    it('SUB_DDM_UDMF_UpdateData_Promise_0100', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try{
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          UDMF.updateData({key: data}, unifiedData).then((ret) => {
            console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
            expect(ret !== null).assertTrue();
            done();
          }).catch((err) => {
            console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });

        });
      }catch(error){
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_UpdateData_Promise_0200
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_UpdateData_Promise_0200', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0200 success; data = ${data}, options = ${options}`);
          try{
            UDMF.updateData({key: undefined}, unifiedData).then((ret) => {
              console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
              expect().assertFail()
              done();
            }).catch((err) => {
              console.info(`UpdateData1111 failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          }catch(errInfo){
            console.info(`UpdateData2222 failed. code is ${errInfo.code},message is ${errInfo.message} `);
            expect(errInfo.code).assertEqual('401');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_UpdateData_Promise_0300
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */
    it('SUB_DDM_UDMF_UpdateData_Promise_0300', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0300 success; data = ${data}, options = ${options}`);
          try{
            UDMF.updateData({key: null}, unifiedData).then((ret) => {
              console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
              expect().assertFail()
              done();
            }).catch((err) => {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          }catch(errInfo){
            console.info(`UpdateData failed. code is ${errInfo.code},message is ${errInfo.message} `);
            expect(errInfo.code).assertEqual('401');
            done();
          }

        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_UpdateData_Promise_0400
     * @tc.name UDMF insertData promise interface test
     * @tc.desc UDMF insertData promise interface test.
     */

    it('SUB_DDM_UDMF_UpdateData_Promise_0400', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB,
        key: undefined
      }
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try{
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          UDMF.updateData({key: data}, unifiedData).then((ret) => {
            console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
            expect(ret !== null).assertTrue();
            done();
          }).catch((err) => {
            console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      }catch(error){
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_QueryData_Promise_0100
     * @tc.name UDMF queryData promise interface test
     * @tc.desc UDMF queryData promise interface test.
     */
    it('SUB_DDM_UDMF_QueryData_Promise_0100', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          UDMF.queryData(options).then((ret) => {
            let size = ret.length;
            console.info(TAG, ` data.size = ${size}`);
            for (var i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (var j = 0; j < size; j++) {
                if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                  let text = <UDMF.PlainText> (records[j]);
                  console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                }
              }
            }
            expect(size).assertEqual(1);
            done();
          }).catch((err) => {
            console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_QueryData_Promise_0200
     * @tc.name UDMF queryData promise interface test
     * @tc.desc UDMF queryData promise interface test.
     */
    it('SUB_DDM_UDMF_QueryData_Promise_0200', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          UDMF.queryData({key: data}).then((ret) => {
            let size = ret.length;
            console.info(TAG, ` data.size = ${size}`);
            for (var i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (var j = 0; j < size; j++) {
                if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                  let text = <UDMF.PlainText> (records[j]);
                  console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                }
              }
            }
            expect(size).assertEqual(1);
            done();
          }).catch((err) => {
            console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_QueryData_Promise_0300
     * @tc.name UDMF queryData promise interface test
     * @tc.desc UDMF queryData promise interface test.
     */
    it('SUB_DDM_UDMF_QueryData_Promise_0300', 0, function (done) {
      let options1 = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options1, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
          let options2 = {
            intention: UDMF.Intention.DATA_HUB,
            key: data
          };
          UDMF.queryData(options2).then((ret) => {
            let size = ret.length;
            console.info(TAG, ` data.size = ${size}`);
            for (var i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (var j = 0; j < size; j++) {
                if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                  let text = <UDMF.PlainText> (records[j]);
                  console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                }
              }
            }
            expect(size).assertEqual(1);
            done();
          }).catch((err) => {
            console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_QueryData_Promise_0400
     * @tc.name UDMF queryData promise interface test
     * @tc.desc UDMF queryData promise interface test.
     */
    it('SUB_DDM_UDMF_QueryData_Promise_0400', 0, function (done) {
      let options1 = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options1, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0400 success; data = ${data}, options = ${options1}`);
          let options2 = {
            intention: UDMF.Intention.DATA_HUB,
            key: 'data'
          };
          try{
            UDMF.queryData(options2).then((ret) => {
              let size = ret.length;
              console.info(TAG, ` data.size = ${size}`);
              for (var i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (var j = 0; j < size; j++) {
                  if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                    let text = <UDMF.PlainText> (records[j]);
                    console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect().assertFail();
              done();
            }).catch((err) => {
              console.info(`Failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          }catch(errInfo){
            console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
            expect(errInfo.code).assertEqual('401');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_QueryData_Promise_0500
     * @tc.name UDMF queryData promise interface test
     * @tc.desc UDMF queryData promise interface test.
     */
    it('SUB_DDM_UDMF_QueryData_Promise_0500', 0, function (done) {
      let options1 = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options1, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0500 success; data = ${data}, options = ${options1}`);
          let options2 = {
            intention: UDMF.Intention.DATA_HUB,
            key: undefined
          };
          UDMF.queryData(options2).then((ret) => {
            let size = ret.length;
            console.info(TAG, ` data.size = ${size}`);
            for (var i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (var j = 0; j < size; j++) {
                if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                  let text = <UDMF.PlainText> (records[j]);
                  console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                }
              }
            }
            expect(size).assertEqual(1);
            done();
          }).catch((err) => {
            console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_DeleteData_Promise_0100
     * @tc.name UDMF deleteData promise interface test
     * @tc.desc UDMF deleteData promise interface test.
     */
    it('SUB_DDM_UDMF_DeleteData_Promise_0100', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          UDMF.queryData(options, function (errInfo, ret) {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            UDMF.deleteData(options).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (var i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (var j = 0; j < size; j++) {
                  if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                    let text = <UDMF.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_DeleteData_Promise_0200
     * @tc.name UDMF deleteData promise interface test
     * @tc.desc UDMF deleteData promise interface test.
     */
    it('SUB_DDM_UDMF_DeleteData_Promise_0200', 0, function (done) {
      let options = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0200 success; data = ${data}, options = ${options}`);
          UDMF.queryData(options, function (errInfo, ret) {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            UDMF.deleteData({key: data}).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (var i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (var j = 0; j < size; j++) {
                  if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                    let text = <UDMF.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_DeleteData_Promise_0300
     * @tc.name UDMF deleteData promise interface test
     * @tc.desc UDMF deleteData promise interface test.
     */
    it('SUB_DDM_UDMF_DeleteData_Promise_0300', 0, function (done) {
      let options1 = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options1, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
          UDMF.queryData(options1, function (errInfo, ret) {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            let options2 = {
              intention: UDMF.Intention.DATA_HUB,
              key: data
            };
            UDMF.deleteData(options2).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (var i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (var j = 0; j < size; j++) {
                  if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                    let text = <UDMF.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_DeleteData_Promise_0400
     * @tc.name UDMF deleteData promise interface test
     * @tc.desc UDMF deleteData promise interface test.
     */
    it('SUB_DDM_UDMF_DeleteData_Promise_0400', 0, function (done) {
      let options1 = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options1, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
          UDMF.queryData(options1, function (errInfo, ret) {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            let options2 = {
              intention: UDMF.Intention.DATA_HUB,
              key: 'data'
            };
            try{
              UDMF.deleteData(options2).then((row) => {
                let size = row.length;
                console.info(TAG, ` deleteData size = ${size}`);
                for (var i = 0; i < size; i++) {
                  let records = row[i].getRecords();
                  let size = records.length;
                  for (var j = 0; j < size; j++) {
                    if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                      let text = <UDMF.PlainText> (records[j]);
                      console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                    }
                  }
                }
                expect().assertFail();
                done();
              }).catch((err) => {
                console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail();
                done();
              });
            }catch(errInfo){
              console.info(`Failed to deleteData. code is ${errInfo.code},message is ${errInfo.message} `);
              expect(errInfo.code).assertEqual('401');
              done();
            }
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_UDMF_DeleteData_Promise_0500
     * @tc.name UDMF deleteData promise interface test
     * @tc.desc UDMF deleteData promise interface test.
     */
    it('SUB_DDM_UDMF_DeleteData_Promise_0500', 0, function (done) {
      let options1 = {
        intention: UDMF.Intention.DATA_HUB
      };
      let plainText = new UDMF.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new UDMF.UnifiedData(plainText);
      try {
        UDMF.insertData(options1, unifiedData, function (e, data) {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
          UDMF.queryData(options1, function (errInfo, ret) {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            let options2 = {
              intention: UDMF.Intention.DATA_HUB,
              key: undefined
            };
            UDMF.deleteData(options2).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (var i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (var j = 0; j < size; j++) {
                  if (records[j].getType() == UDMF.UnifiedDataType.PLAIN_TEXT) {
                    let text = <UDMF.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    console.info(TAG + "*************Unit Test End*************")
  })
}