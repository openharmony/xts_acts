/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <string>
#include <vector>
#include <gtest/gtest.h>

#include "interfaces/kits/c/neural_network_runtime/neural_network_runtime.h"
#include "common/log.h"
#include "nncore_utils.h"

using namespace testing::ext;
using namespace OHOS::NeuralNetworkRuntime::Test;

class EndToEndTest : public testing::Test {
public:
    void SetUp()
    {
        CreateFolder(CACHE_DIR);
    }
    void TearDown()
    {
        DeleteFolder(CACHE_DIR);
    }
};

void BuildModel(OH_NNModel **model)
{
    *model = OH_NNModel_Construct();
    ASSERT_NE(nullptr, model);
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    ASSERT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(*model, graphArgs));
}

void BuildDynamicModel(OH_NNModel **model)
{
    *model = OH_NNModel_Construct();
    ASSERT_NE(nullptr, model);
    AvgPoolDynamicModel avgModel;
    OHNNGraphArgs graphArgs = avgModel.graphArgs;
    ASSERT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(*model, graphArgs));
}

void BuildModelWithQuantParams(OH_NNModel **model)
{
    *model = OH_NNModel_Construct();
    ASSERT_NE(nullptr, model);
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    ASSERT_EQ(OH_NN_SUCCESS, BuildSingleOpGraphWithQuantParams(*model, graphArgs));
}

OH_NNCompilation* ConstructCompilation(OH_NNModel* model, size_t deviceId, bool isUseCache = true)
{
    OH_NNCompilation* compilation = nullptr;
    if (model == nullptr) {
        compilation = OH_NNCompilation_ConstructForCache();
        if (compilation == nullptr) {
            LOGE("End2EndTest::OH_NNCompilation_ConstructForCache failed.");
            return nullptr;
        }
    }
    else {
        compilation = OH_NNCompilation_Construct(model);
        if (compilation == nullptr) {
            LOGE("End2EndTest::OH_NNCompilation_Construct failed.");
            return nullptr;
        }
    }

    OH_NN_ReturnCode returnCode = OH_NNCompilation_SetDevice(compilation, deviceId);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNCompilation_SetDevice failed.");
        return nullptr;
    }

    if (isUseCache) {
        returnCode = OH_NNCompilation_SetCache(compilation, CACHE_DIR.c_str(), 1);
        if (returnCode != OH_NN_SUCCESS) {
            LOGE("End2EndTest::OH_NNCompilation_SetCache failed.");
            return nullptr;
        }
    }

    returnCode = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_EXTREME);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNCompilation_SetPerformanceMode failed.");
        return nullptr;
    }

    returnCode = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_HIGH);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNCompilation_SetPriority failed.");
        return nullptr;
    }

    returnCode = OH_NNCompilation_EnableFloat16(compilation, false);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNCompilation_EnableFloat16 failed.");
        return nullptr;
    }

    // 执行编译
    returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNCompilation_Build failed.");
        return nullptr;
    }
    return compilation;
}

OH_NN_ReturnCode SetInputData(NN_Tensor* inputTensor[], size_t inputSize)
{
    OH_NN_DataType dataType(OH_NN_FLOAT32);
    OH_NN_ReturnCode ret{OH_NN_FAILED};
    size_t elementNum = 0;
    for (size_t i = 0; i < inputSize; ++i) {
        auto data = OH_NNTensor_GetDataBuffer(inputTensor[i]);
        if (data == nullptr) {
            LOGE("End2EndTest::OH_NNTensor_GetDataBuffer failed.");
            return OH_NN_FAILED;
        }
        auto desc = OH_NNTensor_GetTensorDesc(inputTensor[i]);
        if (desc == nullptr) {
            LOGE("End2EndTest::OH_NNTensor_GetTensorDesc failed.");
            return OH_NN_FAILED;
        }
        ret = OH_NNTensorDesc_GetDataType(desc, &dataType);
        if (ret != OH_NN_SUCCESS) {
            LOGE("End2EndTest::OH_NNTensorDesc_GetDataType failed.");
            return ret;
        }
        ret = OH_NNTensorDesc_GetElementCount(desc, &elementNum);
        if (ret != OH_NN_SUCCESS) {
            LOGE("End2EndTest::OH_NNTensorDesc_GetElementCount failed.");
            return ret;
        }
        switch (dataType) {
            case OH_NN_FLOAT32: {
                float* floatValue = reinterpret_cast<float*>(data);
                for (size_t j = 0; j < elementNum; ++j) {
                    floatValue[j] = static_cast<float>(j);
                }
                break;
            }
            case OH_NN_INT32: {
                int* intValue = reinterpret_cast<int*>(data);
                for (size_t j = 0; j < elementNum; ++j) {
                    intValue[j] = static_cast<int>(j);
                }
                break;
            }
            default:
                return OH_NN_FAILED;
        }
    }
    return OH_NN_SUCCESS;
}

