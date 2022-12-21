/**
 * Copyright 2021-2022 Huawei Technologies Co., Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <fstream>
#include "include/c_api/model_c.h"
#include "gtest/gtest.h"

using namespace testing::ext;

const char* MODEL_FILE_PATH = "/data/test/mobilenetv2.ms";

std::map<std::string, std::pair<int, float>> g_op_times_by_type_;
std::map<std::string, std::pair<int, float>> g_op_times_by_name_;

#ifdef __cplusplus
extern "C" {
#endif
uint64_t g_op_begin_ = 0;
int g_op_call_times_total_ = 0;
float g_op_cost_total_ = 0.0f;
const int USEC = 1000000;
const int MSEC = 1000;

uint64_t GetTimeUs() {
  struct timespec ts = {0, 0};
  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
    return 0;
  }
  auto ret_val = static_cast<uint64_t>((ts.tv_sec * USEC) + (ts.tv_nsec / MSEC));
  return ret_val;
}

bool TimeBeforeCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                        const OH_AI_CallBackParam kernel_Info) {
  if (g_op_times_by_type_.find(kernel_Info.node_type) == g_op_times_by_type_.end()) {
    g_op_times_by_type_.insert(std::make_pair(kernel_Info.node_type, std::make_pair(0, 0.0f)));
  }
  if (g_op_times_by_name_.find(kernel_Info.node_name) == g_op_times_by_name_.end()) {
    g_op_times_by_name_.insert(std::make_pair(kernel_Info.node_name, std::make_pair(0, 0.0f)));
  }

  g_op_call_times_total_++;
  g_op_begin_ = GetTimeUs();
  return true;
}

bool TimeAfterCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                       const OH_AI_CallBackParam kernel_Info) {
  uint64_t opEnd = GetTimeUs();
  constexpr float kFloatMSEC = 1000.0f;
  float cost = static_cast<float>(opEnd - g_op_begin_) / kFloatMSEC;
  g_op_cost_total_ += cost;
  g_op_times_by_type_[kernel_Info.node_type].first++;
  g_op_times_by_type_[kernel_Info.node_type].second += cost;
  g_op_times_by_name_[kernel_Info.node_name].first++;
  g_op_times_by_name_[kernel_Info.node_name].second += cost;
  return true;
}
#ifdef __cplusplus
}
#endif

class ModelTest: public testing::Test {
protected:
  static void SetUpTestCase(void) {}
  static void TearDownTestCase(void) {}
  virtual void SetUp() {}
  virtual void TearDown() {}
};

int GenerateInputDataWithRandom(OH_AI_TensorHandleArray inputs) {
  for (size_t i = 0; i < inputs.handle_num; ++i) {
    float *input_data = (float *)OH_AI_TensorGetMutableData(inputs.handle_list[i]);
    if (input_data == NULL) {
      printf("OH_AI_TensorGetMutableData failed.\n");
      return OH_AI_STATUS_LITE_ERROR;
    }
    int64_t num = OH_AI_TensorGetElementNum(inputs.handle_list[i]);
    const int divisor = 10;
    for (int64_t j = 0; j < num; j++) {
      input_data[j] = (float)(rand() % divisor) / divisor;  // 0--0.9f
    }
  }
  return OH_AI_STATUS_SUCCESS;
}

char *ReadFile(const char *file, size_t *size) {
  std::fstream ifs;
  ifs.open(file, std::ifstream::in | std::ifstream::binary);
  if (!ifs.good() || !ifs.is_open()) {
    return nullptr;
  }
  ifs.seekg(0, std::ios::end);
  *size = ifs.tellg();
  auto buf = std::make_unique<char[]>(*size);
  EXPECT_NE(buf, nullptr);
  ifs.seekg(0, std::ios::beg);
  ifs.read(buf.get(), *size);
  return buf.release();
}

HWTEST(ModelTest, TestCase_0001_build, Function | MediumTest | Level1) {
  OH_AI_ContextHandle context = OH_AI_ContextCreate();
  if (context == nullptr) {
    printf("OH_AI_ContextCreate failed.\n");
    EXPECT_NE(context, nullptr);
  }
  OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
  if (cpu_device_info == nullptr) {
    printf("OH_AI_DeviceInfoCreate failed.\n");
    OH_AI_ContextDestroy(&context);
    EXPECT_NE(cpu_device_info, nullptr);
  }
  OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
  OH_AI_ModelHandle model = OH_AI_ModelCreate();
  if (model == nullptr) {
    printf("OH_AI_ModelCreate failed.\n");
    OH_AI_ContextDestroy(&context);
    EXPECT_NE(model, nullptr);
  }
  size_t size = 0;
  auto buff = ReadFile(MODEL_FILE_PATH, &size);
  EXPECT_NE(buff, nullptr);
  int ret = OH_AI_ModelBuild(model, buff, size, OH_AI_MODELTYPE_MINDIR, context);
  EXPECT_EQ(ret, OH_AI_STATUS_SUCCESS);
  OH_AI_ModelSetWorkspace(model, nullptr, 0);
  OH_AI_ModelDestroy(&model);
}

HWTEST(ModelTest, TestCase_0002_predict, Function | MediumTest | Level1) {
  // Create and init context, add CPU device info
  OH_AI_ContextHandle context = OH_AI_ContextCreate();
  if (context == nullptr) {
    printf("OH_AI_ContextCreate failed.\n");
    EXPECT_NE(context, nullptr);
  }
  const int thread_num = 2;
  OH_AI_ContextSetThreadNum(context, thread_num);
  OH_AI_ContextSetThreadAffinityMode(context, 1);

  OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
  if (cpu_device_info == nullptr) {
    printf("OH_AI_DeviceInfoCreate failed.\n");
    OH_AI_ContextDestroy(&context);
    EXPECT_NE(cpu_device_info, nullptr);
  }
  OH_AI_DeviceInfoSetEnableFP16(cpu_device_info, false);
  OH_AI_ContextAddDeviceInfo(context, cpu_device_info);

  // Create model
  OH_AI_ModelHandle model = OH_AI_ModelCreate();
  if (model == nullptr) {
    printf("OH_AI_ModelCreate failed.\n");
    OH_AI_ContextDestroy(&context);
    EXPECT_NE(model, nullptr);
  }
  // Build model
  int ret = OH_AI_ModelBuildFromFile(model, MODEL_FILE_PATH, OH_AI_MODELTYPE_MINDIR, context);
  if (ret != OH_AI_STATUS_SUCCESS) {
    printf("OH_AI_ModelBuildFromFile failed, ret: %d.\n", ret);
    OH_AI_ModelDestroy(&model);
    EXPECT_EQ(ret, OH_AI_STATUS_SUCCESS);
  }
  // Get Inputs
  OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
  if (inputs.handle_list == nullptr) {
    printf("OH_AI_ModelGetInputs failed, ret: %d.\n", ret);
    OH_AI_ModelDestroy(&model);
    EXPECT_NE(inputs.handle_list, nullptr);
  }

  std::vector<OH_AI_ShapeInfo> shape_infos = {{4, {1, 112, 112, 3}}};
  ret = OH_AI_ModelResize(model, inputs, shape_infos.data(), shape_infos.size());
  EXPECT_EQ(ret, OH_AI_STATUS_SUCCESS);

  // Generate random data as input data.
  ret = GenerateInputDataWithRandom(inputs);
  if (ret != OH_AI_STATUS_SUCCESS) {
    printf("GenerateInputDataWithRandom failed, ret: %d.\n", ret);
    OH_AI_ModelDestroy(&model);
    EXPECT_EQ(ret, OH_AI_STATUS_SUCCESS);
  }

  // Model Predict
  OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
  ret = OH_AI_ModelPredict(model, inputs, &outputs, TimeBeforeCallback, TimeAfterCallback);
  if (ret != OH_AI_STATUS_SUCCESS) {
    printf("OH_AI_ModelPredict failed, ret: %d.\n", ret);
    OH_AI_ModelDestroy(&model);
    EXPECT_EQ(ret, OH_AI_STATUS_SUCCESS);
  }

  // Print Input and Output Tensor Data.
  for (size_t i = 0; i < inputs.handle_num; ++i) {
    OH_AI_TensorHandle tensor = inputs.handle_list[i];
    int64_t element_num = OH_AI_TensorGetElementNum(tensor);
    printf("Tensor name: %s.\n", OH_AI_TensorGetName(tensor));
    const float *data =
      (const float *)OH_AI_TensorGetData(OH_AI_ModelGetInputByTensorName(model, OH_AI_TensorGetName(tensor)));
    printf("input data is:\n");
    const int max_print_num = 10;
    for (int j = 0; j < element_num && j <= max_print_num; ++j) {
      printf("%f ", data[i]);
    }
    printf("\n");
  }
  for (size_t i = 0; i < outputs.handle_num; ++i) {
    OH_AI_TensorHandle tensor = outputs.handle_list[i];
    int64_t element_num = OH_AI_TensorGetElementNum(tensor);
    printf("Tensor name: %s.\n", OH_AI_TensorGetName(tensor));
    const float *data =
      (const float *)OH_AI_TensorGetData(OH_AI_ModelGetOutputByTensorName(model, OH_AI_TensorGetName(tensor)));
    printf("output data is:\n");
    const int max_print_num = 10;
    for (int j = 0; j < element_num && j <= max_print_num; ++j) {
      printf("%f ", data[i]);
    }
    printf("\n");
  }

  // Delete model.
  OH_AI_ModelDestroy(&model);
  EXPECT_EQ(model, nullptr);
}
