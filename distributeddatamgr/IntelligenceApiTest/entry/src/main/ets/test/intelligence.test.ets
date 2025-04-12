/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from '@ohos.data.relationalStore';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import osAccount from '@ohos.account.osAccount';
import intelligence from '@ohos.data.intelligence'
import { BusinessError } from '@kit.BasicServicesKit';
import { config } from '@kit.AccessibilityKit';
import { ErrorCode } from '@kit.AbilityKit';
import deviceInfo from '@ohos.deviceInfo';

const TAG =["Intelligence_Test"];

let textConfig:intelligence.ModelConfig  = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:false,
  cachePath:"test"
}

let imageConfig:intelligence.ModelConfig = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:false,
  cachePath:"image"
}
let rdbStore1:relationalStore.RdbStore | undefined;
let rdbStore2:relationalStore.RdbStore | undefined;
let storeConfigInvalid:relationalStore.StoreConfig = {
  name: '',
  securityLevel: relationalStore.SecurityLevel.S1
};
let channelConfigInvalid:intelligence.ChannelConfig = {
  channelType: 0,
  context:context,
  dbConfig:storeConfigInvalid
};
let  storeConfigVector:relationalStore.StoreConfig = {
  name: 'rdb_store_test.db',
  encrypt: false,
  securityLevel: relationalStore.SecurityLevel.S3,
  autoCleanDirtyData: false,
  isSearchable: false,
  vector: true,
  allowRebuild: false
};
let storeConfigInvIdx:relationalStore.StoreConfig = {
  name: 'sqlite_store_test.db',
  encrypt: false,
  securityLevel: relationalStore.SecurityLevel.S3,
  autoCleanDirtyData: false,
  isSearchable: false,
  allowRebuild: false,
  tokenizer: 2
};
let channelConfigVector:intelligence.ChannelConfig = {
  channelType: intelligence.ChannelType.VECTOR_DATABASE,
  context:context,
  dbConfig:storeConfigVector
};
let channelConfigInvIdx:intelligence.ChannelConfig = {
  channelType: intelligence.ChannelType.INVERTED_INDEX_DATABASE,
  context:context,
  dbConfig:storeConfigInvIdx
};



async function insertInvIdxDB() {
  let insertSQL = 'INSERT INTO invidx_table VALUES("1", "大模型系统概述", "生成式AI, 人工智能, 大模型", "人工智能导论", "这是一篇关于大模型的综述文章", "这是一篇关于大模型的综述文章");';
  console.info(TAG + 'insertInvIdxDB insertSQL::' + insertSQL);
  await (rdbStore2 as relationalStore.RdbStore).executeSql(insertSQL);
  insertSQL = 'INSERT INTO invidx_table VALUES("2", "数据库在大模型时代下的发展", "数据库, 内核, 向量", "数据库导论", "这是一篇关于数据库和大模型交叉的综述文章", "这是一篇关于数据库和大模型交叉的综述文章");';
  console.info(TAG + 'insertInvIdxDB insertSQL::' + insertSQL);
  await (rdbStore2 as relationalStore.RdbStore).executeSql(insertSQL);
  insertSQL = 'INSERT INTO invidx_table VALUES("3", "社会发展报告", "旅游, 民生, 交通", "社会发展", "这是一篇关于社会发展的综述文章", "这是一篇关于社会发展的综述文章");';
  console.info(TAG + 'insertInvIdxDB insertSQL::' + insertSQL);
  await (rdbStore2 as relationalStore.RdbStore).executeSql(insertSQL);
  insertSQL = 'INSERT INTO invidx_table VALUES("4", "鸿蒙", "鸿蒙, 生态, 遥遥领先", "鸿蒙系统", "这是一篇关于鸿蒙系统的综述文章", "这是一篇关于鸿蒙系统的综述文章");';
  console.info(TAG + 'insertInvIdxDB insertSQL::' + insertSQL);
  await (rdbStore2 as relationalStore.RdbStore).executeSql(insertSQL);
  insertSQL = 'INSERT INTO invidx_table VALUES("5", "AI系统", "鸿蒙, 生态, 大模型", "AI系统", "这是一篇关于AI系统的综述文章", "这是一篇关于AI系统的综述文章");';
  console.info(TAG + 'insertInvIdxDB insertSQL::' + insertSQL);
  await (rdbStore2 as relationalStore.RdbStore).executeSql(insertSQL);
  console.info(TAG + 'insertInvIdxDB end');
}

