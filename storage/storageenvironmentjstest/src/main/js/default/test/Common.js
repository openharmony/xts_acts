/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import environment from '@ohos.environment';
import process from '@ohos.process';

import fileio from '@ohos.fileio';

import {
  describe, beforeAll, beforeEach, afterEach, afterAll, it, expect
}
from 'deccjsunit/index'

function isIntNum(val) {
  return typeof val === 'number' && val % 1 === 0;
}
function isString(str) {
  return typeof str == "string" && str.constructor == String;
}

async function readFile(path){
  let fd = fileio.openSync(path);
  let buf = new ArrayBuffer(4096);
  let readOut = await fileio.read(fd, buf);
  let dataStr = String.fromCharCode.apply(null, new Uint8Array(readOut.buffer));
  return dataStr;
}

async function executeRunCmd(command){
  console.log(`cmd===${command}`);
  let child = await process.runCmd(command);
  let result = child.wait();
  let val = await child.getOutput();
  console.log("getOutput===="+val);
  let dataStr =  String.fromCharCode.apply(null, val);
  return dataStr;
};

export {
  environment,
  isIntNum,
  isString,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  readFile,
  executeRunCmd
};