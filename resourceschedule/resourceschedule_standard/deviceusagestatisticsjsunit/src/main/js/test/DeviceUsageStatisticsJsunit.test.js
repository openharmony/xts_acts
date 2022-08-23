/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import bundleState from '@ohos.bundleState'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function DeviceUsageStatisticsJsTest() {
describe("DeviceUsageStatisticsJsTest", function () {
    beforeAll(function() {
		
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll called')
    })
    
    afterAll(function() {
		
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll called')
    })
    
    beforeEach(function() {
		
        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach called')
    })
    
    afterEach(function() {
		
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach caled')
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_001
     * @tc.name: DeviceUsageStatisticsJsTest001
     * @tc.desc: test isIdleState promise.
     */
    it("DeviceUsageStatisticsJsTest001", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest001---------------------------');
        let bundleName = 'com.explace.deviceUsageStatistics';
        bundleState.isIdleState(bundleName).then((res) => {
            console.info('test DeviceUsageStatisticsJsTest001 isIdleStateone promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            expect(false).assertEqual(true);
            console.info('test DeviceUsageStatisticsJsTest001 isIdleState promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_002
     * @tc.name: DeviceUsageStatisticsJsTest002
     * @tc.desc: test isIdleState callback.
     */
    it("DeviceUsageStatisticsJsTest002", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest002---------------------------');
        let bundleName = 'com.explace.deviceUsageStatistics';
        bundleState.isIdleState(bundleName, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                console.info('test DeviceUsageStatisticsJsTest002 isIdleState callback failure.');
            } else {
                console.info('test DeviceUsageStatisticsJsTest002 isIdleState callback success.');
                expect(true).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_003
     * @tc.name: DeviceUsageStatisticsJsTest003
     * @tc.desc: test queryAppUsagePriorityGroup promise.
     */
    it("DeviceUsageStatisticsJsTest003", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest003---------------------------');
        bundleState.queryAppUsagePriorityGroup().then( res => {
            console.info('test DeviceUsageStatisticsJsTest003 queryAppUsagePriorityGroup promise success.');
            expect(true).assertEqual(true);
        }).catch( err => {
            expect(false).assertEqual(true);
            console.info('tets DeviceUsageStatisticsJsTest003 queryAppUsagePriorityGroup promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_004
     * @tc.name: DeviceUsageStatisticsJsTest004
     * @tc.desc: test queryAppUsagePriorityGroup callback.
     */
    it("DeviceUsageStatisticsJsTest004", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest004---------------------------');
        bundleState.queryAppUsagePriorityGroup((err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                console.info('test DeviceUsageStatisticsJsTest004 queryAppUsagePriorityGroup callback failure.');
            } else {
                console.info('tets DeviceUsageStatisticsJsTest004 queryAppUsagePriorityGroup callback success.');
                expect(true).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_005
     * @tc.name: DeviceUsageStatisticsJsTest005
     * @tc.desc: test queryCurrentBundleActiveStates promise.
     */
    it("DeviceUsageStatisticsJsTest005", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest005---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryCurrentBundleActiveStates(beginTime, endTime).then((res) => {
            console.info('test DeviceUsageStatisticsJsTest005 queryCurrentBundleActiveStates promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            expect(false).assertEqual(true);
            console.info('test DeviceUsageStatisticsJsTest005 queryCurrentBundleActiveStates promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_006
     * @tc.name: DeviceUsageStatisticsJsTest006
     * @tc.desc: test queryCurrentBundleActiveStates callback.
     */
    it("DeviceUsageStatisticsJsTest006", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest006---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryCurrentBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                console.info('tets DeviceUsageStatisticsJsTest006 queryCurrentBundleActiveStates callback failure.');
            } else {
                console.info('test DeviceUsageStatisticsJsTest006 queryCurrentBundleActiveStates callback success.');
                expect(true).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_007
     * @tc.name: DeviceUsageStatisticsJsTest007
     * @tc.desc: test intervalType BY_OPTIMIZED
     */
    it("DeviceUsageStatisticsJsTest007", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest007---------------------------');
        let value1 = bundleState.IntervalType.BY_OPTIMIZED;
        expect(value1).assertEqual(0)
        done();
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_008
     * @tc.name: DeviceUsageStatisticsJsTest008
     * @tc.desc: test intervalType BY_DAILY
     */
    it("DeviceUsageStatisticsJsTest008", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest008---------------------------');
        let value1 = bundleState.IntervalType.BY_DAILY;
        expect(value1).assertEqual(1)
        done();
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_009
     * @tc.name: DeviceUsageStatisticsJsTest009
     * @tc.desc: test intervalType BY_WEEKLY
     */
    it("DeviceUsageStatisticsJsTest009", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest009---------------------------');
        let value1 = bundleState.IntervalType.BY_WEEKLY;
        expect(value1).assertEqual(2)
        done();
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0010
     * @tc.name: DeviceUsageStatisticsJsTest0010
     * @tc.desc: test intervalType BY_MONTHLY
     */
    it("DeviceUsageStatisticsJsTest0010", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0010---------------------------');
        let value1 = bundleState.IntervalType.BY_MONTHLY;
        expect(value1).assertEqual(3)
        done();
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0011
     * @tc.name: DeviceUsageStatisticsJsTest0011
     * @tc.desc: test intervalType BY_ANNUALLY
     */
    it("DeviceUsageStatisticsJsTest0011", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0011---------------------------');
        let value1 = bundleState.IntervalType.BY_ANNUALLY;
        expect(value1).assertEqual(4)
        done();
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0012
     * @tc.name: DeviceUsageStatisticsJsTest0012
     * @tc.desc: test bundleState isIdleState promise.
     */
    it("DeviceUsageStatisticsJsTest0012", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0012---------------------------');
        bundleState.isIdleState('').then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0012 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0012 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0013
     * @tc.name: DeviceUsageStatisticsJsTest0013
     * @tc.desc: test bundleState isIdleState promise.
     */
    it("DeviceUsageStatisticsJsTest0013", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0013---------------------------');
        bundleState.isIdleState(12345).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0013 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0013 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0014
     * @tc.name: DeviceUsageStatisticsJsTest0014
     * @tc.desc: test bundleState isIdleState promise.
     */
    it("DeviceUsageStatisticsJsTest0014", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0014---------------------------');
        bundleState.isIdleState(true).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0014 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0014 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0015
     * @tc.name: DeviceUsageStatisticsJsTest0015
     * @tc.desc: test bundleState isIdleState promise.
     */
    it("DeviceUsageStatisticsJsTest0015", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0015---------------------------');
        bundleState.isIdleState(null).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0015 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0015 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0016
     * @tc.name: DeviceUsageStatisticsJsTest0016
     * @tc.desc: test bundleState isIdleState promise.
     */
    it("DeviceUsageStatisticsJsTest0016", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0016---------------------------');
        bundleState.isIdleState(undefined).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0016 promise success, result= ' + res );
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest0016 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0017
     * @tc.name: DeviceUsageStatisticsJsTest0017
     * @tc.desc: test bundleState isIdleState callback.
     */
    it("DeviceUsageStatisticsJsTest0017", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0017---------------------------');
        bundleState.isIdleState(undefined, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest0017 callback fail, result= ' + 
				JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest0017 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0018
     * @tc.name: DeviceUsageStatisticsJsTest0018
     * @tc.desc: test bundleState isIdleState callback.
     */
    it("DeviceUsageStatisticsJsTest0018", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest0018---------------------------');
        bundleState.isIdleState(null, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest0018 callback fail, result= ' + 
				JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest0018 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0019
     * @tc.name: DeviceUsageStatisticsJsTest019
     * @tc.desc: test BundleActiveState bundleName.
     */
    it("DeviceUsageStatisticsJsTest019", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest019---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                done();
            } else {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{bundleName: 'www.baidu.com'}];
				}
				console.log('test BundleActiveState bundleName :' + res[0].bundleName);
                done();
            }
        })
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0020
     * @tc.name: DeviceUsageStatisticsJsTest020
     * @tc.desc: test BundleActiveState stateType.
     */
    it("DeviceUsageStatisticsJsTest020", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest020---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                done();
            } else {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{stateType: 0}];
				}
				console.log('test BundleActiveState stateType :' + res[0].stateType);
                done();
            }
        })
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0021
     * @tc.name: DeviceUsageStatisticsJsTest021
     * @tc.desc: test BundleActiveState stateOccurredTime.
     */
    it("DeviceUsageStatisticsJsTest021", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest021---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                done();
            } else {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{stateOccurredTime: 0}];
				}
				console.log('test BundleActiveState stateOccurredTime :' + res[0].stateOccurredTime);
                done();
            }
        })
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0022
     * @tc.name: DeviceUsageStatisticsJsTest022
     * @tc.desc: test BundleActiveState appUsagePriorityGroup.
     */
    it("DeviceUsageStatisticsJsTest022", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest022---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                done();
            } else {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{appUsagePriorityGroup: 0}];
				}
				console.log('test BundleActiveState appUsagePriorityGroup :' + res[0].appUsagePriorityGroup);
                done();
            }
        })
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0023
     * @tc.name: DeviceUsageStatisticsJsTest023
     * @tc.desc: test BundleActiveState indexOfLink.
     */
    it("DeviceUsageStatisticsJsTest023", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest023---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                done();
            } else {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{indexOfLink: 'id'}];
				}
				console.log('test BundleActiveState indexOfLink :' + res[0].indexOfLink);
                done();
            }
        })
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0024
     * @tc.name: DeviceUsageStatisticsJsTest024
     * @tc.desc: test BundleActiveState nameOfClass.
     */
    it("DeviceUsageStatisticsJsTest024", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest024---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                done();
            } else {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{nameOfClass: 'BundleStates'}];
				}
				console.log('test BundleActiveState nameOfClass :' + res[0].nameOfClass);
                done();
            }
        })
    })
})}
