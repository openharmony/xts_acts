import worker, { MessageEvents } from "@ohos.worker";
import napitest from 'libnapitest.so'

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

const workPort = worker.workerPort;

workPort.onmessage = (e) => {
  let data = e.data;
  if (data === "call napi_run_event_loop with nowait") {
    let result = napitest.runEventLoop(4);
    if (result === "napi_generic_failure") {
        workPort.postMessage(0);
    } else {
        workPort.postMessage(1);
    }
  }
  if (data === "call napi_run_event_loop with default") {
    let result = napitest.runEventLoop(5);
    if (result === "napi_generic_failure") {
        workPort.postMessage(0);
    } else {
        workPort.postMessage(1);
    }
  }
  if (data === "call napi_stop_event_loop") {
    let result = napitest.stopEventLoop(2);
    if (result === "napi_generic_failure") {
        workPort.postMessage(0);
    } else {
        workPort.postMessage(1);
    }
  }
}