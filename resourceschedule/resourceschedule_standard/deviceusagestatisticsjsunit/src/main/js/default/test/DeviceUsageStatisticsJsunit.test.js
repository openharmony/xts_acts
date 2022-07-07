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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

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
     * @tc.name: DeviceUsageStatisticsJsTest001
     * @tc.desc: test isIdleState promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest001", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest001---------------------------');
        let bundleName = 'com.explace.deviceUsageStatistics';
        bundleState.isIdleState(bundleName).then((res) => {
            console.info('BUNDLE_ACTIVE isIdleStateone promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            expect(false).assertEqual(true);
            console.info('BUNDLE_ACTIVE isIdleState promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest002
     * @tc.desc: test isIdleState callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest002", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest002---------------------------');
        let bundleName = 'com.explace.deviceUsageStatistics';
        bundleState.isIdleState(bundleName, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE isIdleState callback failure.');
            } else {
                console.info('BUNDLE_ACTIVE isIdleState callback success.');
                expect(true).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest003
     * @tc.desc: test queryAppUsagePriorityGroup promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest003", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest003---------------------------');
        bundleState.queryAppUsagePriorityGroup().then( res => {
            console.info('BUNDLE_ACTIVE queryAppUsagePriorityGroup promise success.');
            expect(true).assertEqual(true);
        }).catch( err => {
            expect(false).assertEqual(true);
            console.info('BUNDLE_ACTIVE queryAppUsagePriorityGroup promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest004
     * @tc.desc: test queryAppUsagePriorityGroup callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest004", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest004---------------------------');
        bundleState.queryAppUsagePriorityGroup((err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE queryAppUsagePriorityGroup callback failure.');
            } else {
                console.info('BUNDLE_ACTIVE queryAppUsagePriorityGroup callback success.');
                expect(true).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest009
     * @tc.desc: test queryCurrentBundleActiveStates promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest009", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest009---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryCurrentBundleActiveStates(beginTime, endTime).then((res) => {
            console.info('BUNDLE_ACTIVE queryCurrentBundleActiveStates promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            expect(false).assertEqual(true);
            console.info('BUNDLE_ACTIVE queryCurrentBundleActiveStates promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest010
     * @tc.desc: test queryCurrentBundleActiveStates callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest010", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest010---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryCurrentBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err) {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE queryCurrentBundleActiveStates callback failure.');
            } else {
                console.info('BUNDLE_ACTIVE queryCurrentBundleActiveStates callback success.');
                expect(true).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

	/*
     * @tc.name: DeviceUsageStatisticsJsTest013
     * @tc.desc: test intervalType BY_OPTIMIZED
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest013", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest013---------------------------');
        let value1 = bundleState.IntervalType.BY_OPTIMIZED;
        expect(value1).assertEqual(0)
        done();
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest014
     * @tc.desc: test intervalType BY_DAILY
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest014", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest014---------------------------');
        let value1 = bundleState.IntervalType.BY_DAILY;
        expect(value1).assertEqual(1)
        done();
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest015
     * @tc.desc: test intervalType BY_WEEKLY
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest015", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest015---------------------------');
        let value1 = bundleState.IntervalType.BY_WEEKLY;
        expect(value1).assertEqual(2)
        done();
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest016
     * @tc.desc: test intervalType BY_MONTHLY
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest016", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest016---------------------------');
        let value1 = bundleState.IntervalType.BY_MONTHLY;
        expect(value1).assertEqual(3)
        done();
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest017
     * @tc.desc: test intervalType BY_ANNUALLY
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest017", 0, function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest017---------------------------');
        let value1 = bundleState.IntervalType.BY_ANNUALLY;
        expect(value1).assertEqual(4)
        done();
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest038
     * @tc.desc: test bundleState isIdleState promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest038", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest038---------------------------');
        bundleState.isIdleState('').then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest038 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest038 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest039
     * @tc.desc: test bundleState isIdleState promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest039", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest039---------------------------');
        bundleState.isIdleState(12345).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest039 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest039 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest040
     * @tc.desc: test bundleState isIdleState promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest040", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest040---------------------------');
        bundleState.isIdleState(true).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest040 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest040 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest041
     * @tc.desc: test bundleState isIdleState promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest041", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest041---------------------------');
        bundleState.isIdleState(null).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest041 promise success, result= ' + res );
            expect(res).assertEqual(false);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest041 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest042
     * @tc.desc: test bundleState isIdleState promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest042", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest042---------------------------');
        bundleState.isIdleState(undefined).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest042 promise success, result= ' + res );
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest042 promise fail, result= ' + 
			JSON.stringify(err.code));
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest043
     * @tc.desc: test bundleState isIdleState callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest043", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest043---------------------------');
        bundleState.isIdleState(undefined, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest043 callback fail, result= ' + 
				JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest043 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest044
     * @tc.desc: test bundleState isIdleState callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest044", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest044---------------------------');
        bundleState.isIdleState(null, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest044 callback fail, result= ' + 
				JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest044 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })
})