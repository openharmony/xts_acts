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
#include "include/c_api/tensor_c.h"
#include "gtest/gtest.h"

using namespace testing::ext;

class TensorTest: public testing::Test {
protected:
static void SetUpTestCase(void) {}
static void TearDownTestCase(void) {}
virtual void SetUp() {}
virtual void TearDown() {}
};

/**
 * @tc.number :
 * @tc.name   :
 * @tc.desc   :
 */
HWTEST(TensorTest, TestCase_0001, Function | MediumTest | Level1) {
  constexpr size_t shape_num = 2;
  int64_t shape[shape_num] = {2, 3};
  OH_AI_TensorHandle tensor =
    OH_AI_TensorCreate("name001", OH_AI_DATATYPE_NUMBERTYPE_INT32, shape, shape_num, nullptr, 0);
  EXPECT_TRUE(tensor != nullptr);
  EXPECT_STREQ(OH_AI_TensorGetName(tensor), "name001");
  EXPECT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_INT32);
  size_t ret_shape_num;
  const int64_t *ret_shape = OH_AI_TensorGetShape(tensor, &ret_shape_num);
  EXPECT_EQ(ret_shape_num, shape_num);
  for (size_t i = 0; i < ret_shape_num; i++) {
    EXPECT_EQ(ret_shape[i], shape[i]);
  }
  EXPECT_EQ(OH_AI_TensorGetElementNum(tensor), 6);
  EXPECT_EQ(OH_AI_TensorGetDataSize(tensor), 6 * sizeof(int32_t));
  EXPECT_EQ(OH_AI_TensorGetData(tensor), nullptr);
  EXPECT_TRUE(OH_AI_TensorGetMutableData(tensor) != nullptr);

  OH_AI_TensorSetName(tensor, "name002");
  EXPECT_STREQ(OH_AI_TensorGetName(tensor), "name002");

  OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32);
  EXPECT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_FLOAT32);
  constexpr size_t new_shape_num = 4;
  int64_t new_shape[new_shape_num] = {1, 2, 3, 1};
  OH_AI_TensorSetShape(tensor, new_shape, new_shape_num);
  size_t new_ret_shape_num;
  const int64_t *new_ret_shape = OH_AI_TensorGetShape(tensor, &new_ret_shape_num);
  EXPECT_EQ(new_ret_shape_num, new_shape_num);
  for (size_t i = 0; i < new_ret_shape_num; i++) {
    EXPECT_EQ(new_ret_shape[i], new_shape[i]);
  }

  OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCHW);
  EXPECT_EQ(OH_AI_TensorGetFormat(tensor), OH_AI_FORMAT_NCHW);

  constexpr size_t data_len = 6;
  EXPECT_EQ(OH_AI_TensorGetElementNum(tensor), data_len);
  EXPECT_EQ(OH_AI_TensorGetDataSize(tensor), data_len * sizeof(float));

  float data[data_len] = {1, 2, 3, 4, 5, 6};
  OH_AI_TensorSetData(tensor, data);
  const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
  for (size_t i = 0; i < data_len; i++) {
    EXPECT_EQ(ret_data[i], data[i]);
  }

  OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
  EXPECT_TRUE(clone != nullptr);
  EXPECT_STREQ(OH_AI_TensorGetName(clone), "name002_duplicate");
  EXPECT_EQ(OH_AI_TensorGetDataType(clone), OH_AI_DATATYPE_NUMBERTYPE_FLOAT32);
  size_t clone_shape_num;
  const int64_t *clone_shape = OH_AI_TensorGetShape(clone, &clone_shape_num);
  EXPECT_EQ(clone_shape_num, new_ret_shape_num);
  for (size_t i = 0; i < clone_shape_num; i++) {
    EXPECT_EQ(clone_shape[i], new_ret_shape[i]);
  }
  EXPECT_EQ(OH_AI_TensorGetElementNum(clone), OH_AI_TensorGetElementNum(tensor));
  EXPECT_EQ(OH_AI_TensorGetDataSize(clone), OH_AI_TensorGetDataSize(tensor));
  EXPECT_TRUE(OH_AI_TensorGetData(clone) != OH_AI_TensorGetData(tensor));

  OH_AI_TensorDestroy(&tensor);
  OH_AI_TensorDestroy(&clone);
}