OH_NNExecutor* RunExecutor(OH_NNCompilation* compilation, size_t deviceId, bool isDynamic = false)
{
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        LOGE("End2EndTest::OH_NNExecutor_Construct failed.");
        return nullptr;
    }
    size_t inputCount = 0;
    OH_NN_ReturnCode returnCode = OH_NNExecutor_GetInputCount(executor, &inputCount);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNExecutor_GetInputCount failed.");
        return nullptr;
    }
    std::vector<NN_TensorDesc*> inputTensorDescs;
    NN_TensorDesc* tensorDescTmp = nullptr;
    for (size_t i = 0; i < inputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateInputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            LOGE("End2EndTest::OH_NNExecutor_CreateInputTensorDesc failed.");
            return nullptr;
        }
        inputTensorDescs.emplace_back(tensorDescTmp);
    }
    size_t outputCount = 0;
    returnCode = OH_NNExecutor_GetOutputCount(executor, &outputCount);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNExecutor_GetOutputCount failed.");
        return nullptr;
    }
    std::vector<NN_TensorDesc*> outputTensorDescs;
    for (size_t i = 0; i < outputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateOutputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            LOGE("End2EndTest::OH_NNExecutor_CreateOutputTensorDesc failed.");
            return nullptr;
        }
        outputTensorDescs.emplace_back(tensorDescTmp);
    }

    if (isDynamic) {
        // 修改tensorDesc中shape为最小临界值
        size_t *minInputDims = nullptr;
        size_t *maxInputDims = nullptr;
        size_t shapeLength = ZERO;
        for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
            if (OH_NN_SUCCESS != OH_NNExecutor_GetInputDimRange(executor, i, &minInputDims,
                                                                &maxInputDims, &shapeLength)) {
                LOGE("End2EndTest::OH_NNExecutor_GetInputDimRange failed.");
                return nullptr;
            }
            if (OH_NN_SUCCESS != OH_NNTensorDesc_SetShape(inputTensorDescs[i],
                                                          (int32_t*)minInputDims, shapeLength)) {
                LOGE("End2EndTest::OH_NNTensorDesc_SetShape failed.");
                return nullptr;
            }
        }
        std::vector<int32_t> outputShape{1, 2, 2, 1};
        for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
            if (OH_NN_SUCCESS != OH_NNTensorDesc_SetShape(outputTensorDescs[i],
                                                          outputShape.data(), outputShape.size())) {
                LOGE("End2EndTest::OH_NNTensorDesc_SetShape failed.");
                return nullptr;
            }
        }
    }

    // 创建输入输出Tensor
    NN_Tensor* inputTensors[inputCount];
    NN_Tensor* tensor = nullptr;
    for (size_t i = 0; i < inputCount; ++i) {
        tensor = nullptr;
        tensor = OH_NNTensor_Create(deviceId, inputTensorDescs[i]);
        if (tensor == nullptr) {
            LOGE("End2EndTest::OH_NNTensor_Create failed.");
            return nullptr;
        }
        inputTensors[i] = tensor;
    }
    NN_Tensor* outputTensors[outputCount];
    for (size_t i = 0; i < outputCount; ++i) {
        tensor = nullptr;
        tensor = OH_NNTensor_Create(deviceId, outputTensorDescs[i]);
        if (tensor == nullptr) {
            LOGE("End2EndTest::OH_NNTensor_Create failed.");
            return nullptr;
        }
        outputTensors[i] = tensor;
    }

    // 销毁输入输出tensordesc
    for (size_t i = 0; i < inputCount; ++i) {
        returnCode = OH_NNTensorDesc_Destroy(&inputTensorDescs[i]);
        if (returnCode != OH_NN_SUCCESS) {
            LOGE("End2EndTest::OH_NNTensorDesc_Destroy failed.");
            return nullptr;
        }
    }
    for (size_t i = 0; i < outputCount; ++i) {
        returnCode = OH_NNTensorDesc_Destroy(&outputTensorDescs[i]);
        if (returnCode != OH_NN_SUCCESS) {
            LOGE("End2EndTest::OH_NNTensorDesc_Destroy failed.");
            return nullptr;
        }
    }

    // 设置输入元素值
    returnCode = SetInputData(inputTensors, inputCount);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::SetInputData failed.");
        return nullptr;
    }
    // 执行run
    returnCode = OH_NNExecutor_RunSync(executor, inputTensors, inputCount, outputTensors, outputCount);
    if (returnCode != OH_NN_SUCCESS) {
        LOGE("End2EndTest::OH_NNExecutor_RunSync failed.");
        return nullptr;
    }
    // 清理输入输出Tensor
    for (size_t i = 0; i < inputCount; ++i) {
        returnCode = OH_NNTensor_Destroy(&inputTensors[i]);
        if (returnCode != OH_NN_SUCCESS) {
            LOGE("End2EndTest::OH_NNTensor_Destroy failed.");
            return nullptr;
        }
    }
    for (size_t i = 0; i < outputCount; ++i) {
        returnCode = OH_NNTensor_Destroy(&outputTensors[i]);
        if (returnCode != OH_NN_SUCCESS) {
            LOGE("End2EndTest::OH_NNTensor_Destroy failed.");
            return nullptr;
        }
    }
    return executor;
}

