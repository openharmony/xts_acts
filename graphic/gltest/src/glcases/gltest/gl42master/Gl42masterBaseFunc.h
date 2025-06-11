/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#ifndef GL42MASTER_FUNC_H
#define GL42MASTER_FUNC_H

struct FuncRunResult {
    int numExecuted; // !< Total number of cases executed.
    int numPassed;     // !< Number of cases passed.
    int numFailed;     // !< Number of cases failed.
    int numNotSupported;    // !< Number of cases not supported.
    int numWarnings; // !< Number of QualityWarning / CompatibilityWarning results.
    int numWaived;     // !< Number of waived tests.
    bool isComplete;     // !< Is run complete.
};

void RegistPackage(void);
FuncRunResult RunTestKHRGLES(int argc, const char** argv);

#endif // GL42MASTER_FUNC_H