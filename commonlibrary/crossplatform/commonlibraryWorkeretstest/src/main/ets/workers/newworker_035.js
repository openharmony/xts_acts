/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import worker from "@ohos.worker"
const parentPort = worker.workerPort;

var ss = undefined;
let res = undefined;
let mse = undefined;
parentPort.onmessage = function(e) {
    let data = e.data;
    switch(data.type) {
        case "new":
            ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_034.js", {name:"worker"});
            ss.onerror = function (e) {
                res = e.message;
                parentPort.postMessage(res);
            }
            ss.onmessage = function (e) {
                mse = e.data
            }
            ss.postMessage("hello world");
            break;
        default:
            break;
    }
}