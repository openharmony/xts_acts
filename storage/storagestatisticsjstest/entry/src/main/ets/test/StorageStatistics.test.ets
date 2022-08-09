/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
// @ts-nocheck
import storageStatistics from "@ohos.storageStatistics";
import { describe, it, expect } from "@ohos/hypium"
import {isIntNum, isNegativeNum, isInclude} from "./Common";

export default function storageStatisticsTest() {
  describe("storageStatisticsTest", function () {
    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_CURRENT_BUNDLE_STATS_0000
     * @tc.name storage_statistics_test_get_current_bundle_stats_async_000
     * @tc.desc Test getCurrentBundleStats() interfaces, returned in promise mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_current_bundle_stats_async_000", 0, async function (done) {
      try {
        let bundleStat = await storageStatistics.getCurrentBundleStats();
        expect(bundleStat != null).assertTrue();
        expect(isIntNum(bundleStat.appSize) && !isNegativeNum(bundleStat.appSize)).assertTrue();
        expect(isIntNum(bundleStat.cacheSize) && !isNegativeNum(bundleStat.cacheSize)).assertTrue();
        expect(isIntNum(bundleStat.dataSize) && !isNegativeNum(bundleStat.dataSize)).assertTrue();
        done();
      } catch (e) {
        console.log("storage_statistics_test_get_current_bundle_stats_async_000 has failed for " + e);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_CURRENT_BUNDLE_STATS_0010
     * @tc.name storage_statistics_test_get_current_bundle_stats_async_001
     * @tc.desc Test getCurrentBundleStats() interfaces , returned in callback mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_current_bundle_stats_async_001", 0, async function (done) {
      try {
        storageStatistics.getCurrentBundleStats((error, bundleStat) => {
          expect(bundleStat != null).assertTrue();
          expect(isIntNum(bundleStat.appSize) && !isNegativeNum(bundleStat.appSize)).assertTrue();
          expect(isIntNum(bundleStat.cacheSize) && !isNegativeNum(bundleStat.cacheSize)).assertTrue();
          expect(isIntNum(bundleStat.dataSize) && !isNegativeNum(bundleStat.dataSize)).assertTrue();
          done();
        });
      } catch (e) {
        console.log("storage_statistics_test_get_current_bundle_stats_async_001 has failed for " + e);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_CURRENT_BUNDLE_STATS_0020
     * @tc.name storage_statistics_test_get_current_bundle_stats_async_002
     * @tc.desc Test getCurrentBundleStats() interfaces, the parameter packagename is errors, returning error results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_current_bundle_stats_async_002", 0, async function (done) {
      try {
        await storageStatistics.getCurrentBundleStats("1");
        done();
      } catch (error) {
        console.log("storage_statistics_test_get_current_bundle_stats_async_002 has failed for " + error);
        expect(isInclude(error, "The callback shall be a function")).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_CURRENT_BUNDLE_STATS_0030
     * @tc.name storage_statistics_test_get_current_bundle_stats_async_003
     * @tc.desc Test getCurrentBundleStats() interfaces, When the parameter type is wrong, returns the correct result.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_current_bundle_stats_async_003", 0, async function (done) {
      try {
        await storageStatistics.getCurrentBundleStats(1);
        done();
      } catch (error) {
        console.log("storage_statistics_test_get_current_bundle_stats_async_003 has failed for " + error);
        expect(isInclude(error, "The callback shall be a function")).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_CURRENT_BUNDLE_STATS_0040
     * @tc.name storage_statistics_test_get_current_bundle_stats_async_004
     * @tc.desc Test getCurrentBundleStats() interfaces, When there are no parameters, returning error results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_current_bundle_stats_async_004", 0, async function (done) {
      try {
        await storageStatistics.getCurrentBundleStats(true);
        done();
      } catch (error) {
        console.log("storage_statistics_test_get_current_bundle_stats_async_004 has failed for " + error);
        expect(isInclude(error, "The callback shall be a function")).assertTrue();
        done();
      }
    })
  });
}