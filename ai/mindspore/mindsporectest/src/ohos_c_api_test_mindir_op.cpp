/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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


#include "gtest/gtest.h"
#include "mindir.h"

using namespace testing::ext;
using namespace mindspore::lite;

class MSLiteMindirTest: public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown() {}
};

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Depend_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Depend_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Dropout_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Dropout_CreatePrimitive(1.87);
    ASSERT_NE(prim, nullptr);
    auto keep_prob = MindIR_Dropout_GetKeepProb(prim);
    ASSERT_EQ(keep_prob, 1.87f);
    MindIR_Dropout_SetKeepProb(&prim, 0.56);
    keep_prob = MindIR_Dropout_GetKeepProb(prim);
    ASSERT_EQ(keep_prob, 0.56f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Elu_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Elu_CreatePrimitive(1.87);
    ASSERT_NE(prim, nullptr);
    auto alpha = MindIR_Elu_GetAlpha(prim);
    ASSERT_EQ(alpha, 1.87f);
    MindIR_Elu_SetAlpha(&prim, 0.56);
    alpha = MindIR_Elu_GetAlpha(prim);
    ASSERT_EQ(alpha, 0.56f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_EmbeddingLookupFusion_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_EmbeddingLookupFusion_CreatePrimitive(1.87);
    ASSERT_NE(prim, nullptr);
    auto max_norm = MindIR_EmbeddingLookupFusion_GetMaxNorm(prim);
    ASSERT_EQ(max_norm, 1.87f);
    MindIR_EmbeddingLookupFusion_SetMaxNorm(&prim, 0.56);
    max_norm = MindIR_EmbeddingLookupFusion_GetMaxNorm(prim);
    ASSERT_EQ(max_norm, 0.56f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_FakeQuantWithMinMaxVars_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_FakeQuantWithMinMaxVars_CreatePrimitive(8, true);
    ASSERT_NE(prim, nullptr);
    auto num_bits = MindIR_FakeQuantWithMinMaxVars_GetNumBits(prim);
    ASSERT_EQ(num_bits, 8);
    MindIR_FakeQuantWithMinMaxVars_SetNumBits(&prim, 3);
    num_bits = MindIR_FakeQuantWithMinMaxVars_GetNumBits(prim);
    ASSERT_EQ(num_bits, 3);
    auto narrow_range = MindIR_FakeQuantWithMinMaxVars_GetNarrowRange(prim);
    ASSERT_EQ(narrow_range, true);
    MindIR_FakeQuantWithMinMaxVars_SetNarrowRange(&prim, false);
    narrow_range = MindIR_FakeQuantWithMinMaxVars_GetNarrowRange(prim);
    ASSERT_EQ(narrow_range, false);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_FakeQuantWithMinMaxVarsPerChannel_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_FakeQuantWithMinMaxVarsPerChannel_CreatePrimitive(8, true);
    ASSERT_NE(prim, nullptr);
    auto num_bits = MindIR_FakeQuantWithMinMaxVarsPerChannel_GetNumBits(prim);
    ASSERT_EQ(num_bits, 8);
    MindIR_FakeQuantWithMinMaxVarsPerChannel_SetNumBits(&prim, 3);
    num_bits = MindIR_FakeQuantWithMinMaxVarsPerChannel_GetNumBits(prim);
    ASSERT_EQ(num_bits, 3);
    auto narrow_range = MindIR_FakeQuantWithMinMaxVarsPerChannel_GetNarrowRange(prim);
    ASSERT_EQ(narrow_range, true);
    MindIR_FakeQuantWithMinMaxVarsPerChannel_SetNarrowRange(&prim, false);
    narrow_range = MindIR_FakeQuantWithMinMaxVarsPerChannel_GetNarrowRange(prim);
    ASSERT_EQ(narrow_range, false);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_FftReal_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_FftReal_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_FftImag_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_FftImag_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_FloorDiv_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_FloorDiv_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_FloorMod_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_FloorMod_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_GatherNd_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_GatherNd_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_HashtableLookup_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_HashtableLookup_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_LpNormalization_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_LpNormalization_CreatePrimitive(2, 2);
    ASSERT_NE(prim, nullptr);
    auto axis = MindIR_LpNormalization_GetAxis(prim);
    ASSERT_EQ(axis, 2);
    MindIR_LpNormalization_SetAxis(&prim, 3);
    axis = MindIR_LpNormalization_GetAxis(prim);
    ASSERT_EQ(axis, 3);
    auto p = MindIR_LpNormalization_GetP(prim);
    ASSERT_EQ(p, 2);
    MindIR_LpNormalization_SetP(&prim, 4);
    p = MindIR_LpNormalization_GetP(prim);
    ASSERT_EQ(p, 4);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_LshProjection_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_LshProjection_CreatePrimitive(SPARSE);
    ASSERT_NE(prim, nullptr);
    auto type = MindIR_LshProjection_GetType(prim);
    ASSERT_EQ(type, SPARSE);
    MindIR_LshProjection_SetType(&prim, DENSE);
    type = MindIR_LshProjection_GetType(prim);
    ASSERT_EQ(type, DENSE);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_SwitchLayer_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_SwitchLayer_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Mfcc_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Mfcc_CreatePrimitive(1.8, 0.5, 11, 22);
    ASSERT_NE(prim, nullptr);
    auto freq_upper_limit = MindIR_Mfcc_GetFreqUpperLimit(prim);
    ASSERT_EQ(freq_upper_limit, 1.8f);
    MindIR_Mfcc_SetFreqUpperLimit(&prim, 2.8);
    freq_upper_limit = MindIR_Mfcc_GetFreqUpperLimit(prim);
    ASSERT_EQ(freq_upper_limit, 2.8f);
    auto freq_lower_limit = MindIR_Mfcc_GetFreqLowerLimit(prim);
    ASSERT_EQ(freq_lower_limit, 0.5f);
    MindIR_Mfcc_SetFreqLowerLimit(&prim, 0.6);
    freq_lower_limit = MindIR_Mfcc_GetFreqLowerLimit(prim);
    ASSERT_EQ(freq_lower_limit, 0.6f);
    auto filter_bank_channel_num = MindIR_Mfcc_GetFilterBankChannelNum(prim);
    ASSERT_EQ(filter_bank_channel_num, 11);
    MindIR_Mfcc_SetFilterBankChannelNum(&prim, 13);
    filter_bank_channel_num = MindIR_Mfcc_GetFilterBankChannelNum(prim);
    ASSERT_EQ(filter_bank_channel_num, 13);
    auto dct_coeff_num = MindIR_Mfcc_GetDctCoeffNum(prim);
    ASSERT_EQ(dct_coeff_num, 22);
    MindIR_Mfcc_SetDctCoeffNum(&prim, 24);
    dct_coeff_num = MindIR_Mfcc_GetDctCoeffNum(prim);
    ASSERT_EQ(dct_coeff_num, 24);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_NonMaxSuppression_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_NonMaxSuppression_CreatePrimitive(2);
    ASSERT_NE(prim, nullptr);
    auto center_point_box = MindIR_NonMaxSuppression_GetCenterPointBox(prim);
    ASSERT_EQ(center_point_box, 2);
    MindIR_NonMaxSuppression_SetCenterPointBox(&prim, 3);
    center_point_box = MindIR_NonMaxSuppression_GetCenterPointBox(prim);
    ASSERT_EQ(center_point_box, 3);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_OnesLike_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_OnesLike_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_PartialFusion_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_PartialFusion_CreatePrimitive(2);
    ASSERT_NE(prim, nullptr);
    auto sub_graph_index = MindIR_PartialFusion_GetSubGraphIndex(prim);
    ASSERT_EQ(sub_graph_index, 2);
    MindIR_PartialFusion_SetSubGraphIndex(&prim, 3);
    sub_graph_index = MindIR_PartialFusion_GetSubGraphIndex(prim);
    ASSERT_EQ(sub_graph_index, 3);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_PriorBox_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::vector<int64_t> ori_min_sizes = {8};
    const std::vector<int64_t> ori_max_sizes = {80};
    const std::vector<float> ori_aspect_ratios = {1.8};
    const std::vector<float> ori_variances = {1.2};
    prim = MindIR_PriorBox_CreatePrimitive(ori_min_sizes, ori_max_sizes, ori_aspect_ratios, ori_variances, 2, 4, 0.8, 0.6, true, true, 0.1);
    ASSERT_NE(prim, nullptr);
    auto min_sizes = MindIR_PriorBox_GetMinSizes(prim);
    ASSERT_EQ(min_sizes, ori_min_sizes);
    const std::vector<int64_t> new_min_sizes = {12};
    MindIR_PriorBox_SetMinSizes(&prim, new_min_sizes);
    min_sizes = MindIR_PriorBox_GetMinSizes(prim);
    ASSERT_EQ(min_sizes, new_min_sizes);
    auto max_sizes = MindIR_PriorBox_GetMaxSizes(prim);
    ASSERT_EQ(max_sizes, ori_max_sizes);
    const std::vector<int64_t> new_max_sizes = {84};
    MindIR_PriorBox_SetMaxSizes(&prim, new_max_sizes);
    max_sizes = MindIR_PriorBox_GetMaxSizes(prim);
    ASSERT_EQ(max_sizes, new_max_sizes);
    auto aspect_ratios = MindIR_PriorBox_GetAspectRatios(prim);
    ASSERT_EQ(aspect_ratios, ori_aspect_ratios);
    const std::vector<float> new_aspect_ratios = {2.8};
    MindIR_PriorBox_SetAspectRatios(&prim, new_aspect_ratios);
    aspect_ratios = MindIR_PriorBox_GetAspectRatios(prim);
    ASSERT_EQ(aspect_ratios, new_aspect_ratios);
    auto variances = MindIR_PriorBox_GetVariances(prim);
    ASSERT_EQ(variances, ori_variances);
    const std::vector<float> new_variances = {1.3};
    MindIR_PriorBox_SetVariances(&prim, new_variances);
    variances = MindIR_PriorBox_GetVariances(prim);
    ASSERT_EQ(variances, new_variances);
    auto image_size_w = MindIR_PriorBox_GetImageSizeW(prim);
    ASSERT_EQ(image_size_w, 2);
    MindIR_PriorBox_SetImageSizeW(&prim, 3);
    image_size_w = MindIR_PriorBox_GetImageSizeW(prim);
    ASSERT_EQ(image_size_w, 3);
    auto image_size_h = MindIR_PriorBox_GetImageSizeH(prim);
    ASSERT_EQ(image_size_h, 4);
    MindIR_PriorBox_SetImageSizeH(&prim, 5);
    image_size_h = MindIR_PriorBox_GetImageSizeH(prim);
    ASSERT_EQ(image_size_h, 5);
    auto step_w = MindIR_PriorBox_GetStepW(prim);
    ASSERT_EQ(step_w, 0.8f);
    MindIR_PriorBox_SetStepW(&prim, 0.9);
    step_w = MindIR_PriorBox_GetStepW(prim);
    ASSERT_EQ(step_w, 0.9f);
    auto step_h = MindIR_PriorBox_GetStepH(prim);
    ASSERT_EQ(step_h, 0.6f);
    MindIR_PriorBox_SetStepH(&prim, 0.7);
    step_h = MindIR_PriorBox_GetStepH(prim);
    ASSERT_EQ(step_h, 0.7f);
    auto clip = MindIR_PriorBox_GetClip(prim);
    ASSERT_EQ(clip, true);
    MindIR_PriorBox_SetClip(&prim, false);
    clip = MindIR_PriorBox_GetClip(prim);
    ASSERT_EQ(clip, false);
    auto flip = MindIR_PriorBox_GetFlip(prim);
    ASSERT_EQ(flip, true);
    MindIR_PriorBox_SetFlip(&prim, false);
    flip = MindIR_PriorBox_GetFlip(prim);
    ASSERT_EQ(flip, false);
    auto offset = MindIR_PriorBox_GetOffset(prim);
    ASSERT_EQ(offset, 0.1f);
    MindIR_PriorBox_SetOffset(&prim, 0.2);
    offset = MindIR_PriorBox_GetOffset(prim);
    ASSERT_EQ(offset, 0.2f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_ReverseSequence_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_ReverseSequence_CreatePrimitive(1, 0);
    ASSERT_NE(prim, nullptr);
    auto seq_dim = MindIR_ReverseSequence_GetSeqDim(prim);
    ASSERT_EQ(seq_dim, 1);
    MindIR_ReverseSequence_SetSeqDim(&prim, 2);
    seq_dim = MindIR_ReverseSequence_GetSeqDim(prim);
    ASSERT_EQ(seq_dim, 2);
    auto batch_dim = MindIR_ReverseSequence_GetBatchDim(prim);
    ASSERT_EQ(batch_dim, 0);
    MindIR_ReverseSequence_SetBatchDim(&prim, 1);
    batch_dim = MindIR_ReverseSequence_GetBatchDim(prim);
    ASSERT_EQ(batch_dim, 1);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_ReverseV2_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::vector<int64_t> ori_axis = {1};
    prim = MindIR_ReverseV2_CreatePrimitive(ori_axis);
    ASSERT_NE(prim, nullptr);
    auto axis = MindIR_ReverseV2_GetAxis(prim);
    ASSERT_EQ(axis, ori_axis);
    const std::vector<int64_t> new_axis = {2};
    MindIR_ReverseV2_SetAxis(&prim, new_axis);
    axis = MindIR_ReverseV2_GetAxis(prim);
    ASSERT_EQ(axis, new_axis);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Rfft_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Rfft_CreatePrimitive(1);
    ASSERT_NE(prim, nullptr);
    auto fft_length = MindIR_Rfft_GetFftLength(prim);
    ASSERT_EQ(fft_length, 1);
    MindIR_Rfft_SetFftLength(&prim, 2);
    fft_length = MindIR_Rfft_GetFftLength(prim);
    ASSERT_EQ(fft_length, 2);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_ROIPooling_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_ROIPooling_CreatePrimitive(2, 2, 0.1);
    ASSERT_NE(prim, nullptr);
    auto pooled_h = MindIR_ROIPooling_GetPooledH(prim);
    ASSERT_EQ(pooled_h, 2);
    MindIR_ROIPooling_SetPooledH(&prim, 4);
    pooled_h = MindIR_ROIPooling_GetPooledH(prim);
    ASSERT_EQ(pooled_h, 4);
    auto pooled_w = MindIR_ROIPooling_GetPooledW(prim);
    ASSERT_EQ(pooled_w, 2);
    MindIR_ROIPooling_SetPooledW(&prim, 4);
    pooled_w = MindIR_ROIPooling_GetPooledW(prim);
    ASSERT_EQ(pooled_w, 4);
    auto scale = MindIR_ROIPooling_GetScale(prim);
    ASSERT_EQ(scale, 0.1f);
    MindIR_ROIPooling_SetScale(&prim, 0.2);
    scale = MindIR_ROIPooling_GetScale(prim);
    ASSERT_EQ(scale, 0.2f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_SkipGram_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_SkipGram_CreatePrimitive(true, 2, 2);
    ASSERT_NE(prim, nullptr);
    auto include_all_grams = MindIR_SkipGram_GetIncludeAllGrams(prim);
    ASSERT_EQ(include_all_grams, true);
    MindIR_SkipGram_SetIncludeAllGrams(&prim, false);
    include_all_grams = MindIR_SkipGram_GetIncludeAllGrams(prim);
    ASSERT_EQ(include_all_grams, false);
    auto max_skip_size = MindIR_SkipGram_GetMaxSkipSize(prim);
    ASSERT_EQ(max_skip_size, 2);
    MindIR_SkipGram_SetMaxSkipSize(&prim, 4);
    max_skip_size = MindIR_SkipGram_GetMaxSkipSize(prim);
    ASSERT_EQ(max_skip_size, 4);
    auto ngram_size = MindIR_SkipGram_GetNgramSize(prim);
    ASSERT_EQ(ngram_size, 2);
    MindIR_SkipGram_SetNgramSize(&prim, 4);
    ngram_size = MindIR_SkipGram_GetNgramSize(prim);
    ASSERT_EQ(ngram_size, 4);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Switch_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Switch_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Unique_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Unique_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_UnsortedSegmentSum_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_UnsortedSegmentSum_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_ZerosLike_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_ZerosLike_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_GRU_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_GRU_CreatePrimitive(true);
    ASSERT_NE(prim, nullptr);
    auto bidirectional = MindIR_GRU_GetBidirectional(prim);
    ASSERT_EQ(bidirectional, true);
    MindIR_GRU_SetBidirectional(&prim, false);
    bidirectional = MindIR_GRU_GetBidirectional(prim);
    ASSERT_EQ(bidirectional, false);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_NonZero_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_NonZero_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_InvertPermutation_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_InvertPermutation_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Size_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Size_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_RandomStandardNormal_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_RandomStandardNormal_CreatePrimitive(2, 2);
    ASSERT_NE(prim, nullptr);
    auto seed = MindIR_RandomStandardNormal_GetSeed(prim);
    ASSERT_EQ(seed, 2);
    MindIR_RandomStandardNormal_SetSeed(&prim, 4);
    seed = MindIR_RandomStandardNormal_GetSeed(prim);
    ASSERT_EQ(seed, 4);
    auto seed2 = MindIR_RandomStandardNormal_GetSeed2(prim);
    ASSERT_EQ(seed2, 2);
    MindIR_RandomStandardNormal_SetSeed2(&prim, 4);
    seed2 = MindIR_RandomStandardNormal_GetSeed2(prim);
    ASSERT_EQ(seed2, 4);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_CropAndResize_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_CropAndResize_CreatePrimitive(RESIZE_METHOD_LINEAR, 1.2);
    ASSERT_NE(prim, nullptr);
    auto method = MindIR_CropAndResize_GetMethod(prim);
    ASSERT_EQ(method, RESIZE_METHOD_LINEAR);
    MindIR_CropAndResize_SetMethod(&prim, RESIZE_METHOD_NEAREST);
    method = MindIR_CropAndResize_GetMethod(prim);
    ASSERT_EQ(method, RESIZE_METHOD_NEAREST);
    auto extrapolation_value = MindIR_CropAndResize_GetExtrapolationValue(prim);
    ASSERT_EQ(extrapolation_value, 1.2f);
    MindIR_CropAndResize_SetExtrapolationValue(&prim, 1.4f);
    extrapolation_value = MindIR_CropAndResize_GetExtrapolationValue(prim);
    ASSERT_EQ(extrapolation_value, 1.4f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_IsFinite_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_IsFinite_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_LinSpace_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_LinSpace_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_UniformReal_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_UniformReal_CreatePrimitive(2, 2);
    ASSERT_NE(prim, nullptr);
    auto seed = MindIR_UniformReal_GetSeed(prim);
    ASSERT_EQ(seed, 2);
    MindIR_UniformReal_SetSeed(&prim, 4);
    seed = MindIR_UniformReal_GetSeed(prim);
    ASSERT_EQ(seed, 4);
    auto seed2 = MindIR_UniformReal_GetSeed2(prim);
    ASSERT_EQ(seed2, 2);
    MindIR_UniformReal_SetSeed2(&prim, 4);
    seed2 = MindIR_UniformReal_GetSeed2(prim);
    ASSERT_EQ(seed2, 4);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Splice_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::vector<int64_t> ori_context = {8};
    const std::vector<int64_t> ori_forward_indexes = {80};
    prim = MindIR_Splice_CreatePrimitive(ori_context, ori_forward_indexes, 2);
    ASSERT_NE(prim, nullptr);
    auto context = MindIR_Splice_GetContext(prim);
    ASSERT_EQ(context, ori_context);
    const std::vector<int64_t> new_context = {9};
    MindIR_Splice_SetContext(&prim, new_context);
    context = MindIR_Splice_GetContext(prim);
    ASSERT_EQ(context, new_context);
    auto forward_indexes = MindIR_Splice_GetForwardIndexes(prim);
    ASSERT_EQ(forward_indexes, ori_forward_indexes);
    const std::vector<int64_t> new_forward_indexes = {9};
    MindIR_Splice_SetForwardIndexes(&prim, new_forward_indexes);
    forward_indexes = MindIR_Splice_GetForwardIndexes(prim);
    ASSERT_EQ(forward_indexes, new_forward_indexes);
    auto output_dim = MindIR_Splice_GetOutputDim(prim);
    ASSERT_EQ(output_dim, 2);
    MindIR_Splice_SetOutputDim(&prim, 4);
    output_dim = MindIR_Splice_GetOutputDim(prim);
    ASSERT_EQ(output_dim, 4);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Call_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Call_CreatePrimitive(true);
    ASSERT_NE(prim, nullptr);
    auto is_tail_call = MindIR_Call_GetIsTailCall(prim);
    ASSERT_EQ(is_tail_call, true);
    MindIR_Call_SetIsTailCall(&prim, false);
    is_tail_call = MindIR_Call_GetIsTailCall(prim);
    ASSERT_EQ(is_tail_call, false);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_CumSum_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_CumSum_CreatePrimitive(true, true);
    ASSERT_NE(prim, nullptr);
    auto exclusive = MindIR_CumSum_GetExclusive(prim);
    ASSERT_EQ(exclusive, true);
    MindIR_CumSum_SetExclusive(&prim, false);
    exclusive = MindIR_CumSum_GetExclusive(prim);
    ASSERT_EQ(exclusive, false);
    auto reverse = MindIR_CumSum_GetReverse(prim);
    ASSERT_EQ(reverse, true);
    MindIR_CumSum_SetReverse(&prim, false);
    reverse = MindIR_CumSum_GetReverse(prim);
    ASSERT_EQ(reverse, false);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_SplitWithOverlap_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::vector<int64_t> ori_ratio = {8};
    const std::vector<int64_t> ori_extend_top = {9};
    const std::vector<int64_t> ori_extend_bottom = {10};
    prim = MindIR_SplitWithOverlap_CreatePrimitive(2, 2, ori_ratio, ori_extend_top, ori_extend_bottom);
    ASSERT_NE(prim, nullptr);
    auto split_dim = MindIR_SplitWithOverlap_GetSplitDim(prim);
    ASSERT_EQ(split_dim, 2);
    MindIR_SplitWithOverlap_SetSplitDim(&prim, 4);
    split_dim = MindIR_SplitWithOverlap_GetSplitDim(prim);
    ASSERT_EQ(split_dim, 4);
    auto number_split = MindIR_SplitWithOverlap_GetNumberSplit(prim);
    ASSERT_EQ(number_split, 2);
    MindIR_SplitWithOverlap_SetNumberSplit(&prim, 4);
    number_split = MindIR_SplitWithOverlap_GetNumberSplit(prim);
    ASSERT_EQ(number_split, 4);
    auto ratio = MindIR_SplitWithOverlap_GetRatio(prim);
    ASSERT_EQ(ratio, ori_ratio);
    const std::vector<int64_t> new_ratio = {18};
    MindIR_SplitWithOverlap_SetRatio(&prim, new_ratio);
    ratio = MindIR_SplitWithOverlap_GetRatio(prim);
    ASSERT_EQ(ratio, new_ratio);
    auto extend_top = MindIR_SplitWithOverlap_GetExtendTop(prim);
    ASSERT_EQ(extend_top, ori_extend_top);
    const std::vector<int64_t> new_extend_top = {19};
    MindIR_SplitWithOverlap_SetExtendTop(&prim, new_extend_top);
    extend_top = MindIR_SplitWithOverlap_GetExtendTop(prim);
    ASSERT_EQ(extend_top, new_extend_top);
    auto extend_bottom = MindIR_SplitWithOverlap_GetExtendBottom(prim);
    ASSERT_EQ(extend_bottom, ori_extend_bottom);
    const std::vector<int64_t> new_extend_bottom = {20};
    MindIR_SplitWithOverlap_SetExtendBottom(&prim, new_extend_bottom);
    extend_bottom = MindIR_SplitWithOverlap_GetExtendBottom(prim);
    ASSERT_EQ(extend_bottom, new_extend_bottom);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_GenOP_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::vector<int64_t> ori_kernel_size = {7};
    const std::vector<int64_t> ori_stride = {8};
    const std::vector<int64_t> ori_dilation = {9};
    const std::vector<int64_t> ori_pad_list = {11};
    const std::vector<int64_t> ori_pad = {24};
    const std::vector<int64_t> ori_axes = {28};
    prim = MindIR_GenOP_CreatePrimitive(ACTIVATION_TYPE_NO_ACTIVATION, 2.2, 3.3, 4.4, true, FORMAT_NCHW, ori_kernel_size, ori_stride, ori_dilation, PAD_MODE_PAD, ori_pad_list, 12, 13, 14, 15, ELTWISE_MODE_PROD, true, true, 19, 20.1, 21.1, true, true, ori_pad, ROUND_MODE_FLOOR, true, true, ori_axes, true, REDUCE_MODE_MEAN, true, 32.1);
    ASSERT_NE(prim, nullptr);
    auto activation_type = MindIR_GenOP_GetActivationType(prim);
    ASSERT_EQ(activation_type, ACTIVATION_TYPE_NO_ACTIVATION);
    MindIR_GenOP_SetActivationType(&prim, ACTIVATION_TYPE_RELU);
    activation_type = MindIR_GenOP_GetActivationType(prim);
    ASSERT_EQ(activation_type, ACTIVATION_TYPE_RELU);
    auto alpha = MindIR_GenOP_GetAlpha(prim);
    ASSERT_EQ(alpha, 2.2f);
    MindIR_GenOP_SetAlpha(&prim, 2.3);
    alpha = MindIR_GenOP_GetAlpha(prim);
    ASSERT_EQ(alpha, 2.3f);
    auto min_val = MindIR_GenOP_GetMinVal(prim);
    ASSERT_EQ(min_val, 3.3f);
    MindIR_GenOP_SetMinVal(&prim, 3.4);
    min_val = MindIR_GenOP_GetMinVal(prim);
    ASSERT_EQ(min_val, 3.4f);
    auto max_val = MindIR_GenOP_GetMaxVal(prim);
    ASSERT_EQ(max_val, 4.4f);
    MindIR_GenOP_SetMaxVal(&prim, 4.5);
    max_val = MindIR_GenOP_GetMaxVal(prim);
    ASSERT_EQ(max_val, 4.5f);
    auto is_training = MindIR_GenOP_GetIsTraining(prim);
    ASSERT_EQ(is_training, true);
    MindIR_GenOP_SetIsTraining(&prim, false);
    is_training = MindIR_GenOP_GetIsTraining(prim);
    ASSERT_EQ(is_training, false);
    auto format = MindIR_GenOP_GetFormat(prim);
    ASSERT_EQ(format, FORMAT_NCHW);
    MindIR_GenOP_SetFormat(&prim, FORMAT_NHWC);
    format = MindIR_GenOP_GetFormat(prim);
    ASSERT_EQ(format, FORMAT_NHWC);
    auto kernel_size = MindIR_GenOP_GetKernelSize(prim);
    ASSERT_EQ(kernel_size, ori_kernel_size);
    const std::vector<int64_t> new_kernel_size = {17};
    MindIR_GenOP_SetKernelSize(&prim, new_kernel_size);
    kernel_size = MindIR_GenOP_GetKernelSize(prim);
    ASSERT_EQ(kernel_size, new_kernel_size);
    auto stride = MindIR_GenOP_GetStride(prim);
    ASSERT_EQ(stride, ori_stride);
    const std::vector<int64_t> new_stride = {18};
    MindIR_GenOP_SetStride(&prim, new_stride);
    stride = MindIR_GenOP_GetStride(prim);
    ASSERT_EQ(stride, new_stride);
    auto dilation = MindIR_GenOP_GetDilation(prim);
    ASSERT_EQ(dilation, ori_dilation);
    const std::vector<int64_t> new_dilation = {19};
    MindIR_GenOP_SetDilation(&prim, new_dilation);
    dilation = MindIR_GenOP_GetDilation(prim);
    ASSERT_EQ(dilation, new_dilation);
    auto pad_mode = MindIR_GenOP_GetPadMode(prim);
    ASSERT_EQ(pad_mode, PAD_MODE_PAD);
    MindIR_GenOP_SetPadMode(&prim, PAD_MODE_SAME);
    pad_mode = MindIR_GenOP_GetPadMode(prim);
    ASSERT_EQ(pad_mode, PAD_MODE_SAME);
    auto pad_list = MindIR_GenOP_GetPadList(prim);
    ASSERT_EQ(pad_list, ori_pad_list);
    const std::vector<int64_t> new_pad_list = {21};
    MindIR_GenOP_SetPadList(&prim, new_pad_list);
    pad_list = MindIR_GenOP_GetPadList(prim);
    ASSERT_EQ(pad_list, new_pad_list);
    auto mode = MindIR_GenOP_GetMode(prim);
    ASSERT_EQ(mode, 12);
    MindIR_GenOP_SetMode(&prim, 22);
    mode = MindIR_GenOP_GetMode(prim);
    ASSERT_EQ(mode, 22);
    auto group = MindIR_GenOP_GetGroup(prim);
    ASSERT_EQ(group, 13);
    MindIR_GenOP_SetGroup(&prim, 23);
    group = MindIR_GenOP_GetGroup(prim);
    ASSERT_EQ(group, 23);
    auto in_channel = MindIR_GenOP_GetInChannel(prim);
    ASSERT_EQ(in_channel, 14);
    MindIR_GenOP_SetInChannel(&prim, 24);
    in_channel = MindIR_GenOP_GetInChannel(prim);
    ASSERT_EQ(in_channel, 24);
    auto out_channel = MindIR_GenOP_GetOutChannel(prim);
    ASSERT_EQ(out_channel, 15);
    MindIR_GenOP_SetOutChannel(&prim, 25);
    out_channel = MindIR_GenOP_GetOutChannel(prim);
    ASSERT_EQ(out_channel, 25);
    auto eltwise_mode = MindIR_GenOP_GetEltwiseMode(prim);
    ASSERT_EQ(eltwise_mode, ELTWISE_MODE_PROD);
    MindIR_GenOP_SetEltwiseMode(&prim, ELTWISE_MODE_SUM);
    eltwise_mode = MindIR_GenOP_GetEltwiseMode(prim);
    ASSERT_EQ(eltwise_mode, ELTWISE_MODE_SUM);
    auto has_bias = MindIR_GenOP_GetHasBias(prim);
    ASSERT_EQ(has_bias, true);
    MindIR_GenOP_SetHasBias(&prim, false);
    has_bias = MindIR_GenOP_GetHasBias(prim);
    ASSERT_EQ(has_bias, false);
    auto use_axis = MindIR_GenOP_GetUseAxis(prim);
    ASSERT_EQ(use_axis, true);
    MindIR_GenOP_SetUseAxis(&prim, false);
    use_axis = MindIR_GenOP_GetUseAxis(prim);
    ASSERT_EQ(use_axis, false);
    auto axis = MindIR_GenOP_GetAxis(prim);
    ASSERT_EQ(axis, 19);
    MindIR_GenOP_SetAxis(&prim, 29);
    axis = MindIR_GenOP_GetAxis(prim);
    ASSERT_EQ(axis, 29);
    auto epsilon = MindIR_GenOP_GetEpsilon(prim);
    ASSERT_EQ(epsilon, 20.1f);
    MindIR_GenOP_SetEpsilon(&prim, 20.2);
    epsilon = MindIR_GenOP_GetEpsilon(prim);
    ASSERT_EQ(epsilon, 20.2f);
    auto momentum = MindIR_GenOP_GetMomentum(prim);
    ASSERT_EQ(momentum, 21.1f);
    MindIR_GenOP_SetMomentum(&prim, 21.2);
    momentum = MindIR_GenOP_GetMomentum(prim);
    ASSERT_EQ(momentum, 21.2f);
    auto transpose_a = MindIR_GenOP_GetTransposeA(prim);
    ASSERT_EQ(transpose_a, true);
    MindIR_GenOP_SetTransposeA(&prim, false);
    transpose_a = MindIR_GenOP_GetTransposeA(prim);
    ASSERT_EQ(transpose_a, false);
    auto transpose_b = MindIR_GenOP_GetTransposeB(prim);
    ASSERT_EQ(transpose_b, true);
    MindIR_GenOP_SetTransposeB(&prim, false);
    transpose_b = MindIR_GenOP_GetTransposeB(prim);
    ASSERT_EQ(transpose_b, false);
    auto pad = MindIR_GenOP_GetPad(prim);
    ASSERT_EQ(pad, ori_pad);
    const std::vector<int64_t> new_pad = {34};
    MindIR_GenOP_SetPad(&prim, new_pad);
    pad = MindIR_GenOP_GetPad(prim);
    ASSERT_EQ(pad, new_pad);
    auto round_mode = MindIR_GenOP_GetRoundMode(prim);
    ASSERT_EQ(round_mode, ROUND_MODE_FLOOR);
    MindIR_GenOP_SetRoundMode(&prim, ROUND_MODE_CEIL);
    round_mode = MindIR_GenOP_GetRoundMode(prim);
    ASSERT_EQ(round_mode, ROUND_MODE_CEIL);
    auto global = MindIR_GenOP_GetGlobal(prim);
    ASSERT_EQ(global, true);
    MindIR_GenOP_SetGlobal(&prim, false);
    global = MindIR_GenOP_GetGlobal(prim);
    ASSERT_EQ(global, false);
    auto channel_shared = MindIR_GenOP_GetChannelShared(prim);
    ASSERT_EQ(channel_shared, true);
    MindIR_GenOP_SetChannelShared(&prim, false);
    channel_shared = MindIR_GenOP_GetChannelShared(prim);
    ASSERT_EQ(channel_shared, false);
    auto axes = MindIR_GenOP_GetAxes(prim);
    ASSERT_EQ(axes, ori_axes);
    const std::vector<int64_t> new_axes = {38};
    MindIR_GenOP_SetAxes(&prim, new_axes);
    axes = MindIR_GenOP_GetAxes(prim);
    ASSERT_EQ(axes, new_axes);
    auto keep_dims = MindIR_GenOP_GetKeepDims(prim);
    ASSERT_EQ(keep_dims, true);
    MindIR_GenOP_SetKeepDims(&prim, false);
    keep_dims = MindIR_GenOP_GetKeepDims(prim);
    ASSERT_EQ(keep_dims, false);
    auto reduce_mode = MindIR_GenOP_GetReduceMode(prim);
    ASSERT_EQ(reduce_mode, REDUCE_MODE_MEAN);
    MindIR_GenOP_SetReduceMode(&prim, REDUCE_MODE_MAX);
    reduce_mode = MindIR_GenOP_GetReduceMode(prim);
    ASSERT_EQ(reduce_mode, REDUCE_MODE_MAX);
    auto reduce_to_end = MindIR_GenOP_GetReduceToEnd(prim);
    ASSERT_EQ(reduce_to_end, true);
    MindIR_GenOP_SetReduceToEnd(&prim, false);
    reduce_to_end = MindIR_GenOP_GetReduceToEnd(prim);
    ASSERT_EQ(reduce_to_end, false);
    auto coeff = MindIR_GenOP_GetCoeff(prim);
    ASSERT_EQ(coeff, 32.1f);
    MindIR_GenOP_SetCoeff(&prim, 32.2);
    coeff = MindIR_GenOP_GetCoeff(prim);
    ASSERT_EQ(coeff, 32.2f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_RaggedRange_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_RaggedRange_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_GLU_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_GLU_CreatePrimitive(1);
    ASSERT_NE(prim, nullptr);
    auto axis = MindIR_GLU_GetAxis(prim);
    ASSERT_EQ(axis, 1);
    MindIR_GLU_SetAxis(&prim, 2);
    axis = MindIR_GLU_GetAxis(prim);
    ASSERT_EQ(axis, 2);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Affine_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::vector<int64_t> ori_context = {1};
    prim = MindIR_Affine_CreatePrimitive(ori_context, 2, ACTIVATION_TYPE_NO_ACTIVATION, true ,true );
    ASSERT_NE(prim, nullptr);
    auto context = MindIR_Affine_GetContext(prim);
    ASSERT_EQ(context, ori_context);
    const std::vector<int64_t> new_context = {11};
    MindIR_Affine_SetContext(&prim, new_context);
    context = MindIR_Affine_GetContext(prim);
    ASSERT_EQ(context, new_context);
    auto output_dim = MindIR_Affine_GetOutputDim(prim);
    ASSERT_EQ(output_dim, 2);
    MindIR_Affine_SetOutputDim(&prim, 12);
    output_dim = MindIR_Affine_GetOutputDim(prim);
    ASSERT_EQ(output_dim, 12);
    auto activation_type = MindIR_Affine_GetActivationType(prim);
    ASSERT_EQ(activation_type, ACTIVATION_TYPE_NO_ACTIVATION);
    MindIR_Affine_SetActivationType(&prim, ACTIVATION_TYPE_RELU);
    activation_type = MindIR_Affine_GetActivationType(prim);
    ASSERT_EQ(activation_type, ACTIVATION_TYPE_RELU);
    auto transpose_a = MindIR_Affine_GetTransposeA(prim);
    ASSERT_EQ(transpose_a, true);
    MindIR_Affine_SetTransposeA(&prim, false);
    transpose_a = MindIR_Affine_GetTransposeA(prim);
    ASSERT_EQ(transpose_a, false);
    auto transpose_b = MindIR_Affine_GetTransposeB(prim);
    ASSERT_EQ(transpose_b, true);
    MindIR_Affine_SetTransposeB(&prim, false);
    transpose_b = MindIR_Affine_GetTransposeB(prim);
    ASSERT_EQ(transpose_b, false);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_AllGather_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::string ori_group = "aaa";
    prim = MindIR_AllGather_CreatePrimitive(ori_group, 2);
    ASSERT_NE(prim, nullptr);
    auto group = MindIR_AllGather_GetGroup(prim);
    ASSERT_EQ(group, ori_group);
    const std::string new_group = "bbb";
    MindIR_AllGather_SetGroup(&prim, new_group);
    group = MindIR_AllGather_GetGroup(prim);
    ASSERT_EQ(group, new_group);
    auto rank_size = MindIR_AllGather_GetRankSize(prim);
    ASSERT_EQ(rank_size, 2);
    MindIR_AllGather_SetRankSize(&prim, 12);
    rank_size = MindIR_AllGather_GetRankSize(prim);
    ASSERT_EQ(rank_size, 12);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_ReduceScatter_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    const std::string ori_group = "aaa";
    prim = MindIR_ReduceScatter_CreatePrimitive(ori_group, REDUCE_MODE_MEAN, 3);
    ASSERT_NE(prim, nullptr);
    auto group = MindIR_ReduceScatter_GetGroup(prim);
    ASSERT_EQ(group, ori_group);
    const std::string new_group = "bbb";
    MindIR_ReduceScatter_SetGroup(&prim, new_group);
    group = MindIR_ReduceScatter_GetGroup(prim);
    ASSERT_EQ(group, new_group);
    auto mode = MindIR_ReduceScatter_GetMode(prim);
    ASSERT_EQ(mode, REDUCE_MODE_MEAN);
    MindIR_ReduceScatter_SetMode(&prim, REDUCE_MODE_MAX);
    mode = MindIR_ReduceScatter_GetMode(prim);
    ASSERT_EQ(mode, REDUCE_MODE_MAX);
    auto rank_size = MindIR_ReduceScatter_GetRankSize(prim);
    ASSERT_EQ(rank_size, 3);
    MindIR_ReduceScatter_SetRankSize(&prim, 13);
    rank_size = MindIR_ReduceScatter_GetRankSize(prim);
    ASSERT_EQ(rank_size, 13);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_DynamicQuant_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_DynamicQuant_CreatePrimitive(true, 2);
    ASSERT_NE(prim, nullptr);
    auto symmetric = MindIR_DynamicQuant_GetSymmetric(prim);
    ASSERT_EQ(symmetric, true);
    MindIR_DynamicQuant_SetSymmetric(&prim, false);
    symmetric = MindIR_DynamicQuant_GetSymmetric(prim);
    ASSERT_EQ(symmetric, false);
    auto dst_type = MindIR_DynamicQuant_GetDstType(prim);
    ASSERT_EQ(dst_type, 2);
    MindIR_DynamicQuant_SetDstType(&prim, 12);
    dst_type = MindIR_DynamicQuant_GetDstType(prim);
    ASSERT_EQ(dst_type, 12);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_RandomNormal_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_RandomNormal_CreatePrimitive(1.1, 2.1, 3.1);
    ASSERT_NE(prim, nullptr);
    auto seed = MindIR_RandomNormal_GetSeed(prim);
    ASSERT_EQ(seed, 1.1f);
    MindIR_RandomNormal_SetSeed(&prim, 1.2);
    seed = MindIR_RandomNormal_GetSeed(prim);
    ASSERT_EQ(seed, 1.2f);
    auto mean = MindIR_RandomNormal_GetMean(prim);
    ASSERT_EQ(mean, 2.1f);
    MindIR_RandomNormal_SetMean(&prim, 2.2);
    mean = MindIR_RandomNormal_GetMean(prim);
    ASSERT_EQ(mean, 2.2f);
    auto scale = MindIR_RandomNormal_GetScale(prim);
    ASSERT_EQ(scale, 3.1f);
    MindIR_RandomNormal_SetScale(&prim, 3.2);
    scale = MindIR_RandomNormal_GetScale(prim);
    ASSERT_EQ(scale, 3.2f);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_FormatTranspose_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_FormatTranspose_CreatePrimitive(FORMAT_NCHW, FORMAT_NCHW);
    ASSERT_NE(prim, nullptr);
    auto src_format = MindIR_FormatTranspose_GetSrcFormat(prim);
    ASSERT_EQ(src_format, FORMAT_NCHW);
    MindIR_FormatTranspose_SetSrcFormat(&prim, FORMAT_NHWC);
    src_format = MindIR_FormatTranspose_GetSrcFormat(prim);
    ASSERT_EQ(src_format, FORMAT_NHWC);
    auto dst_format = MindIR_FormatTranspose_GetDstFormat(prim);
    ASSERT_EQ(dst_format, FORMAT_NCHW);
    MindIR_FormatTranspose_SetDstFormat(&prim, FORMAT_NHWC);
    dst_format = MindIR_FormatTranspose_GetDstFormat(prim);
    ASSERT_EQ(dst_format, FORMAT_NHWC);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_GatherD_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_GatherD_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_GroupNormFusion_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_GroupNormFusion_CreatePrimitive(1, 2.1, true);
    ASSERT_NE(prim, nullptr);
    auto num_groups = MindIR_GroupNormFusion_GetNumGroups(prim);
    ASSERT_EQ(num_groups, 1);
    MindIR_GroupNormFusion_SetNumGroups(&prim, 11);
    num_groups = MindIR_GroupNormFusion_GetNumGroups(prim);
    ASSERT_EQ(num_groups, 11);
    auto epsilon = MindIR_GroupNormFusion_GetEpsilon(prim);
    ASSERT_EQ(epsilon, 2.1f);
    MindIR_GroupNormFusion_SetEpsilon(&prim, 2.2);
    epsilon = MindIR_GroupNormFusion_GetEpsilon(prim);
    ASSERT_EQ(epsilon, 2.2f);
    auto affine = MindIR_GroupNormFusion_GetAffine(prim);
    ASSERT_EQ(affine, true);
    MindIR_GroupNormFusion_SetAffine(&prim, false);
    affine = MindIR_GroupNormFusion_GetAffine(prim);
    ASSERT_EQ(affine, false);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Log1p_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Log1p_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_SparseFillEmptyRows_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_SparseFillEmptyRows_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_SparseReshape_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_SparseReshape_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_SparseSegmentSum_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_SparseSegmentSum_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_ScatterElements_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_ScatterElements_CreatePrimitive(1);
    ASSERT_NE(prim, nullptr);
    auto axis = MindIR_ScatterElements_GetAxis(prim);
    ASSERT_EQ(axis, 1);
    MindIR_ScatterElements_SetAxis(&prim, 11);
    axis = MindIR_ScatterElements_GetAxis(prim);
    ASSERT_EQ(axis, 11);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Triu_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Triu_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}

HWTEST(MSLiteMindirTest, SUB_AI_MindSpore_Mindir_Tril_0001, Function | MediumTest | Level1) {
    PrimitivePtr prim = nullptr;
    prim = MindIR_Tril_CreatePrimitive();
    ASSERT_NE(prim, nullptr);
}