async function insertVectorDB() {
  for (let i = 0; i < 5; i++) {
    let array:Array<number> = new Array(128);
    for (let j = 0; j < array.length; j++) {
      let randomNumber = Math.random();
      array[j] = randomNumber;
    }
    let data = array.toString();
    let insertSQL = "INSERT INTO vector_table VALUES('" + i + "', '大模型系统概述', '[" + data + "]', '生成式AI, 人工智能, 大模型', '[" + data + "]', '[" + data + "]', '[" + data + "]');";
    await (rdbStore1 as relationalStore.RdbStore).execute(insertSQL, 0, undefined);
  }
  let arraySpecial:Array<number> = new Array(128).fill(0.1);
  let dataSpecial = arraySpecial.toString();
  let insertSQLSpecial = "INSERT INTO vector_table VALUES('5', '大模型系统概述', '[" + dataSpecial + "]', '生成式AI, 人工智能, 大模型', '[" + dataSpecial + "]', '[" + dataSpecial + "]', '[" + dataSpecial + "]');";
  await (rdbStore1 as relationalStore.RdbStore).execute(insertSQLSpecial, 0, undefined);
}

export default function intelligenceTest() {
  let currentDeviceIsPc = false;
  describe('intelligenceTest', () => {
    beforeAll(() => {
      console.info(TAG + "beforeAll");
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsPc = deviceTypeInfo === '2in1' ? true : false;
      console.info(TAG + "the value of the deviceType is : " + deviceInfo.deviceType);
      relationalStore.deleteRdbStore(context, 'rdb_store_test.db', (err) => {
        if (err) {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          return;
        }
        console.info(TAG + 'Delete RdbStore successfully.');
      });
      rdbStore1 = await relationalStore.getRdbStore(context, storeConfigVector);
      if (rdbStore1 !== undefined) {
        let createSql = 'CREATE TABLE IF NOT EXISTS vector_table(fileid TEXT PRIMARY KEY, filename_text TEXT, filename FLOATVECTOR(128), keywords_text TEXT, keywords FLOATVECTOR(128), chapter FLOATVECTOR(128), abstract FLOATVECTOR(128));';
        await rdbStore1.execute(createSql, 0, undefined);
        await insertVectorDB();
      };
      rdbStore2 = await relationalStore.getRdbStore(context, storeConfigInvIdx);
      if (rdbStore2 !== undefined) {
        let createSql = 'CREATE VIRTUAL TABLE IF NOT EXISTS invidx_table USING fts5(fileid, filename, keywords, chapter, abstract, content, tokenize = "customtokenizer");';
        await rdbStore2.executeSql(createSql);
        await insertInvIdxDB();
      };
    })
    beforeEach(() => {
      console.info(TAG + "beforeEach");
    })
    afterEach(() => {
      console.info(TAG + "afterEach");
    })
    afterAll(() => {
      console.info(TAG + "afterAll");
    })

    console.info("*************intelligence Test begin**************");
    let retArray = [401, 801, 313000000];


    /**
     * @tc.name intelligenceApiTest0100
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0100
     * @tc.desc splitText interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */

    it("intelligenceApiTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0100 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 0.5
      };
      if (currentDeviceIsPc) {
        await intelligence.splitText(text, config)
        .then((data) => {
          console.info(TAG + "get result:" + data);
          let dataSize = data.length;
          let ret = dataSize > 0;
          expect(ret).assertEqual(true);
          done();
        })
      } else {
        await intelligence.splitText(text, config)
        .then((data) => {
          console.info(TAG + "get result:" + data);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.info(TAG + "get promise result:" + err.code);
          expect(err.code).assertEqual(801);
          done();
        })
      }     
    })


    /**
     * @tc.name intelligenceApiTest0200
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0200
     * @tc.desc getTextEmbeddingModel promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0200 start");
      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result" + data);
            let ret = false;
            if (data != null) {
              ret = true;
            }
            expect(ret).assertEqual(true);
            done();
            })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0300
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0300
     * @tc.desc getImageEmbeddingModel promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0300 start");
      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            let ret = false
            if (data != null) {
              ret = true;
            }
            expect(ret).assertEqual(true);
            done();
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })



    /**
     * @tc.name intelligenceApiTest0400
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0400
     * @tc.desc getTextEmbeddingModel loadModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0400 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.loadModel()
            .then(() => {
              console.info(TAG + "get loadMldel result 0400:");
              done();
            })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
        .then((data) => {
          console.info(TAG + "get result:" + data);
          expect().assertFail();
        })
        .catch((err: BusinessError) => {
          expect(err.code).assertEqual(801);
          done();
        })
      }
    })


    /**
     * @tc.name intelligenceApiTest0500
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0500
     * @tc.desc getTextEmbeddingModel loadModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0500 start");
      if (currentDeviceIsPc) {
        try {
          intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.loadModel()
            .then(() => {
              console.info(TAG + "loadModel success result 0500:" );
              data.releaseModel()
              done();
            }) 
          })
          
        } catch(err){
          console.info(TAG + "intelligenceApiTest0500 is fail:" );
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
                })
          .catch((err: BusinessError) => {
            console.info(TAG + "get result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0600
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0600
     * @tc.desc getTextEmbeddingModel releaseModel abnormal interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0600 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
              data.releaseModel()
                .then(() => {
                  console.info(TAG + "releaseModel result 0600:");
                  expect().assertFail();
                  done();
                })
                .catch((err:BusinessError) => {
                  console.info(TAG + "getEmbedding result" + err.code);
                  expect(err.code).assertEqual(31300000);
                  done();
                })
              })
    } else {
      intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "loadModel promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0700
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0700
     * @tc.desc getTextEmbeddingModel getEmbedding interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0700 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.getEmbedding('123')
            .then((loadData) => {
               console.info(TAG + "getEmbedding result:" + loadData);
               let dataSize:number = loadData.length;
               let ret = dataSize > 0;
               expect().assertFail();
               done();
            })
            .catch((err:BusinessError) => {
              console.info(TAG + "getEmbedding result" + err.code);
              expect(err.code).assertEqual(31300000);
              done();
            })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "getEmbedding promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();

          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0800
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0800
     * @tc.desc getTextEmbeddingModel getEmbedding abnormal interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0800 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.loadModel();
            let text = 'text';
            data.getEmbedding(text)
            .then((loadData) => {
              console.info(TAG + "getEmbedding result 0800 :" + loadData);
              let dataSize:number = loadData.length;
              let ret = dataSize > 0;
              expect(ret).assertEqual(true);
              done();
            })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
            })
            .catch((err: BusinessError) => {
              console.info(TAG + "getEmbedding promise result:" + err.code);
              expect(err.code).assertEqual(801);
              done();
            })
        }
    })


    /**
     * @tc.name intelligenceApiTest0900
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0900
     * @tc.desc getTextEmbeddingModel getEmbedding batchTexts interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0900 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
        .then((data) => {
          console.info(TAG + "get result: " + data);
          data.loadModel();
          let batchTexts = ['11', '22', '33'];
          data.getEmbedding(batchTexts)
          .then((loadData) => {
            console.info(TAG + "getEmbedding result 0900: " + loadData);
            let dataSize:number = loadData.length;
            let ret = dataSize > 0;
            expect(ret).assertEqual(true);
            done();
            })
        })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result: " + data);
            expect().assertFail();
            done();
            })
            .catch((err: BusinessError) => {
              console.info(TAG + "getEmbedding promise result: " + err.code);
              expect(err.code).assertEqual(801);
              done();
            })
        }
    })


    /**
     * @tc.name intelligenceApiTest1000
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1000
     * @tc.desc getImageEmbeddingModel loadModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest1000 start");

      if (currentDeviceIsPc) {
        try {
          intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.loadModel()
            .then(() => {
              console.info(TAG + "loadModel result 1000 :");
              data.releaseModel();
              done();
            })
          })
        } catch(err){
          console.info(TAG + "intelligenceApiTest1000 is fail:");
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest1100
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1100
     * @tc.desc getImageEmbeddingModel(imageConfig) releaseModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest1100 start");

      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.releaseModel()
            .then(() => {
              console.info(TAG + "releaseModel result 1100 :");
              expect().assertFail();
              done();
            })
            .catch((err:BusinessError) => {
              console.info(TAG + "getEmbedding result" + err.code);
              expect(err.code).assertEqual(31300000);
              done();
            })
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest1200
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1200
     * @tc.desc getImageEmbeddingModel(imageConfig) getEmbedding test interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest1200 start");

      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.loadModel();
            data.getEmbedding('111.jpg')
            .then((loadData) => {
              console.info(TAG + "getEmbedding result 1200 :" + loadData);
              expect().assertFail();
              done();
            })
            .catch((err:BusinessError) => {
              console.error("Failed to get Embedding and code is " + err.code);
              expect(err.code).assertEqual(31300000);
              done();
              })
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
      
    })


    /**
     * @tc.name intelligenceApiTest1300
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1300
     * @tc.desc Test getRetriever. rdbStoreName is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest1300 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigInvalid]
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              expect(data != null).assertEqual(true);
              done();
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest1300 catch::' + err.code);
          expect(err.code).assertEqual(401);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'catch::' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest1300 end');
    })

    /**
     * @tc.name intelligenceApiTest1400
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1400
     * @tc.desc Test getRetriever. channelConfigs is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intelligenceApiTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest1400 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: []
      }
      try {
        await intelligence.getRetriever(retrievalConfig);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(TAG, 'intelligenceApiTest1400 catch::' + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'intelligenceApiTest1400 end');
    });


    /**
     * @tc.name intelligenceApiTest1500
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1500
     * @tc.desc Test retrieveRdb. The value of deepSize is too large.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest1500 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let floatArray = new Float32Array(128).fill(0.1);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'filename',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallCondition:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: 'vector_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename_text'],
            filters: [],
            deepSize: 1000000
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '软件设计与建模';
                data.retrieveRdb(query, retrievalCondition)
                  .then((rdbdata) => {
                    let length = rdbdata.records.length;
                    console.info(TAG, 'Aip_003 get result::' + length);
                    let ret = length >= 0;
                    expect(ret).assertEqual(true);
                    done();
                  });
              } catch (err) {
                console.info(TAG, 'catch::' + err.code);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'catch::' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest1500 catch:' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest1500  end');
    })


    /**
     * @tc.name intelligenceApiTest1600
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1600
     * @tc.desc Test retrieveRdb.fromClause is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest1600  start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let floatArray = new Float32Array(128).fill(0.1);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'filename',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallCondition:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: '',
            primaryKey: ['fileid'],
            responseColumns: ['filename_text'],
            deepSize: 500
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '软件设计与建模';
                data.retrieveRdb(query, retrievalCondition);
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest1600 catch:' + err.code);
                expect(err.code).assertEqual(401);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest1600 catch:' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'catch11::' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest1600 end');
    });


    /**
     * @tc.name intelligenceApiTest1700
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1700
     * @tc.desc  Test retrieveRdb. primaryKey is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest1700 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let floatArray = new Float32Array(128).fill(0.1);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'filename',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallCondition:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: 'vector_table',
            primaryKey: [],
            responseColumns: ['filename_text'],
            deepSize: 500
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '软件设计与建模';
                data.retrieveRdb(query, retrievalCondition);
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest1700 catch::' + err.code);
                expect(err.code).assertEqual(401);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest1700 catch::' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'catch11::' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest1700 end');
    })


    /**
     * @tc.name intelligenceApiTest1800
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1800
     * @tc.desc Test retrieveRdb. responseColumns is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest1800 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let floatArray = new Float32Array(128).fill(0.1);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'filename',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallCondition:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: 'vector_table',
            primaryKey: ['fileid'],
            responseColumns: [],
            deepSize: 500
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '软件设计与建模';
                data.retrieveRdb(query, retrievalCondition);
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest1800 retrieveRdb is fail::' + err.code);
                expect(err.code).assertEqual(401);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest1800 catch::' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest1800 catch::' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest1800 end');
    })


    /**
     * @tc.name intelligenceApiTest1900
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1900
     * @tc.desc Test retrieveRdb. column is invalid.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest1900 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let floatArray = new Float32Array(128).fill(0.1);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'invalidField',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallCondition:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: 'vector_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename_text'],
            deepSize: 500
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '软件设计与建模';
                data.retrieveRdb(query, retrievalCondition)
                  .catch((err:BusinessError) => {
                    console.info(TAG, 'Aip_007 catch::' + err.code);
                    expect(err.code).assertEqual(31300100);
                    done();
                  });
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest1900 catch::' + err.code);
                expect(err.code).assertEqual(401);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest1900 catch::' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'catch::' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest1900 end');
    })


    /**
     * @tc.name intelligenceApiTest2000
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2000
     * @tc.desc Test retrieveRdb. One-way vector normal recall.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest2000 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let floatArray = new Float32Array(128).fill(0.1);
          const str = floatArray.toString();
          console.log(TAG, str);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'filename',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallCondition:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: 'vector_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename_text'],
            deepSize: 500
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '软件设计与建模';
                data.retrieveRdb(query, retrievalCondition)
                  .then((rdbdata) => {
                    let length = rdbdata.records.length;
                    console.info(TAG, 'Aip_008 get result length::' + length);
                    expect(length > 0).assertEqual(true);
                    done();
                  });
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest2000 catch:' + err.code);
                expect(err.code).assertEqual(401);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest2000 catch:' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest2000 catch::' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest2000 end');
    })


    /**
     * @tc.name intelligenceApiTest2100
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2100
     * @tc.desc Test retrieveRdb. One-way invertedindex normal recall.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest2100 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigInvIdx]
      };
      if (currentDeviceIsPc) {
        try {
          let fieldWeight:Record<string, number> = {
            'filename': 4.0
          };
          let fieldSlops:Record<string, number> = {
            'filename': 5
          };
          let bm25Strategy:intelligence.Bm25Strategy = {
            bm25Weight: 1.5,
            columnWeight: fieldWeight
          };
          let exactStrategy:intelligence.ExactMatchingStrategy = {
            exactMatchingWeight: 1.2,
            columnWeight: fieldWeight
          };
          let outOfOrderStrategy:intelligence.ProximityStrategy = {
            proximityWeight: 1.2,
            columnWeight: fieldWeight,
            columnSlops: fieldSlops
          };
          let invertedIndexStrategies = [bm25Strategy, exactStrategy, outOfOrderStrategy];
          let recallCondition:intelligence.InvertedIndexRecallCondition ={
            ftsTableName: 'invidx_table',
            fromClause: 'invidx_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename', 'keywords'],
            deepSize: 500,
            invertedIndexStrategies: invertedIndexStrategies
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              console.info(TAG, 'intelligenceApiTest2100 get result:' + data);
              try {
                let query = '数据库';
                data.retrieveRdb(query, retrievalCondition)
                  .then((rdbdata) => {
                    let length = rdbdata.records.length;
                    console.info(TAG, 'intelligenceApiTest2100 retrieveRdb:' + length);
                    expect(length).assertEqual(1);
                    done();
                  });
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest2100 catch:' + err.code);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest2100 catch:' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest2100 catch:' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest2100 end');
    })


    /**
     * @tc.name intelligenceApiTest2200
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2200
     * @tc.desc Test retrieveRdb. ftsTableName is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest2200 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigInvIdx]
      };
      if (currentDeviceIsPc) {
        try {
          let fieldWeight:Record<string, number> = {
            'filename': 4.0
          };
          let fieldSlops:Record<string, number> = {
            'filename': 5
          };
          let bm25Strategy:intelligence.Bm25Strategy = {
            bm25Weight: 1.5,
            columnWeight: fieldWeight
          };
          let exactStrategy:intelligence.ExactMatchingStrategy = {
            exactMatchingWeight: 1.2,
            columnWeight: fieldWeight
          };
          let outOfOrderStrategy:intelligence.ProximityStrategy = {
            proximityWeight: 1.2,
            columnWeight: fieldWeight,
            columnSlops: fieldSlops
          };
          let invertedIndexStrategies = [bm25Strategy, exactStrategy, outOfOrderStrategy];
          let recallCondition:intelligence.InvertedIndexRecallCondition ={
            ftsTableName: '',
            fromClause: 'invidx_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename', 'keywords'],
            deepSize: 500,
            invertedIndexStrategies: invertedIndexStrategies
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '数据库';
                data.retrieveRdb(query, retrievalCondition);
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest2200 retrieveRdb:' + err.code);
                expect(err.code).assertEqual(401);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest2200 catch:' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest2200 catch:' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest2200 end');
    })


    /**
     * @tc.name intelligenceApiTest2300
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2300
     * @tc.desc Test retrieveRdb. invertedindex match field is invalid.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intelligenceApiTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest2300 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigInvIdx]
      };
      if (currentDeviceIsPc) {
        try {
          let fieldWeight:Record<string, number> = {
            'invalid': 4.0
          };
          let fieldSlops:Record<string, number> = {
            'filename': 5
          };
          let bm25Strategy:intelligence.Bm25Strategy = {
            bm25Weight: 1.5,
            columnWeight: fieldWeight
          };
          let exactStrategy:intelligence.ExactMatchingStrategy = {
            exactMatchingWeight: 1.2,
            columnWeight: fieldWeight
          };
          let outOfOrderStrategy:intelligence.ProximityStrategy = {
            proximityWeight: 1.2,
            columnWeight: fieldWeight,
            columnSlops: fieldSlops
          };
          let invertedIndexStrategies = [bm25Strategy, exactStrategy, outOfOrderStrategy];
          let recallCondition:intelligence.InvertedIndexRecallCondition ={
            ftsTableName: 'invidx_table',
            fromClause: 'invidx_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename', 'keywords'],
            deepSize: 500,
            invertedIndexStrategies: invertedIndexStrategies
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallCondition]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '数据库';
                data.retrieveRdb(query, retrievalCondition)
                  .catch((err:BusinessError) => {
                    console.info(TAG, 'intelligenceApiTest2300 retrieveRdb:' + err.code);
                    expect(err.code).assertEqual(31301010);
                    done();
                  });
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest2300 catch:' + err.code);
                expect(err.code).assertEqual(401);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest2300 catch:' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest2300 catch:' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest2300 end');
    })


    /**
     * @tc.name intelligenceApiTest2400
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2400
     * @tc.desc Test retrieveRdb. Two-way normal recall.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest2400  start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigInvIdx, channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let fieldWeight:Record<string, number> = {
            'filename': 4.0
          };

          let fieldSlops:Record<string, number> = {
            'filename': 5
          };
          let bm25Strategy:intelligence.Bm25Strategy = {
            bm25Weight: 1.5,
            columnWeight: fieldWeight
          };
          let exactStrategy:intelligence.ExactMatchingStrategy = {
            exactMatchingWeight: 1.2,
            columnWeight: fieldWeight
          };
          let outOfOrderStrategy:intelligence.ProximityStrategy = {
            proximityWeight: 1.2,
            columnWeight: fieldWeight,
            columnSlops: fieldSlops
          };
          let invertedIndexStrategies = [bm25Strategy, exactStrategy, outOfOrderStrategy];
          let recallConditionInvIdx:intelligence.InvertedIndexRecallCondition = {
            ftsTableName: 'invidx_table',
            fromClause: 'invidx_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename', 'keywords'],
            deepSize: 500,
            invertedIndexStrategies: invertedIndexStrategies
          };
          let floatArray = new Float32Array(128).fill(0.1);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'filename',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallConditionVector:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: 'vector_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename_text'],
            deepSize: 500
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            recallConditions : [recallConditionInvIdx, recallConditionVector]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '数据库';
                data.retrieveRdb(query, retrievalCondition)
                  .then((rdbdata) => {
                    let length = rdbdata.records.length;
                    console.info(TAG, 'intelligenceApiTest2400 retrieveRdb:' + length);
                    expect(length >= 2).assertEqual(true);
                    done();
                  });
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest2400 catch:' + err.code);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest2400 catch:' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest2400 catch:' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest2400 end');
    })


    /**
     * @tc.name intelligenceApiTest2500
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2500
     * @tc.desc Test retrieveRdb. Two-way normal recall and configing rerankMethod.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('intelligenceApiTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'intelligenceApiTest2500 start');
      let retrievalConfig:intelligence.RetrievalConfig = {
        channelConfigs: [channelConfigInvIdx, channelConfigVector]
      };
      if (currentDeviceIsPc) {
        try {
          let fieldWeight:Record<string, number> = {
            'filename': 4.0,
            'keywords':4.0
          };
          let fieldSlops:Record<string, number> = {
            'filename': 5,
            'keywords':5
          };
          let bm25Strategy:intelligence.Bm25Strategy = {
            bm25Weight: 1.5,
            columnWeight: fieldWeight
          };
          let exactStrategy:intelligence.ExactMatchingStrategy = {
            exactMatchingWeight: 1.2,
            columnWeight: fieldWeight
          };
          let outOfOrderStrategy:intelligence.ProximityStrategy = {
            proximityWeight: 1.2,
            columnWeight: fieldWeight,
            columnSlops: fieldSlops
          };
          let invertedIndexStrategies = [bm25Strategy, exactStrategy, outOfOrderStrategy];
          let recallConditionInvIdx:intelligence.InvertedIndexRecallCondition = {
            ftsTableName: 'invidx_table',
            fromClause: 'invidx_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename', 'keywords'],
            deepSize: 500,
            invertedIndexStrategies: invertedIndexStrategies
          };
          let floatArray = new Float32Array(128).fill(0.1);
          let vectorQuery:intelligence.VectorQuery = {
            column: 'filename',
            value: floatArray,
            similarityThreshold: 0.1
          };
          let recallConditionVector:intelligence.VectorRecallCondition = {
            vectorQuery: vectorQuery,
            fromClause: 'vector_table',
            primaryKey: ['fileid'],
            responseColumns: ['filename_text'],
            recallName: 'vectorRecall',
            deepSize: 500
          };
          let vectorWeights:Record<string, number> = {
            'vectorRecall': 1
          };
          let numberInspector:Record<intelligence.RecallName, intelligence.ColumnName> = {
            'vector_query':'filename_text'
          };
          let vectorRerankParameter:intelligence.VectorRerankParameter = {
            vectorWeights:vectorWeights,
            thresholds: [0.55, 0.45, 0.35],
            numberInspector: numberInspector
          };
          let parameters:Record<intelligence.ChannelType, intelligence.RerankParameter> = {
            0: vectorRerankParameter
          };
          let rerankMethod:intelligence.RerankMethod = {
            rerankType: intelligence.RerankType.FUSION_SCORE,
            parameters: parameters,
            isSoftmaxNormalized: true,
          };
          let retrievalCondition:intelligence.RetrievalCondition = {
            rerankMethod: rerankMethod,
            recallConditions : [recallConditionInvIdx, recallConditionVector]
          };
          await intelligence.getRetriever(retrievalConfig)
            .then((data) => {
              try {
                let query = '数据库';
                data.retrieveRdb(query, retrievalCondition)
                  .then((rdbdata) => {
                    let length = rdbdata.records.length;
                    console.info(TAG, 'intelligenceApiTest2500 retrieveRdb:' + length);
                    expect(length >= 2).assertEqual(true);
                    done();
                  });
              } catch (err) {
                console.info(TAG, 'intelligenceApiTest2500 catch:' + err.code);
                done();
              }
            });
        } catch (err) {
          console.info(TAG, 'intelligenceApiTest2500 catch:' + err.code);
          done();
        }
      } else {
        await intelligence.getRetriever(retrievalConfig)
          .catch((err:BusinessError) => {
            console.info(TAG, 'intelligenceApiTest2500 catch:' + err.code);
            expect(err.code).assertEqual(801);
            done();
          });
      }
      console.info(TAG, 'intelligenceApiTest2500 end');
    })

    /**
     * @tc.name intelligenceApiTest2600
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2600
     * @tc.desc getImageEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2600 start");

      if (currentDeviceIsPc) {
        await intelligence.getImageEmbeddingModel(undefined)
          .then((data) => {
            console.info(TAG + "getImageEmbeddingModel success :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(401);
            done();
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest2700
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2700
     * @tc.desc getImageEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2700 start");
      if (currentDeviceIsPc) {
        await intelligence.getTextEmbeddingModel(undefined)
          .then((data) => {
            console.info(TAG + "getTextEmbeddingModel success :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "getTextEmbeddingModel fail" + err.code);
            expect(err.code).assertEqual(401);
            done();
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
      console.info(TAG + "intelligenceApiTest2700 end");
    })


    /**
     * @tc.name intelligenceApiTest2800
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2800
     * @tc.desc getTextEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */


     it("intelligenceApiTest2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest2800 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 0.5
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, null);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(TAG + 'splitText is fail' +err.message + err.code);
          expect(err.code).assertEqual(401);
        }
      } else {
        await intelligence.splitText(text, config)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest2900
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2800
     * @tc.desc getImageEmbeddingModel getEmbedding  is invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2900 start");
      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.loadModel();
            data.getEmbedding(undefined)
              .then((loadData) => {
                console.info(TAG + "getEmbedding result 1200 :" + loadData);
                expect().assertFail();
                done();
              })
              .catch((err: BusinessError) => {
                console.error("Failed to get Embedding and code is " + err.code);
                expect(err.code).assertEqual(401);
                done();
              })
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest3000
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_3000
     * @tc.desc getImageEmbeddingModel getEmbedding batchTexts is invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest3000 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 10
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, config);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(TAG + 'splitText is fail' +err.message + err.code);
          expect(err.code).assertEqual(31300000);
        }
      } else {
        await intelligence.splitText(text, config)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })




    

    










  })
}



