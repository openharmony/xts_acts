/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import bundlestate from '@ohos.bundlestate';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

function onInit() {
	let obj = {startTime: 0,endTime: 0};
	const myTime = new Date().getTime();
	obj.startTime = myTime - 86400000;
	obj.endTime = myTime
	return obj;
}
let bundleName = 'com.example.backgroundTaskManager';
const byInterval = bundlestate.IntervalType.BY_DAILY;
const toMerge = {
	"abilityInFgTotalTime": 0,
	"abilityPrevAccessTime": 1629907200000,
	"abilityPrevSeenTime": 0,
	"abilitySeenTotalTime": 0,
	"bundleName": "com.example.backgroundTaskManager",
	"fgAbilityAccessTotalTime": 0,
	"fgAbilityPrevAccessTime": 0,
	"id": 0,
	"infosBeginTime": 1629907200000,
	"infosEndTime": 1629993599999
}
describe('bundlestate', function() {
	console.info('Start test tvmw bundlestate######################');
	beforeAll(function() {
		console.info('beforeAll')
	})
	
	afterAll(function() {
		console.info('afterAll begin')
	})
	
	beforeEach(function() {
		console.info('beforeEach caled')
	})
	
	afterEach(function() {
		console.info('afterEach caled')
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0001
     * @tc.name: queryAppUsagePriorityGroup_001.
     * @tc.desc: Execute queryAppUsagePriorityGroup with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryAppUsagePriorityGroup_001', 0, async function(done) {
		console.info('queryAppUsagePriorityGroup_001 start');
		bundlestate.queryAppUsagePriorityGroup((err, data) => {
			if(err) {
				console.info('queryAppUsagePriorityGroup_001 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryAppUsagePriorityGroup_001 callback success result = ' + JSON.stringify(data));
				expect(true).assertEqual(true)
			}
			done();
		});
		console.info('queryAppUsagePriorityGroup_001 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0002
     * @tc.name: queryAppUsagePriorityGroup_002.
     * @tc.desc: Execute queryAppUsagePriorityGroup with Promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryAppUsagePriorityGroup_002', 0, async function(done) {
		console.info('queryAppUsagePriorityGroup_002 start');
		bundlestate.queryAppUsagePriorityGroup().then((data) => {
			console.info('queryAppUsagePriorityGroup_002 callback success result = ' + JSON.stringify(data));
			expect(true).assertEqual(true);
			done();
		}).catch((err) => {
			console.info('queryAppUsagePriorityGroup_002 callback fail result = ' + JSON.stringify(err.code));
			expect(err.code).assertLarger(0);
		})
		console.info('queryAppUsagePriorityGroup_002 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0024
     * @tc.name: merge_024.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_024', 0, function(done) {
		console.info('bundle merge_024 start');
		let toMerge02 = {
			"abilityInFgTotalTime": 0,
			"abilityPrevAccessTime": 1629907200000,
			"abilityPrevSeenTime": 0,
			"abilitySeenTotalTime": 0,
			"bundleName": "com.example.backgroundTaskManager",
			"fgAbilityAccessTotalTime": 0,
			"fgAbilityPrevAccessTime": 0,
			"id": 0,
			"infosBeginTime": 1629907200000,
			"infosEndTime": 1629993599999,
		};
		try {
			let ret = bundlestate.BundleStateInfo.merge(toMerge02);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_024 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_024 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0025
     * @tc.name: merge_025.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_025', 0, function(done) {
		console.info('bundle merge_025 start');
		let toMerge03 = {
			"abilityInFgTotalTime": 'text',
			"abilityPrevAccessTime": 'text',
			"abilityPrevSeenTime": 'text',
			"abilitySeenTotalTime": 'text',
			"bundleName": "com.example.backgroundTaskManager",
			"fgAbilityAccessTotalTime": 'text',
			"fgAbilityPrevAccessTime": 'text',
			"id": 'text',
			"infosBeginTime": 'text',
			"infosEndTime": 'text',
		};
		try {
			let ret = bundlestate.BundleStateInfo.merge(toMerge03);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_025 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_025 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_0026
     * @tc.name: merge_026.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_026', 0, function(done) {
		console.info('bundle merge_026 start');
		try {
			let ret = bundlestate.BundleStateInfo.merge(null);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_026 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_026 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_0027
     * @tc.name: merge_027.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_027', 0, function(done) {
		console.info('bundle merge_027 start');
		try {
			let ret = bundlestate.BundleStateInfo.merge(true);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_027 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_027 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_0028
     * @tc.name: merge_028.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_028', 0, function(done) {
		console.info('bundle merge_028 start');
		try {
			let ret = bundlestate.BundleStateInfo.merge(123);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_028 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_028 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0041
     * @tc.name: queryCurrentBundleActiveStates_041.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_041', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_041 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates(timer.startTime, timer.endTime, (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_041 callback fail result = ' + err);
				expect(data).assertFail();
			} else {
				console.info('queryCurrentBundleActiveStates_041 callback success result = ' + JSON.stringify(data));
				expect(data).assertInstanceOf('Array');
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_041 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0042
     * @tc.name: queryCurrentBundleActiveStates_042.
     * @tc.desc: Execute queryCurrentBundleActiveStates with promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_042', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_042 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates(timer.startTime, timer.endTime).then((data) => {
			console.info('queryCurrentBundleActiveStates_042 promise success result = ' + JSON.stringify(data));
			expect(data).assertInstanceOf('Array');
		}).catch((err) => {
			console.info('queryCurrentBundleActiveStates_042 promise fail result = ' + err.code);
			expect(data).assertFail();
		})
		done();
		console.info('queryCurrentBundleActiveStates_042 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0043
     * @tc.name: queryCurrentBundleActiveStates_043.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_043', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_043 start');
		bundlestate.queryCurrentBundleActiveStates(true, false, (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_043 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_043 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_043 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0044
     * @tc.name: queryCurrentBundleActiveStates_044.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_044', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_044 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates(timer.startTime, '', (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_044 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_044 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_044 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0045
     * @tc.name: queryCurrentBundleActiveStates_045.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_045', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_045 start');
		bundlestate.queryCurrentBundleActiveStates(true, -1, (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_045 callback fail result = ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_045 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_045 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0046
     * @tc.name: queryCurrentBundleActiveStates_046.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_046', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_046 start');
		bundlestate.queryCurrentBundleActiveStates(10001, 'timer.endTime', (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_046 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_046 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_046 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0047
     * @tc.name: queryCurrentBundleActiveStates_047.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_047', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_047 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates(timer.startTime, timer.startTime, (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_047 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_047 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_047 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0048
     * @tc.name: queryCurrentBundleActiveStates_048.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_048', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_048 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates(timer.endTime, timer.startTime, (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_048 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_048 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_048 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0049
     * @tc.name: queryCurrentBundleActiveStates_049.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_049', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_049 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates(3.145, timer.startTime, (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_049 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_049 callback success result = ' + JSON.stringify(data));
				expect(data).assertInstanceOf('Array');
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_049 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0050
     * @tc.name: queryCurrentBundleActiveStates_050.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_050', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_050 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates('', '', (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_050 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_050 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_050 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0051
     * @tc.name: queryCurrentBundleActiveStates_051.
     * @tc.desc: Execute queryCurrentBundleActiveStates with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('queryCurrentBundleActiveStates_051', 0, async function(done) {
		console.info('queryCurrentBundleActiveStates_051 start');
		let timer = onInit();
		bundlestate.queryCurrentBundleActiveStates(null, null, (err, data) => {
			if(err) {
				console.info('queryCurrentBundleActiveStates_051 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('queryCurrentBundleActiveStates_051 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('queryCurrentBundleActiveStates_051 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0052
     * @tc.name: isIdleState_052.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_052', 0, async function(done) {
		console.info('isIdleState_052 start');
		bundlestate.isIdleState(bundleName, (err, res) => {
			if(err) {
				console.info('isIdleState_052 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_052 callback success result = ' + JSON.stringify(res));
				expect(res).assertTrue();
			}
			done();
		});
		console.info('isIdleState_052 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0053
     * @tc.name: isIdleState_053.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_053', 0, async function(done) {
		console.info('isIdleState_053 start');
		let bundleName02 = 'ohos.plrdtest.resourceschedule'
		bundlestate.isIdleState(bundleName02, (err, res) => {
			if(err) {
				console.info('isIdleState_053 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_053 callback success result = ' + JSON.stringify(res));
				expect(res).assertInstanceOf('Boolean');
			}
			done();
		});
		console.info('isIdleState_053 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0054
     * @tc.name: isIdleState_054.
     * @tc.desc: Execute isIdleState with promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_054', 0, async function(done) {
		console.info('isIdleState_054 start');
		bundlestate.isIdleState(bundleName).then((data) => {
			console.info('isIdleState_054 promise success result = ' + JSON.stringify(data));
			expect(data).assertTrue();
			done();
		}).catch((err) => {
			console.info('isIdleState_054 promise fail result = ' + JSON.stringify(err.code));
			expect(err.code).assertLarger(0);
			done();
		})
		console.info('isIdleState_054 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0055
     * @tc.name: isIdleState_055.
     * @tc.desc: Execute isIdleState with promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_055', 0, async function(done) {
		console.info('isIdleState_055 start');
		let bundleName31 = 'ohos.plrdtest.resourceschedule'
		bundlestate.isIdleState(bundleName31).then((res) => {
			console.info('isIdleState_055 promise success result = ' + res);
			expect(res).assertFalse();
		}).catch((err) => {
			console.info('isIdleState_055 promise fail result = ' + JSON.stringify(err));
			expect(err.code).assertLarger(0);
		})
		done();
		console.info('isIdleState_055 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0056
     * @tc.name: isIdleState_056.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_056', 0, async function(done) {
		console.info('isIdleState_056 start');
		bundlestate.isIdleState(123, (err, data) => {
			if(err) {
				console.info('isIdleState_056 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_056 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_056 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0057
     * @tc.name: isIdleState_057.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_057', 0, async function(done) {
		console.info('isIdleState_057 start');
		bundlestate.isIdleState(null, (err, data) => {
			if(err) {
				console.info('isIdleState_057 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_057 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_057 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0058
     * @tc.name: isIdleState_058.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_058', 0, async function(done) {
		console.info('isIdleState_058 start');
		bundlestate.isIdleState(true, (err, data) => {
			if(err) {
				console.info('isIdleState_058 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_058 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_058 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0059
     * @tc.name: isIdleState_059.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_059', 0, async function(done) {
		console.info('isIdleState_059 start');
		bundlestate.isIdleState(false, (err, data) => {
			if(err) {
				console.info('isIdleState_059 callback fail result = ' + JSON.stringify(err));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_059 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_059 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0060
     * @tc.name: isIdleState_060.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_060', 0, async function(done) {
		console.info('isIdleState_060 start');
		bundlestate.isIdleState('', (err, data) => {
			if(err) {
				console.info('isIdleState_060 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_060 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_060 end');
	})
})