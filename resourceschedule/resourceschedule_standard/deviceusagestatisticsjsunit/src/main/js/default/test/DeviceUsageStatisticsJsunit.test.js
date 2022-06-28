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
            console.info('BUNDLE_ACTIVE isIdleState promise success.');
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
            if(err.code === 0) {
                console.info('BUNDLE_ACTIVE isIdleState callback success.');
                expect(true).assertEqual(true);
            } else {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE isIdleState callback failure.');
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
            expect(true).assertEqual(true)
        }).catch( err => {
            expect(false).assertEqual(true)
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
            if(err.code === 0) {
                console.info('BUNDLE_ACTIVE queryAppUsagePriorityGroup callback success.');
                expect(true).assertEqual(true)
            } else {
                expect(false).assertEqual(true)
                console.info('BUNDLE_ACTIVE queryAppUsagePriorityGroup callback failure.');
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest005
     * @tc.desc: test queryBundleActiveStates promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest005", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest005---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime).then((res) => {
            console.info('BUNDLE_ACTIVE queryBundleActiveStates promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            expect(false).assertEqual(true);
            console.info('BUNDLE_ACTIVE queryBundleActiveStates promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest006
     * @tc.desc: test queryBundleActiveStates callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest006", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest006---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                console.info('BUNDLE_ACTIVE queryBundleActiveStates callback success.');
                expect(true).assertEqual(true);
            } else {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE queryBundleActiveStates callback failure.');
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest007
     * @tc.desc: test queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest007", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest007---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfos(beginTime, endTime).then((res) => {
            console.info('BUNDLE_ACTIVE queryBundleStateInfos promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            expect(false).assertEqual(true);
            console.info('BUNDLE_ACTIVE queryBundleStateInfos promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest008
     * @tc.desc: test queryBundleStateInfos callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest008", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest008---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfos(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                console.info('BUNDLE_ACTIVE queryBundleStateInfos callback success.');
                expect(true).assertEqual(true);
            } else {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE queryBundleStateInfos callback failure.');
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
            if(err.code === 0) {
                console.info('BUNDLE_ACTIVE queryCurrentBundleActiveStates callback success.');
                expect(true).assertEqual(true);
            } else {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE queryCurrentBundleActiveStates callback failure.');
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest011
     * @tc.desc: test queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest011", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest011---------------------------');
        let intervalType = 0;
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime).then((res) => {
            console.info('BUNDLE_ACTIVE queryBundleStateInfoByInterval promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            expect(false).assertEqual(true);
            console.info('BUNDLE_ACTIVE queryBundleStateInfoByInterval promise failure.');
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest012
     * @tc.desc: test queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest012", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest012---------------------------');
        let intervalType = 0;
        let beginTime = 0;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                console.info('BUNDLE_ACTIVE queryBundleStateInfoByInterval callback success.');
                expect(true).assertEqual(true);
            } else {
                expect(false).assertEqual(true);
                console.info('BUNDLE_ACTIVE queryBundleStateInfoByInterval callback failure.');
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
     * @tc.name: DeviceUsageStatisticsJsTest018
     * @tc.desc: test BundleStateInfo id.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest018", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest018---------------------------');
        let intervalType = 1;
        let beginTime = 1000;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{id: 1}];
				}
				console.log('test BundleStateInfo id :' + res[0].id)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest019
     * @tc.desc: test BundleStateInfo bundleName.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest019", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest019---------------------------');
        let intervalType = 1;
        let beginTime = 100;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{bundleName: 'www.explace.com'}];
				}
				console.log('test BundleStateInfo bundleName :' + res[0].bundleName)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest020
     * @tc.desc: test BundleStateInfo infosEndTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest020", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest020---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{infosEndTime: 0}];
				}
				console.log('test BundleStateInfo infosEndTime :' + res[0].infosEndTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest021
     * @tc.desc: test BundleStateInfo abilityPrevSeenTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest021", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest021---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{abilityPrevSeenTime: 0}];
				}
				console.log('test BundleStateInfo abilityPrevSeenTime :' + res[0].abilityPrevSeenTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest022
     * @tc.desc: test BundleStateInfo abilitySeenTotalTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest022", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest022---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{abilitySeenTotalTime: 0}];
				}
				console.log('test BundleStateInfo abilitySeenTotalTime :' + res[0].abilitySeenTotalTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest023
     * @tc.desc: test BundleStateInfo fgAbilityAccessTotalTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest023", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest023---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{fgAbilityAccessTotalTime: 0}];
				}
				console.log('test BundleStateInfo fgAbilityAccessTotalTime :' + res[0].fgAbilityAccessTotalTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest024
     * @tc.desc: test BundleStateInfo fgAbilityPrevAccessTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest024", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest024---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{fgAbilityPrevAccessTime: 0}];
				}
				console.log('test BundleStateInfo fgAbilityPrevAccessTime :' + res[0].fgAbilityPrevAccessTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest025
     * @tc.desc: test BundleStateInfo abilityPrevAccessTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest025", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest025---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{abilityPrevAccessTime: 0}];
				}
				console.log('test BundleStateInfo abilityPrevAccessTime :' + res[0].abilityPrevAccessTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest026
     * @tc.desc: test BundleStateInfo infosBeginTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest026", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest026---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{infosBeginTime: 0}];
				}
				console.log('test BundleStateInfo infosBeginTime :' + res[0].infosBeginTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest027
     * @tc.desc: test BundleStateInfo abilityInFgTotalTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest027", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest027---------------------------');
        let intervalType = 1;
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(intervalType, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{abilityInFgTotalTime: 0}];
				}
				console.log('test BundleStateInfo abilityInFgTotalTime :' + res[0].abilityInFgTotalTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest028
     * @tc.desc: test BundleActiveState bundleName.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest028", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest028---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{bundleName: 'www.baidu.com'}];
				}
				console.log('test BundleActiveState bundleName :' + res[0].bundleName)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest029
     * @tc.desc: test BundleActiveState stateType.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest029", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest029---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{stateType: 0}];
				}
				console.log('test BundleActiveState stateType :' + res[0].stateType)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest030
     * @tc.desc: test BundleActiveState stateOccurredTime.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest030", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest030---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{stateOccurredTime: 0}];
				}
				console.log('test BundleActiveState stateOccurredTime :' + res[0].stateOccurredTime)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest031
     * @tc.desc: test BundleActiveState appUsagePriorityGroup.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest031", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest031---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{appUsagePriorityGroup: 0}];
				}
				console.log('test BundleActiveState appUsagePriorityGroup :' + res[0].appUsagePriorityGroup)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest032
     * @tc.desc: test BundleActiveState indexOfLink.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest032", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest032---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{indexOfLink: 'id'}];
				}
				console.log('test BundleActiveState indexOfLink :' + res[0].indexOfLink)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest033
     * @tc.desc: test BundleActiveState nameOfClass.
     * @tc.type: FUNC
     * @tc.require: 
     */
    it("DeviceUsageStatisticsJsTest033", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest033---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleActiveStates(beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					res = [{nameOfClass: 'BundleStates'}];
				}
				console.log('test BundleActiveState nameOfClass :' + res[0].nameOfClass)
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest034
     * @tc.desc: test BundleActiveinfoResponse BundleStateinfo key.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest034", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest034---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfos(beginTime, endTime).then((res) => {
            expect(true).assertEqual(true);
			let bundleStateInfo1 = {
				bundleName: 'www.explace.com',
				abilityPrevAccessTime: 0,
				abilityInFgTotalTime: 0
			};
			let bundleStateInfo2 = {
				bundleName: 'www.baidu.com',
				abilityPrevAccessTime: 1,
				abilityInFgTotalTime: 1
			};
			if(res === undefined) {
				res = [];
				res['www.explace.com'] = bundleStateInfo1;
				res['www.baidu.com'] = bundleStateInfo2;
				for(let k in res) {
					console.log('test BundleStateInfo key :' + k + ',value is :' + JSON.stringify(res[k]));
				}
			}
        }).catch((err) => {
            expect(false).assertEqual(true);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest035
     * @tc.desc: test BundleStateInfo merge.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest035", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest035---------------------------');
        let beginTime = 1001;
        let endTime = 20000000000000;
        bundleState.queryBundleStateInfoByInterval(0, beginTime, endTime, (err, res) => {
            if(err.code === 0) {
                expect(true).assertEqual(true);
				if(res === undefined) {
					let bundleStateInfo = {
						bundleName: 'www.explace.com',
						abilityPrevAccessTime: 0,
						abilityInFgTotalTime: 0
					};
					res = [{
						bundleName: 'www.explace.com',
						abilityPrevAccessTime: 0,
						abilityInFgTotalTime: 0,
						merge : function (toMerge) {
							return 'is function,toMerge :' + JSON.stringify(toMerge);
						}
					}]
					console.log('test bundleStateInfo merge' + res[0].merge(bundleStateInfo));
				} else {
					console.log('test bundleStateInfo merge')
				}
            } else {
                expect(false).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest036
     * @tc.desc: test getRecentlyUsedModules callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest036", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest036---------------------------');
        let maxNum = 1;
        bundleState.getRecentlyUsedModules(maxNum, (err, res) => {
            if (err) {
                console.info('BUNDLE_ACTIVE getRecentlyUsedModules callback failure.');
                expect(false).assertEqual(true);
            } else {
                console.info('BUNDLE_ACTIVE getRecentlyUsedModules callback success.');
                expect(true).assertEqual(true);
            }
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.name: DeviceUsageStatisticsJsTest037
     * @tc.desc: test getRecentlyUsedModules promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest037", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest037---------------------------');
        let maxNum = 1;
        bundleState.getRecentlyUsedModules(maxNum).then((res) => {
            console.info('BUNDLE_ACTIVE getRecentlyUsedModules promise success.');
            expect(true).assertEqual(true);
        }).catch((err) => {
            console.info('BUNDLE_ACTIVE getRecentlyUsedModules promise failure.');
            expect(false).assertEqual(true);
        });

        setTimeout(()=>{
            done();
        }, 500);
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
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest045
     * @tc.desc: test bundleState queryBundleStateInfos callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest045", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest045---------------------------');
        bundleState.queryBundleStateInfos(20000000000000, 123456, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest045 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest045 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest046
     * @tc.desc: test bundleState queryBundleStateInfos callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest046", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest046---------------------------');
        bundleState.queryBundleStateInfos('', '', (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest046 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest046 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest047
     * @tc.desc: test bundleState queryBundleStateInfos callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest047", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest047---------------------------');
        bundleState.queryBundleStateInfos(null, true, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest047 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest047 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest048
     * @tc.desc: test bundleState queryBundleStateInfos callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest048", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest048---------------------------');
        bundleState.queryBundleStateInfos(0, undefined, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest048 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest048 callback success, result= ' + res );
				expect(res).assertFail();
			}
		});
		
        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest049
     * @tc.desc: test bundleState queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest049", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest049---------------------------');
        bundleState.queryBundleStateInfos(undefined, undefined).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest049 promise success, result= ' + res );
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest049 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest050
     * @tc.desc: test bundleState queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest050", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest050---------------------------');
        bundleState.queryBundleStateInfos(null, 20000000000000).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest050 promise success, result= ' + res );
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest050 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest051
     * @tc.desc: test bundleState queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest051", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest051---------------------------');
        bundleState.queryBundleStateInfos(20000000000000, true).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest051 promise success, result= ' + res );
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest051 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest052
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest052", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest052---------------------------');
        bundleState.queryBundleStateInfoByInterval(1, 123, 20000000000000).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest052 promise success');
			for (let i=0; i<res.length; i++) {
				console.info('test bundle DeviceUsageStatisticsJsTest052 promise success, result ' + 
				JSON.stringify(res[i]));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest052 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest053
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest053", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest053---------------------------');
        bundleState.queryBundleStateInfoByInterval(2, 123, 20000000000000).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest053 promise success');
			for (let i=0; i<res.length; i++) {
				console.info('test bundle DeviceUsageStatisticsJsTest053 promise success, result ' + 
				JSON.stringify(res[i]));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest053 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest054
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest054", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest054---------------------------');
        bundleState.queryBundleStateInfoByInterval(3, 123, 20000000000000).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest054 promise success');
			for (let i=0; i<res.length; i++) {
				console.info('test bundle DeviceUsageStatisticsJsTest054 promise success, result ' + 
				JSON.stringify(res[i]));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest054 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest055
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest055", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest055---------------------------');
        bundleState.queryBundleStateInfoByInterval(4, 123, 20000000000000).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest055 promise success');
			for (let i=0; i<res.length; i++) {
				console.info('test bundle DeviceUsageStatisticsJsTest055 promise success, result ' + 
				JSON.stringify(res[i]));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest055 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest056
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest056", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest056---------------------------');
        bundleState.queryBundleStateInfoByInterval(4, null, 20000000000000).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest056 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest056 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest057
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest057", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest057---------------------------');
        bundleState.queryBundleStateInfoByInterval('', null, true).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest057 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest057 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest058
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest058", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest058---------------------------');
        bundleState.queryBundleStateInfoByInterval(3, 1234567, true).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest058 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest058 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest059
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest059", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest059---------------------------');
        bundleState.queryBundleStateInfoByInterval(6, 123678, 20000000600000).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest059 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest059 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest060
     * @tc.desc: test bundleState queryBundleStateInfoByInterval promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest060", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest060---------------------------');
        bundleState.queryBundleStateInfoByInterval(6, 123678, undefined).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest060 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest060 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest061
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest061", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest061---------------------------');
        bundleState.queryBundleStateInfoByInterval(3, 123678, 20000000000000, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest061 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest061 callback success');
				expect(res).assertInstanceOf('Array');
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest062
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest062", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest062---------------------------');
        bundleState.queryBundleStateInfoByInterval(5, 123678, 20000000000000, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest062 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest062 callback success');
				expect(res).assertInstanceOf('Array');
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest063
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest063", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest063---------------------------');
        bundleState.queryBundleStateInfoByInterval(9, 123678, 20000000000000, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest063 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest063 callback success');
				expect(res).assertFail();
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest064
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest064", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest064---------------------------');
        bundleState.queryBundleStateInfoByInterval(2, 123678, null, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest064 callback failed, because: ' + err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest064 callback success');
				expect(res).assertFail();
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest065
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest065", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest065---------------------------');
        bundleState.queryBundleStateInfoByInterval(4, true, 20000000000000, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest065 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest065 callback success');
				expect(res).assertFail();
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest066
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest066", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest066---------------------------');
        bundleState.queryBundleStateInfoByInterval(7, 0, 20000000000000, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest066 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest066 callback success');
				expect(res).assertFail();
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest067
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest067", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest067---------------------------');
        bundleState.queryBundleStateInfoByInterval(20000000000000, 12345, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest067 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest067 callback success');
				expect(res).assertFail();
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest068
     * @tc.desc: test bundleState queryBundleStateInfoByInterval callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest068", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest068---------------------------');
        bundleState.queryBundleStateInfoByInterval(null, 20000000000000, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest068 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest068 callback success');
				expect(res).assertFail();
			} 
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest069
     * @tc.desc: test bundleState queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest069", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest069---------------------------');
        bundleState.queryBundleStateInfos(null, true).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest069 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest069 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest070
     * @tc.desc: test bundleState queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest070", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest070---------------------------');
        bundleState.queryBundleStateInfos(12345, undefined).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest070 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest070 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest071
     * @tc.desc: test bundleState queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest071", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest071---------------------------');
        bundleState.queryBundleStateInfos('12345', 'undefined').then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest071 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest071 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest072
     * @tc.desc: test bundleState queryBundleStateInfos promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest072", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest072---------------------------');
        bundleState.queryBundleStateInfos('', '').then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest072 promise success');
            expect(res).assertFail();
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest072 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest073
     * @tc.desc: test bundleState getRecentlyUsedModules param promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest073", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest073---------------------------');
        bundleState.getRecentlyUsedModules(999).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest073 promise success');
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest073 promise failed, because: ' + err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest074
     * @tc.desc: test bundleState getRecentlyUsedModules param promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest074", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest074---------------------------');
        bundleState.getRecentlyUsedModules(1).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest074 promise success');
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest074 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest075
     * @tc.desc: test bundleState getRecentlyUsedModules param promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest075", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest075---------------------------');
        bundleState.getRecentlyUsedModules(0).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest075 promise success');
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest075 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest076
     * @tc.desc: test bundleState getRecentlyUsedModules noParam promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest076", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest076---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest076 promise success');
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest076 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest077
     * @tc.desc: test bundleState getRecentlyUsedModules noParam callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest077", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest077---------------------------');
        bundleState.getRecentlyUsedModules( (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest077 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest077 promise success');
				expect(res).assertInstanceOf('Array');
			}
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest078
     * @tc.desc: test bundleState getRecentlyUsedModules param promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest078", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest078---------------------------');
        bundleState.getRecentlyUsedModules( 10, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest078 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest078 promise success');
				for (let i=0; i<res.length; i++) {
					console.info('test bundle DeviceUsageStatisticsJsTest078 promise success' + 
					JSON.stringify(res[i]));
				}
				expect(res).assertInstanceOf('Array');
			}
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest079
     * @tc.desc: test bundleState getRecentlyUsedModules param callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest079", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest079---------------------------');
        bundleState.getRecentlyUsedModules( 10000, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest079 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest079 promise success' + 
				JSON.stringify(res));
				expect(res).assertInstanceOf('Array');
			}
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest080
     * @tc.desc: test bundleState getRecentlyUsedModules param callback.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest080", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest080---------------------------');
        bundleState.getRecentlyUsedModules( -1, (err, res) => {
			if(err) {
				console.info('test bundle DeviceUsageStatisticsJsTest080 callback failed, because: ' + 
				err.code);
				expect(err.code).assertLarger(0);
			} else {
				console.info('test bundle DeviceUsageStatisticsJsTest080 promise success' + 
				JSON.stringify(res));
				expect(res).assertFail();
			}
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest081
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo deviceId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest081", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest081---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest081 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE DeviceUsageStatisticsJsTest081 BundleActiveModuleInfo deviceId' + 
				JSON.stringify(res[i].deviceId));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest081 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest082
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo descriptionId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest082", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest082---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest082 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE DeviceUsageStatisticsJsTest082 BundleActiveModuleInfo descriptionId' + 
				JSON.stringify(res[i].descriptionId));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest082 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest083
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo moduleName promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest083", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest083---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest083 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE DeviceUsageStatisticsJsTest083 BundleActiveModuleInfo moduleName' + 
				JSON.stringify(res[i].moduleName));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest083 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest084
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo labelId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest084", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest084---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest084 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE DeviceUsageStatisticsJsTest084 BundleActiveModuleInfo labelId' + 
				JSON.stringify(res[i].labelId));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest084 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest085
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo appLabelId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest085", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest085---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest085 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE DeviceUsageStatisticsJsTest085 BundleActiveModuleInfo appLabelId' + 
				JSON.stringify(res[i].appLabelId));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest085 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest086
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo abilityLableId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest086", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest086---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest086 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE BundleActiveModuleInfo abilityLableId' + 
				JSON.stringify(res[i].abilityLableId));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest086 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest087
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo abilityDescriptionId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest087", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest087---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest087 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE BundleActiveModuleInfo abilityDescriptionId' + 
				JSON.stringify(res[i].abilityDescriptionId));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest087 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest088
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo abilityIconId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest088", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest088---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest088 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE BundleActiveModuleInfo abilityIconId' + 
				JSON.stringify(res[i].abilityIconId));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest088 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest089
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo launchedCount promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest089", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest089---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest089 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE BundleActiveModuleInfo launchedCount' + 
				JSON.stringify(res[i].launchedCount));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest089 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest090
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo lastModuleUsedTime promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest090", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest090---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest090 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE BundleActiveModuleInfo lastModuleUsedTime' + 
				JSON.stringify(res[i].lastModuleUsedTime));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest090 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest091
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveModuleInfo formRecords promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest091", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest091---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest091 promise success');
			for(let i=0; i<res.length; i++) {
				console.info('BUNDLE_ACTIVE BundleActiveModuleInfo formRecords' + 
				JSON.stringify(res[i].formRecords));
			}
            expect(res).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest091 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest092
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveFormInfo promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest092", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest092---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest092 promise success');
			let BundleActiveFormInfo = res[0].formRecords;
			console.info('test bundle DeviceUsageStatisticsJsTest092 promise BundleActiveFormInfo: ' + 
			JSON.stringify(BundleActiveFormInfo));
            expect(BundleActiveFormInfo).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest092 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest093
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveFormInfo formName promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest093", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest093---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest093 promise success');
			let BundleActiveFormInfo = res[0].formRecords;
			expect(BundleActiveFormInfo).assertInstanceOf('Array');
			console.info('test DeviceUsageStatisticsJsTest093 length: ' + BundleActiveFormInfo.length);
            if(BundleActiveFormInfo.length === 0) {
				BundleActiveFormInfo = [{ formName: 'formName'}];
			} 
			console.info('test bundle DeviceUsageStatisticsJsTest093 promise BundleActiveFormInfo formName: ' + 
			BundleActiveFormInfo[0].formName);
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest093 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest094
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveFormInfo formDimension promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest094", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest094---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest094 promise success');
			let BundleActiveFormInfo = res[0].formRecords;
            if(BundleActiveFormInfo.length === 0) {
				BundleActiveFormInfo = [{ formDimension: 'formDimension'}];
			} 
			console.info('test bundle promise BundleActiveFormInfo formDimension: ' + 
			BundleActiveFormInfo[0].formDimension);
			expect(BundleActiveFormInfo).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest094 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest095
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveFormInfo formId promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest095", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest095---------------------------');
        bundleState.getRecentlyUsedModules(10).then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest095 promise success');
			let BundleActiveFormInfo = res[0].formRecords;
            if(BundleActiveFormInfo.length === 0) {
				BundleActiveFormInfo = [{ formId: 'formId'}];
			} 
			console.info('test bundle promise BundleActiveFormInfo formId: ' + 
			BundleActiveFormInfo[0].formId);
			expect(BundleActiveFormInfo).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest095 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest096
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveFormInfo count promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest096", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest096---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest096 promise success');
			let BundleActiveFormInfo = res[0].formRecords;
            if(BundleActiveFormInfo.length === 0) {
				BundleActiveFormInfo = [{ count: 'count'}];
			} 
			console.info('test bundle promise BundleActiveFormInfo count: ' + 
			BundleActiveFormInfo[0].count);
			expect(BundleActiveFormInfo).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest096 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
	
	/*
     * @tc.name: DeviceUsageStatisticsJsTest097
     * @tc.desc: test bundleState getRecentlyUsedModules BundleActiveFormInfo formLastUsedTime promise.
     * @tc.type: FUNC
     * @tc.require:
     */
    it("DeviceUsageStatisticsJsTest097", 0, async function (done) {
        console.info('----------------------DeviceUsageStatisticsJsTest097---------------------------');
        bundleState.getRecentlyUsedModules().then((res) => {
            console.info('test bundle DeviceUsageStatisticsJsTest097 promise success');
			let BundleActiveFormInfo = res[0].formRecords;
            if(BundleActiveFormInfo.length === 0) {
				BundleActiveFormInfo = [{ formLastUsedTime: 'formLastUsedTime'}];
			} 
			console.info('test bundle promise BundleActiveFormInfo formLastUsedTime: ' + 
			BundleActiveFormInfo[0].formLastUsedTime);
			expect(BundleActiveFormInfo).assertInstanceOf('Array');
        }).catch((err) => {
            console.info('test bundle DeviceUsageStatisticsJsTest097 promise failed, because: ' + 
			err.code);
            expect(err.code).assertLarger(0);
        });

        setTimeout(()=>{
            done();
        }, 500);
    })
})