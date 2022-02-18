/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {
    isIntNum,
    isNegativeNum,
    describe,
    it,
    expect,
    storageStatistics,
    getPackageName,
} from "./Common";

describe("storageStatistics", function () {
    
    /**
   	 * @tc.number SUB_DF_STORAGE_STATISTICS_GET_BUNDLE_STAT_0000
   	 * @tc.name storage_statistics_test_get_bundle_stat_async_000
   	 * @tc.desc Test getBundleStats() interfaces, returned in promise mode.
   	 * @tc.size MEDIUM
   	 * @tc.type Function
   	 * @tc.level Level 0
   	 * @tc.require
   	 */
    it("storage_statistics_test_get_bundle_stat_async_000", 0, async function (done) {
        try {
            let packageName = await getPackageName();
            let bundleStat = await storageStatistics.getBundleStats("id", packageName);
            expect(bundleStat != null).assertTrue();
            expect(isIntNum(bundleStat.appSize) && !isNegativeNum(bundleStat.appSize)).assertTrue();
            expect(isIntNum(bundleStat.cacheSize) && !isNegativeNum(bundleStat.cacheSize)).assertTrue();
            expect(isIntNum(bundleStat.dataSize) && !isNegativeNum(bundleStat.dataSize)).assertTrue();
            console.log(`promise bundleStat ===---=== ${JSON.stringify(bundleStat)}`);
        } catch (e) {
            console.log("storage_statistics_test_get_bundle_stat_async_000 has failed for " + e);
            expect(null).assertFail();
        }
        done();
    });

    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_BUNDLE_STAT_0010
     * @tc.name storage_statistics_test_get_bundle_stat_async_001
     * @tc.desc Test getBundleStats() interfaces , returned in callback mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_bundle_stat_async_001", 0, async function (done) {
        try {
            let packageName = await getPackageName();
            storageStatistics.getBundleStats("id", packageName, (error, bundleStat) => {
                expect(bundleStat != null).assertTrue();
                expect(isIntNum(bundleStat.appSize) && !isNegativeNum(bundleStat.appSize)).assertTrue();
                expect(isIntNum(bundleStat.cacheSize) && !isNegativeNum(bundleStat.cacheSize)).assertTrue();
                expect(isIntNum(bundleStat.dataSize) && !isNegativeNum(bundleStat.dataSize)).assertTrue();
                console.log(`callback bundleStat ===---=== ${JSON.stringify(bundleStat)}`);
            });
        } catch (e) {
            console.log("storage_statistics_test_get_bundle_stat_async_001 has failed for " + e);
            expect(null).assertFail();
        }
        done();
    });

    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_BUNDLE_STAT_0020
     * @tc.name storage_statistics_test_get_bundle_stat_async_002
     * @tc.desc Test getBundleStats() interfaces, the parameter packagename is errors, returning error results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_bundle_stat_async_002", 0, async function (done) {
        try {
            let bundleStat = await storageStatistics.getBundleStats("id", "packageName");
            expect(bundleStat != null).assertTrue();
            expect(bundleStat.appSize == 0).assertTrue();
            expect(bundleStat.cacheSize == 0).assertTrue();
            expect(bundleStat.dataSize == 0).assertTrue();
            console.log(`async_002 bundleStat ===---=== ${JSON.stringify(bundleStat)}`);
        } catch (e) {
            console.log("storage_statistics_test_get_bundle_stat_async_002 has failed for " + e);
            expect(!!e).assertTrue();
        }
        done();
    });

    /**
     * @tc.number SUB_DF_STORAGE_STATISTICS_GET_BUNDLE_STAT_0030
     * @tc.name storage_statistics_test_get_bundle_stat_async_003
     * @tc.desc Test getBundleStats() interfaces, No parameters, returns the correct result.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_bundle_stat_async_003", 0, async function (done) {
        try {
            let packageName = await getPackageName();
            let bundleStat = await storageStatistics.getBundleStats("", packageName);
            expect(bundleStat != null).assertTrue();
            expect(isIntNum(bundleStat.appSize) && !isNegativeNum(bundleStat.appSize)).assertTrue();
            expect(isIntNum(bundleStat.cacheSize) && !isNegativeNum(bundleStat.cacheSize)).assertTrue();
            expect(isIntNum(bundleStat.dataSize) && !isNegativeNum(bundleStat.dataSize)).assertTrue();
            console.log(`async_003 bundleStat ===---=== ${JSON.stringify(bundleStat)}`);
        } catch (e) {
            console.log("storage_statistics_test_get_bundle_stat_async_003 has failed for " + e);
            expect(!!e).assertTrue();
        }
        done();
    });

    /**
   	 * @tc.number SUB_DF_STORAGE_STATISTICS_GET_BUNDLE_STAT_0040
     * @tc.name storage_statistics_test_get_bundle_stat_async_004
     * @tc.desc Test getBundleStats() interfaces, the parameter packagename does not exist, returning error results.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("storage_statistics_test_get_bundle_stat_async_004", 0, async function (done) {
        try {
            let bundleStat = await storageStatistics.getBundleStats("id", "");
            expect(bundleStat != null).assertTrue();
            expect(bundleStat.appSize == 0).assertTrue();
            expect(bundleStat.cacheSize == 0).assertTrue();
            expect(bundleStat.dataSize == 0).assertTrue();
            console.log(`async_004 bundleStat ===---=== ${JSON.stringify(bundleStat)}`);
        } catch (e) {
            console.log("storage_statistics_test_get_bundle_stat_async_004 has failed for " + e);
            expect(!!e).assertTrue();
        }
        done();
    });
});