/*
* @tc.name:sub_AI_NNRt_Core_Func_North_EndToEnd_0100
* @tc.desc:定长模型编译端到端测试
* @tc.type:FUNC
*/
HWTEST_F(EndToEndTest, sub_AI_NNRt_Core_Func_North_EndToEnd_0100, Function | MediumTest | Level1)
{
    const size_t *allDevicesID = nullptr;
    uint32_t deviceCount = 0;
    OH_NN_ReturnCode returnCode = OH_NNDevice_GetAllDevicesID(&allDevicesID, &deviceCount);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    ASSERT_NE(deviceCount, 0);
    const char *name = nullptr;
    size_t deviceId = 0;
    returnCode = OH_NNDevice_GetName(allDevicesID[0], &name);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    deviceId = allDevicesID[0];

    OH_NNModel* model = nullptr;
    BuildModel(&model);

    OH_NNCompilation* compilation = ConstructCompilation(model, deviceId);
    ASSERT_NE(nullptr, compilation);

    OH_NNModel_Destroy(&model);
    OH_NNExecutor* executor = RunExecutor(compilation, deviceId);
    ASSERT_NE(nullptr, executor);
    OH_NNCompilation_Destroy(&compilation);
    OH_NNExecutor_Destroy(&executor);
}

/*
* @tc.name:sub_AI_NNRt_Core_Func_North_EndToEnd_0200
* @tc.desc:变长模型编译端到端测试
* @tc.type:FUNC
*/
HWTEST_F(EndToEndTest, sub_AI_NNRt_Core_Func_North_EndToEnd_0200, Function | MediumTest | Level1)
{
    const size_t *allDevicesID = nullptr;
    uint32_t deviceCount = 0;
    OH_NN_ReturnCode returnCode = OH_NNDevice_GetAllDevicesID(&allDevicesID, &deviceCount);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    ASSERT_NE(deviceCount, 0);
    const char *name = nullptr;
    size_t deviceId = 0;
    returnCode = OH_NNDevice_GetName(allDevicesID[0], &name);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    deviceId = allDevicesID[0];

    OH_NNModel* model = nullptr;
    BuildDynamicModel(&model);

    OH_NNCompilation* compilation = ConstructCompilation(model, deviceId);
    ASSERT_NE(nullptr, compilation);
    OH_NNModel_Destroy(&model);
    OH_NNExecutor* executor = RunExecutor(compilation, deviceId, true);
    ASSERT_NE(nullptr, executor);
    OH_NNCompilation_Destroy(&compilation);
    OH_NNExecutor_Destroy(&executor);
}

