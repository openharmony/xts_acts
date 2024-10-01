/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import worker from "@ohos.worker";
import napitest from 'libnapitest.so'

const parentPort = worker.parentPort;

console.info("worker::new version")

parentPort.onmessage = (e) => {
  let data = e.data;
  console.info("worker:: worker thread worker data is " + data)
  if (data === "call napi_run_event_loop with nowait") {
    let result = napitest.runEventLoop(4);
    console.info("worker:: worker thread runEventLoop result is " + result)
    if (result === "napi_generic_failure") {
      parentPort.postMessage("success");
    } else {
      parentPort.postMessage("failure");
    }
  }
  if (data === "call napi_run_event_loop with default") {
    let result = napitest.runEventLoop(5);
    console.info("worker:: worker thread runEventLoop result is " + result)
    if (result === "napi_generic_failure") {
      parentPort.postMessage("success");
    } else {
      parentPort.postMessage("failure");
    }
  }
  if (data === "call napi_stop_event_loop") {
    let result = napitest.stopEventLoop(2);
    console.info("worker:: worker thread runEventLoop result is " + result)
    if (result === 0) {
      parentPort.postMessage("success");
    } else {
      parentPort.postMessage("failure");
    }
  }
  if (data === "call napi_define_sendable_class") {
    let result = napitest.NapiDefineSendableClass();
    if (napitest.NapiIsSendable(result)) {
      parentPort.postMessage("success");
    } else {
      parentPort.postMessage("failure");
    }
  }
}