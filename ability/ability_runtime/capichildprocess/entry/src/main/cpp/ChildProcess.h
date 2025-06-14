/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#ifndef CAPI_CHILD_PROCESS_TEST_CHILD_PROCESS_H
#define CAPI_CHILD_PROCESS_TEST_CHILD_PROCESS_H

#include <mutex>
#include <condition_variable>
#include "IpcStub.h"

class ChildProcess : public IpcStub {
public:
    ChildProcess() = default;
    
    void MainProc();
    bool RequestExitChildProcess(int32_t exitCode) override;
    int32_t Add(int32_t a, int32_t b) override;
    int32_t StartNativeChildProcess() override;
    
private:
    using StdUniLock = std::unique_lock<std::mutex>;
    std::mutex processMutex_;
    std::condition_variable processCondVar_;
    bool mRunning = false;
};

#endif // CAPI_CHILD_PROCESS_TEST_CHILD_PROCESS_H
