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

import usageStatistics from '@ohos.resourceschedule.usageStatistics'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function UsageStatistics() {
describe("UsageStatistics", function () {
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
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0025
     * @tc.name: UsageStatistics001
     * @tc.desc: test isIdleState promise.
     */
    it("UsageStatistics001", 0, async function (done) {
        console.info('----------------------UsageStatistics001---------------------------');
        let bundleName = 'ohos.acts.resourceschedule.deviceusagestatisticsjsunit.js.function';
        try {
            usageStatistics.isIdleState(bundleName).then((res) => {
                console.info('test UsageStatistics001 isIdleState promise success.' + res);
                expect(res).assertFalse();
                done()
            }).catch((err) => {
                console.info('test UsageStatistics001 isIdleState promise failure.' + err.code);
            });
        } catch (error) {
            console.info('isIdleState throw error, code is: ' + error.code + ',message is: ' + error.message);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0026
     * @tc.name: UsageStatistics002
     * @tc.desc: test isIdleState callback.
     */
    it("UsageStatistics002", 0, async function (done) {
        console.info('----------------------UsageStatistics002---------------------------');
        let bundleName = 'ohos.acts.resourceschedule.deviceusagestatisticsjsunit.js.function';
        try {
            usageStatistics.isIdleState(bundleName, (err, res) => {
                if(err) {
                    console.info('test UsageStatistics002 isIdleState callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics002 isIdleState callback success.' + res);
                    expect(res).assertFalse();
                    done();
                }
            });
        } catch (error) {
            console.info('isIdleState throw error, code is: ' + error.code + ',message is: ' + error.message);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0027
     * @tc.name: UsageStatistics003
     * @tc.desc: test queryAppGroup promise.
     */
    it("UsageStatistics003", 0, async function (done) {
        console.info('----------------------UsageStatistics003---------------------------');
        let bundleName = 'ohos.acts.resourceschedule.deviceusagestatisticsjsunit.js.function';
        try {
            usageStatistics.queryAppGroup(bundleName).then( res => {
                console.info('test UsageStatistics003 queryAppGroup promise success.' + res);
                expect(res).assertEqual(10);
                done();
            }).catch( err => {
                console.info('tets UsageStatistics003 queryAppGroup promise failure.' + err.code);
            });
        } catch (error) {
            console.info('queryAppGroup throw error, code is: ' + error.code + ',message is: ' + error.message);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0028
     * @tc.name: UsageStatistics004
     * @tc.desc: test queryAppGroup callback.
     */
    it("UsageStatistics004", 0, async function (done) {
        console.info('----------------------UsageStatistics004---------------------------');
        let bundleName = 'ohos.acts.resourceschedule.deviceusagestatisticsjsunit.js.function';
        try {
            usageStatistics.queryAppGroup(bundleName, (err, res) => {
                if(err) {
                    console.info('test UsageStatistics004 queryAppGroup callback failure.' + err.code);
                } else {
                    console.info('tets UsageStatistics004 queryAppGroup callback success.' + res);
                    expect(res).assertEqual(10);
                    done();
                }
            });
        } catch (error) {
            console.info('queryAppGroup throw error, code is: ' + error.code + ',message is: ' + error.message);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0029
     * @tc.name: UsageStatistics005
     * @tc.desc: test queryCurrentBundleEvents promise.
     */
    it("UsageStatistics005", 0, async function (done) {
        console.info('----------------------UsageStatistics005---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime).then((res) => {
                console.info('test UsageStatistics005 queryCurrentBundleEvents promise success.' + res);
                expect(res).assertInstanceOf("Array");
                done();
            }).catch((err) => {
                console.info('test UsageStatistics005 queryCurrentBundleEvents promise failure.' + err.code);
            });
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0030
     * @tc.name: UsageStatistics006
     * @tc.desc: test queryCurrentBundleEvents callback.
     */
    it("UsageStatistics006", 0, async function (done) {
        console.info('----------------------UsageStatistics006---------------------------');
        let beginTime = 0;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime, (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics006 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics006 queryCurrentBundleEvents callback success.' + res);
                    expect(res).assertInstanceOf("Array");
                    done();
                }
            });
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0031
     * @tc.name: UsageStatistics007
     * @tc.desc: test BundleEvents bundleName.
     */
    it("UsageStatistics007", 0, async function (done) {
        console.info('----------------------UsageStatistics007---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime, (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics007 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics007 queryCurrentBundleEvents callback success.' + res);
                    expect(res).assertInstanceOf("Array");
                    if(res === undefined) {
                        res = [{bundleName: 'www.baidu.com'}];
                    }
                    console.info('test BundleEvents bundleName :' + res[0].bundleName);
                    done();
                }
            });
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0032
     * @tc.name: UsageStatistics008
     * @tc.desc: test BundleEvents eventId.
     */
    it("UsageStatistics008", 0, async function (done) {
        console.info('----------------------UsageStatistics008---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime, (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics008 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics008 queryCurrentBundleEvents callback success.' + res);
                    expect(res).assertInstanceOf("Array");
                    if(res === undefined) {
                        res = [{eventId: 0}];
                    }
                    console.info('test BundleEvents eventId :' + res[0].eventId);
                    done();
                }
            })
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0033
     * @tc.name: UsageStatistics009
     * @tc.desc: test BundleEvents eventOccurredTime.
     */
    it("UsageStatistics009", 0, async function (done) {
        console.info('----------------------UsageStatistics009---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime, (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics009 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics009 queryCurrentBundleEvents callback success.' + res);
                    expect(res).assertInstanceOf("Array");
                    if(res === undefined) {
                        res = [{eventOccurredTime: 10000000000000}];
                    }
                    console.info('test BundleEvents eventOccurredTime :' + res[0].eventOccurredTime);
                    done();
                }
            })
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0034
     * @tc.name: UsageStatistics0010
     * @tc.desc: test BundleEvents appGroup.
     */
    it("UsageStatistics0010", 0, async function (done) {
        console.info('----------------------UsageStatistics0010---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime, (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics0010 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics0010 queryCurrentBundleEvents callback success.' + res);
                    expect(res).assertInstanceOf("Array");
                    if(res === undefined) {
                        res = [{appGroup: 1}];
                    }
                    console.info('test BundleEvents appGroup :' + res[0].appGroup);
                    done();
                }
            })
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0035
     * @tc.name: UsageStatistics0011
     * @tc.desc: test BundleEvents indexOfLink.
     */
    it("UsageStatistics0011", 0, async function (done) {
        console.info('----------------------UsageStatistics0011---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime, (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics0011 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics0011 queryCurrentBundleEvents callback success.' + res);
                    expect(res).assertInstanceOf("Array");
                    if(res === undefined) {
                        res = [{indexOfLink: 'id'}];
                    }
                    console.info('test BundleEvents indexOfLink :' + res[0].indexOfLink);
                    done();
                }
            })
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0036
     * @tc.name: UsageStatistics0012
     * @tc.desc: test BundleEvents nameOfClass.
     */
    it("UsageStatistics0012", 0, async function (done) {
        console.info('----------------------UsageStatistics0012---------------------------');
        let beginTime = 10;
        let endTime = 20000000000000;
        try {
            usageStatistics.queryCurrentBundleEvents(beginTime, endTime, (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics0012 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics0012 queryCurrentBundleEvents callback success.' + res);
                    expect(res).assertInstanceOf("Array");
                    if(res === undefined) {
                        res = [{nameOfClass: 'BundleEvents'}];
                    }
                    console.info('test BundleEvents nameOfClass :' + res[0].nameOfClass);
                    done();
                }
            })
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0037
     * @tc.name: UsageStatistics0013
     * @tc.desc: test isIdleState promise.
     */
    it("UsageStatistics0013", 0, async function (done) {
        console.info('----------------------UsageStatistics0013---------------------------');
        try {
            usageStatistics.isIdleState(12345).then((res) => {
                console.info('test UsageStatistics0013 isIdleStateone promise success.' + res);
            }).catch((err) => {
                console.info('test UsageStatistics0013 isIdleState promise failure.' + err.code);
            });
        } catch (error) {
            console.info('isIdleState throw error, code is: ' + error.code + ',message is: ' + error.message);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0038
     * @tc.name: UsageStatistics0014
     * @tc.desc: test isIdleState callback.
     */
    it("UsageStatistics0014", 0, async function (done) {
        console.info('----------------------UsageStatistics0014---------------------------');
        try {
            usageStatistics.isIdleState("", (err, res) => {
                if(err) {
                    console.info('test UsageStatistics0014 isIdleState callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics0014 isIdleState callback success.' + res);
                }
            });
        } catch (error) {
            console.info('isIdleState throw error, code is: ' + error.code + ',message is: ' + error.message);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0039
     * @tc.name: UsageStatistics0015
     * @tc.desc: test queryAppGroup promise.
     */
    it("UsageStatistics0015", 0, async function (done) {
        console.info('----------------------UsageStatistics0015---------------------------');
        try {
            usageStatistics.queryAppGroup(123456).then( res => {
                console.info('test UsageStatistics0015 queryAppGroup promise success.'+ res);
            }).catch( err => {
                console.info('tets UsageStatistics0015 queryAppGroup promise failure.' + err.code);
            });
        } catch (error) {
            console.info('queryAppGroup throw error, code is: ' + error.code + ',message is: ' + error.message);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0040
     * @tc.name: UsageStatistics0016
     * @tc.desc: test queryAppGroup callback.
     */
    it("UsageStatistics0016", 0, async function (done) {
        console.info('----------------------UsageStatistics0016---------------------------');
        try {
            usageStatistics.queryAppGroup(null, (err, res) => {
                if(err) {
                    console.info('test UsageStatistics0016 queryAppGroup callback failure.' + err.code);
                } else {
                    console.info('tets UsageStatistics0016 queryAppGroup callback success.' + res);
                }
            });
        } catch (error) {
            console.info('queryAppGroup throw error, code is: ' + error.code + ',message is: ' + error.message);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0041
     * @tc.name: UsageStatistics0017
     * @tc.desc: test queryCurrentBundleEvents promise.
     */
    it("UsageStatistics0017", 0, async function (done) {
        console.info('----------------------UsageStatistics0017---------------------------');
        try {
            usageStatistics.queryCurrentBundleEvents(true, false).then((res) => {
                console.info('test UsageStatistics0017 queryCurrentBundleEvents promise success.' + res);
            }).catch((err) => {
                console.info('test UsageStatistics0017 queryCurrentBundleEvents promise failure.' + err.code);
            });
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_USAGEINFO_QUERY_XTS_0042
     * @tc.name: UsageStatistics0018
     * @tc.desc: test queryCurrentBundleEvents callback.
     */
    it("UsageStatistics0018", 0, async function (done) {
        console.info('----------------------UsageStatistics0018---------------------------');
        try {
            usageStatistics.queryCurrentBundleEvents("", "1235456", (err, res) => {
                if(err) {
                    console.info('tets UsageStatistics0018 queryCurrentBundleEvents callback failure.' + err.code);
                } else {
                    console.info('test UsageStatistics0018 queryCurrentBundleEvents callback success.' + res);
                }
            });
        } catch (error) {
            console.info('queryCurrentBundleEvents throw error, code is: ' + 
            error.code + ',message is: ' + error.message);
            expect(error.code).assertEqual("401");
            done();
        }
    })
})}
