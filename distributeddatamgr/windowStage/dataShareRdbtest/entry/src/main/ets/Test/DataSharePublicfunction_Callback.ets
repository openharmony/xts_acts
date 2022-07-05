/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
 
import file from '@system.file';

import { describe, it, expect } from 'hypium/index'
import dataShare from '@ohos.data.dataShare'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import DataShareResultSet from '@ohos.data.DataShareResultSet'

//insert公共方法
function publicinsert(helper, uri, DataShareValuesBucket) {
  return new Promise(function (resolve, reject) {
    helper.insert(uri, DataShareValuesBucket, (err, data) => {
      console.info("TestDataShare publicinsert Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test insert err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//delete公共方法
async function publicdelete(helper, uri, DataSharePredicates) {
  return new Promise(function (resolve, reject) {
    console.info("[ttt] [DataShareTest] <<XTS>> 12345648564185645314");
    helper.delete(uri, DataSharePredicates, (err, data) => {
      console.info("[ttt] [TestDataShare] publicdelete Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test delete err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//query公共方法
function publicquery(helper, uri, DataSharePredicates, columns) {
  return new Promise(function (resolve, reject) {
    helper.query(uri, DataSharePredicates, columns, (err, data) => {
      console.info("TestDataShare publicquery Callback=" + JSON.stringify(data));
      globalThis.ResultSet = data;
      if (err) {
        console.info("test query err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//update公共方法
function publicupdate(helper, uri, DataSharePredicates, DataShareValuesBucket) {
  return new Promise(function (resolve, reject) {
    helper.update(uri, DataSharePredicates, DataShareValuesBucket, (err, data) => {
      console.info("TestDataShare publicupdate Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test update err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//batchInsert公共方法
function publicbatchInsert(helper, uri, DataShareValuesBucket) {
  return new Promise(function (resolve, reject) {
    helper.batchInsert(uri, DataShareValuesBucket, (err, data) => {
      console.info("TestDataShare publicbatchInsert Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test batchInsert err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//getType公共方法
function publicgetType(helper, uri) {
  return new Promise(function (resolve, reject) {
    helper.getType(uri, (err, data) => {
      console.info("TestDataShare publicgetType Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test getType err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//getFileTypes公共方法
function publicgetFileTypes(helper, uri, mimeTypeFilter) {
  return new Promise(function (resolve, reject) {
    helper.getFileTypes(uri, mimeTypeFilter, (err, data) => {
      console.info("TestDataShare publicgetFileTypes Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test getFileTypes err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//normalizeUri公共方法
function publicnormalizeUri(helper, uri) {
  return new Promise(function (resolve, reject) {
    helper.normalizeUri(uri, (err, data) => {
      console.info("TestDataShare publicnormalizeUri Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test normalizeUri err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//denormalizeUri公共方法
function publicdenormalizeUri(helper, uri) {
  return new Promise(function (resolve, reject) {
    helper.denormalizeUri(uri, (err, data) => {
      console.info("TestDataShare publicdenormalizeUri Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test denormalizeUri err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

//denormalizeUri公共方法
function publicopenFile(helper, uri, mode) {
  return new Promise(function (resolve, reject) {
    helper.denormalizeUri(uri, mode, (err, data) => {
      console.info("TestDataShare publicopenFile Callback=" + JSON.stringify(data));
      if (err) {
        console.info("test openFile err information: " + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    })
  })
}

export { publicinsert, publicdelete, publicquery, publicupdate, publicbatchInsert, publicgetType, publicgetFileTypes,
  publicnormalizeUri, publicdenormalizeUri, publicopenFile
}