/*
* @tc.name:sub_AI_NNRt_Core_Func_North_EndToEnd_0300
* @tc.desc:定长模型编译带量化参数端到端测试
* @tc.type:FUNC
*/
HWTEST_F(EndToEndTest, sub_AI_NNRt_Core_Func_North_EndToEnd_0300, Function | MediumTest | Level1)
{
    const size_t *allDevicesID = nullptr;
    uint32_t deviceCount = 0;
    OH_NN_ReturnCode returnCode = OH_NNDevice_GetAllDevicesID(&allDevicesID, &deviceCount);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    ASSERT_NE(deviceCount, 0);
    const char *name = nullptr;
    size_t deviceId = 0;
    returnCode = OH_NNDevice_GetName(allDevicesID[0], &name);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    deviceId = allDevicesID[0];

    OH_NNModel* model = nullptr;
    BuildModelWithQuantParams(&model);

    OH_NNCompilation* compilation = ConstructCompilation(model, deviceId);
    ASSERT_NE(nullptr, compilation);
    OH_NNModel_Destroy(&model);
    OH_NNExecutor* executor = RunExecutor(compilation, deviceId);
    ASSERT_NE(nullptr, executor);
    OH_NNCompilation_Destroy(&compilation);
    OH_NNExecutor_Destroy(&executor);
}

/*
* @tc.name:sub_AI_NNRt_Core_Func_North_Reliability_0100
* @tc.desc:定长模型编译长稳测试
* @tc.type:FUNC
*/
HWTEST_F(EndToEndTest, sub_AI_NNRt_Core_Func_North_Reliability_0100, Reliability | MediumTest | Level2)
{
    const size_t *allDevicesID = nullptr;
    uint32_t deviceCount = 0;
    OH_NN_ReturnCode returnCode = OH_NNDevice_GetAllDevicesID(&allDevicesID, &deviceCount);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    ASSERT_NE(deviceCount, 0);
    size_t deviceId = 0;
    deviceId = allDevicesID[0];

    OH_NNModel* model = nullptr;
    BuildModel(&model);
    for (int i = 0; i < STRESS_COUNT; i++) {
        OH_NNCompilation* compilation = ConstructCompilation(model, deviceId);
        ASSERT_NE(nullptr, compilation);
        OH_NNExecutor* executor = RunExecutor(compilation, deviceId);
        ASSERT_NE(nullptr, executor);
        OH_NNCompilation_Destroy(&compilation);
        OH_NNExecutor_Destroy(&executor);
        if (i % PRINT_FREQ == 0) {
            printf("[NnrtTest] Reliability_test_001 times: %d/%d\n", i, STRESS_COUNT);
        }
    }
    OH_NNModel_Destroy(&model);
}

/*
* @tc.name:sub_AI_NNRt_Core_Func_North_Reliability_0200
* @tc.desc:变长模型编译端到端测试
* @tc.type:FUNC
*/
HWTEST_F(EndToEndTest, sub_AI_NNRt_Core_Func_North_Reliability_0200, Reliability | MediumTest | Level2)
{
    const size_t *allDevicesID = nullptr;
    uint32_t deviceCount = 0;
    OH_NN_ReturnCode returnCode = OH_NNDevice_GetAllDevicesID(&allDevicesID, &deviceCount);
    ASSERT_EQ(returnCode, OH_NN_SUCCESS);
    ASSERT_NE(deviceCount, 0);
    size_t deviceId = 0;
    deviceId = allDevicesID[0];

    OH_NNModel* model = nullptr;
    BuildDynamicModel(&model);
    for (int i = 0; i < STRESS_COUNT; i++) {
        OH_NNCompilation* compilation = ConstructCompilation(model, deviceId, false);
        ASSERT_NE(nullptr, compilation);
        OH_NNExecutor* executor = RunExecutor(compilation, deviceId, true);
        ASSERT_NE(nullptr, executor);
        OH_NNCompilation_Destroy(&compilation);
        OH_NNExecutor_Destroy(&executor);
        if (i % PRINT_FREQ == 0) {
            printf("[NnrtTest] Reliability_test_002 times: %d/%d\n", i, STRESS_COUNT);
        }
    }
    OH_NNModel_Destroy(&model);
}
