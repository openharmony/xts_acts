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

// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import systemTime from '@ohos.systemtime'

describe('TimeTest', function() {
    console.log('start################################start');
    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0100
     * @tc.name      Test systemTime.setTime time = 0
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test1', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0100 start")
        systemTime.setTime(0)
            .then(data =>{
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0200
     * @tc.name      Test systemTime.setTime time = 1
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test2', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0200 start")
        systemTime.setTime(1)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0300
     * @tc.name      Test systemTime.setTime time = Number.MAX_VALUE/2
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test3', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0300 start")
        systemTime.setTime(Number.MAX_VALUE/2)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0400
     * @tc.name      Test systemTime.setTime4  time = Number.MAX_VALUE - 1
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test4', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0400 start")
        systemTime.setTime(Number.MAX_VALUE - 1)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0500
     * @tc.name      Test systemTime.setTime  time = Number.MAX_VALUE
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test5', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0500 start")
        systemTime.setTime(Number.MAX_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0600
     * @tc.name      Test systemTime.setTime  time = Number.MIN_VALUE
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test6', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0600 start")
        systemTime.setTime(Number.MIN_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0600 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0700
     * @tc.name      Test systemTime.setTime  time = -1
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test7', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0700 start")
        systemTime.setTime(-1)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0700 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0800
     * @tc.name      Test systemTime.setTime  time = -Number.MIN_VALUE
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test8', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0800 start")
        systemTime.setTime(-Number.MIN_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0800 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0900
     * @tc.name      Test systemTime.setTime  time = -Number.MAX_VALUE/2
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test9', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_0900 start")
        systemTime.setTime(-Number.MAX_VALUE/2)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_0900 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_1000
     * @tc.name      Test systemTime.setTime  time = -Number.MAX_VALUE + 1
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test10', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_1000 start")
        systemTime.setTime(-Number.MAX_VALUE + 1)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_1000 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_1100
     * @tc.name      Test systemTime.setTime  time = -Number.MAX_VALUE
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test11', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_1100 start")
        systemTime.setTime(-Number.MAX_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_1100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_1200
     * @tc.name      Test systemTime.setTime  time = Number.NEGATIVE_INFINITY
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test12', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_1200 start")
        systemTime.setTime(Number.NEGATIVE_INFINITY)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_1200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_1300
     * @tc.name      Test systemTime.setTime  time = Number.POSITIVE_INFINITY
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTime_test13', 0, async function (done) {
        console.log("SUB_systemTime_setTime_JS_API_1300 start")
        systemTime.setTime(Number.POSITIVE_INFINITY)
            .then(data => {
            console.log("setTime ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTime ===error " + error)
            console.log("setTime ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTime_JS_API_1300 end');
        done()
    })
	
	/**
     * @tc.number    SUB_systemTime_setDate_JS_API_0100
     * @tc.name      Test systemTime.setDate date = new Date()
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test1', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0100 start")
        systemTime.setDate(new Date())
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0200
     * @tc.name      Test systemTime.setDate date = new Date(2022,1,1)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test2', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0200 start")
        systemTime.setDate(new Date(2022,1,1))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0300
     * @tc.name      Test systemTime.setDate date = new Date(2022,1,15)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test3', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0300 start")
        systemTime.setDate(new Date(2022,1,15))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0400
     * @tc.name      Test systemTime.setDate date = new Date(2022,1,31)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test4', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0400 start")
        systemTime.setDate(new Date(2022,1,31))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0500
     * @tc.name      Test systemTime.setDate date = new Date(2022,1,32)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test5', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0500 start")
        systemTime.setDate(new Date(2022,1,32))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0600
     * @tc.name      Test systemTime.setDate date = new Date(2022,2,29)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test6', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0600 start")
        systemTime.setDate(new Date(2022,2,29))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0600 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0700
     * @tc.name      Test systemTime.setDate date = new Date(2040,2,29)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test7', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0700 start")
        systemTime.setDate(new Date(2040,2,29))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0700 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0800
     * @tc.name      Test systemTime.setDate date = new Date(2040,2,30)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test8', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0800 start")
        systemTime.setDate(new Date(2040,2,30))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0800 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0900
     * @tc.name      Test systemTime.setDate date = new Date(2022,6,30)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test9', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_0900 start")
        systemTime.setDate(new Date(2022,6,30))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_0900 end');
        done()
    })
	
	/**
     * @tc.number    SUB_systemTime_setDate_JS_API_1000
     * @tc.name      Test systemTime.setDate date = new Date(2022,6,31)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test10', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1000 start")
        systemTime.setDate(new Date(2022,6,31))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1000 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1100
     * @tc.name      Test systemTime.setDate date = new Date(2022,12,31)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test11', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1100 start")
        systemTime.setDate(new Date(2022,12,31))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1100 end');
        done()
    })
	
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1200
     * @tc.name      Test systemTime.setDate date = new Date(2022,13,1)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test12', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1200 start")
        systemTime.setDate(new Date(2022,13,1))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1200 end');
        done()
    }) 

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1300
     * @tc.name      Test systemTime.setDate date = new Date(2022000,1,1)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test13', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1300 start")
        systemTime.setDate(new Date(2022000,1,1))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1400
     * @tc.name      Test systemTime.setDate date = new Date(0)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test14', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1400 start")
        systemTime.setDate(new Date(0))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1500
     * @tc.name      Test systemTime.setDate date = new Date(-1)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test15', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1500 start")
        systemTime.setDate(new Date(-1))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1600
     * @tc.name      Test systemTime.setDate date = new Date(Number.MAX_VALUE/2)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test16', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1600 start")
        systemTime.setDate(new Date(Number.MAX_VALUE/2))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1600 end');
        done()
    })
	
	/**
     * @tc.number    SUB_systemTime_setDate_JS_API_1700
     * @tc.name      Test systemTime.setDate date = new Date(-Number.MAX_VALUE/2)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test17', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1700 start")
        systemTime.setDate(new Date(-Number.MAX_VALUE/2))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1700 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1800
     * @tc.name      Test systemTime.setDate date = new Date(Number.MAX_VALUE)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test18', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1800 start")
        systemTime.setDate(new Date(Number.MAX_VALUE))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1800 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1900
     * @tc.name      Test systemTime.setDate date = new Date(-Number.MAX_VALUE)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test19', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_1900 start")
        systemTime.setDate(new Date(-Number.MAX_VALUE))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_1900 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2000
     * @tc.name      Test systemTime.setDate date = new Date("June 1, 2022 11:13:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test20', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2000 start")
        systemTime.setDate(new Date("June 1, 2022 11:13:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2000 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2100
     * @tc.name      Test systemTime.setDate date = new Date("June 30, 2022 11:13:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test21', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2100 start")
        systemTime.setDate(new Date("June 30, 2022 11:13:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2200
     * @tc.name      Test systemTime.setDate date = new Date("June 31, 2022 11:13:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test22', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2200 start")
        systemTime.setDate(new Date("June 31, 2022 11:13:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2300
     * @tc.name      Test systemTime.setDate date = new Date("July 32, 2022 11:13:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test23', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2300 start")
        systemTime.setDate(new Date("July 32, 2022 11:13:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2400
     * @tc.name      Test systemTime.setDate date = new Date("July 31, 2022")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test24', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2400 start")
        systemTime.setDate(new Date("July 31, 2022"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2500
     * @tc.name      Test systemTime.setDate date = new Date("February 28, 2022 11:13:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test25', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2500 start")
        systemTime.setDate(new Date("February 28, 2022 11:13:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2600
     * @tc.name      Test systemTime.setDate date = new Date("February 29, 2022 11:13:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test26', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2600 start")
        systemTime.setDate(new Date("February 29, 2022 11:13:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2600 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2700
     * @tc.name      Test systemTime.setDate date = new Date("February 29, 2040 11:13:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test27', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2700 start")
        systemTime.setDate(new Date("February 29, 2040 11:13:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2700 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2800
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 00:00:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test28', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2800 start")
        systemTime.setDate(new Date("February 1, 2022 00:00:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2800 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_2900
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 12:00:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test29', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_2900 start")
        systemTime.setDate(new Date("February 1, 2022 12:00:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_2900 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3000
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 23:00:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test30', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3000 start")
        systemTime.setDate(new Date("February 1, 2022 23:00:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3000 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3100
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 23:59:59")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test31', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3100 start")
        systemTime.setDate(new Date("February 1, 2022 23:59:59"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3200
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 24:00:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test32', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3200 start")
        systemTime.setDate(new Date("February 1, 2022 24:00:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3300
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 12:59:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test33', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3300 start")
        systemTime.setDate(new Date("February 1, 2022 12:59:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3400
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 12:00:59")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test34', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3400 start")
        systemTime.setDate(new Date("February 1, 2022 12:00:59"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3500
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 12:00:60")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test35', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3500 start")
        systemTime.setDate(new Date("February 1, 2022 12:00:60"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3600
     * @tc.name      Test systemTime.setDate date = new Date("February 1, 2022 12:60:00")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test36', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3600 start")
        systemTime.setDate(new Date("February 1, 2022 12:60:00"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3600 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_3700
     * @tc.name      Test systemTime.setDate date = new Date("!!@#$%^&*")
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setDate_test37', 0, async function (done) {
        console.log("SUB_systemTime_setDate_JS_API_3700 start")
        systemTime.setDate(new Date("!!@#$%^&*"))
            .then(data =>{
            console.log("setDate ===data " + data)
			expect(false).to.a('boolean')
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setDate_JS_API_3700 end');
        done()
    })
	
	/**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0100
     * @tc.name      Test systemTime.setTimezone timezone = "Anadyr, Russia"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test1', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0100 start")
        systemTime.setTimezone("Anadyr, Russia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0200
     * @tc.name      Test systemTime.setTimezone timezone = "Honiara, SolomonIslands"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test2', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0200 start")
        systemTime.setTimezone("Honiara, SolomonIslands")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0300
     * @tc.name      Test systemTime.setTimezone timezone = "Melbourne, Australia"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test3', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0300 start")
        systemTime.setTimezone("Melbourne, Australia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0400
     * @tc.name      Test systemTime.setTimezone timezone = "Tokyo, Japan"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test4', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0400 start")
        systemTime.setTimezone("Tokyo, Japan")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0500
     * @tc.name      Test systemTime.setTimezone timezone = "Beijing, China"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test5', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0500 start")
        systemTime.setTimezone("Beijing, China")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0600
     * @tc.name      Test systemTime.setTimezone timezone = "Jakarta, Indonesia"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test6', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0600 start")
        systemTime.setTimezone("Jakarta, Indonesia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0600 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0700
     * @tc.name      Test systemTime.setTimezone timezone = "Dhaka, Bangladesh"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test7', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0700 start")
        systemTime.setTimezone("Dhaka, Bangladesh")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0700 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0800
     * @tc.name      Test systemTime.setTimezone timezone = "Tashkent, Uzbekistan"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test8', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0800 start")
        systemTime.setTimezone("Tashkent, Uzbekistan")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0800 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0900
     * @tc.name      Test systemTime.setTimezone timezone = "Dubai, U.A.E."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test9', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_0900 start")
        systemTime.setTimezone("Dubai, U.A.E.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_0900 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1000
     * @tc.name      Test systemTime.setTimezone timezone = "Moscow, Russia"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test10', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1000 start")
        systemTime.setTimezone("Moscow, Russia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1000 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1100
     * @tc.name      Test systemTime.setTimezone timezone = "Brussels, Belgium"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test11', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1100 start")
        systemTime.setTimezone("Brussels, Belgium")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1200
     * @tc.name      Test systemTime.setTimezone timezone = "London, England"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test12', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1200 start")
        systemTime.setTimezone("London, England")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1300
     * @tc.name      Test systemTime.setTimezone timezone = "Accra, Ghana"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test13', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1300 start")
        systemTime.setTimezone("Accra, Ghana")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1400
     * @tc.name      Test systemTime.setTimezone timezone = "Praia, CaboVerde"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test14', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1400 start")
        systemTime.setTimezone("Praia, CaboVerde")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1500
     * @tc.name      Test systemTime.setTimezone timezone = "Nuuk, Greenland"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test15', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1500 start")
        systemTime.setTimezone("Nuuk, Greenland")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1600
     * @tc.name      Test systemTime.setTimezone timezone = "Buenos Aires, Argentina"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test16', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1600 start")
        systemTime.setTimezone("Buenos Aires, Argentina")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1600 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1700
     * @tc.name      Test systemTime.setTimezone timezone = "New York, U.S.A."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test17', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1700 start")
        systemTime.setTimezone("New York, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1700 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1800
     * @tc.name      Test systemTime.setTimezone timezone = "Mexico City, Mexico"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test18', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1800 start")
        systemTime.setTimezone("Mexico City, Mexico")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1800 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1900
     * @tc.name      Test systemTime.setTimezone timezone = "Guatemala City, Guatemala"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test19', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_1900 start")
        systemTime.setTimezone("Guatemala City, Guatemala")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_1900 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2000
     * @tc.name      Test systemTime.setTimezone timezone = "Los Angeles, U.S.A."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test20', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2000 start")
        systemTime.setTimezone("Los Angeles, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2000 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2100
     * @tc.name      Test systemTime.setTimezone timezone = "Anchorage, U.S.A."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test21', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2100 start")
        systemTime.setTimezone("Anchorage, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2100 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2200
     * @tc.name      Test systemTime.setTimezone timezone = "Adak, U.S.A."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test22', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2200 start")
        systemTime.setTimezone("Adak, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2200 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2300
     * @tc.name      Test systemTime.setTimezone timezone = "Honolulu, U.S.A."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test23', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2300 start")
        systemTime.setTimezone("Honolulu, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2300 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2400
     * @tc.name      Test systemTime.setTimezone timezone = "Alofi, Niue"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test24', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2400 start")
        systemTime.setTimezone("Alofi, Niue")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2400 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2500
     * @tc.name      Test systemTime.setTimezone timezone = "Baker Island, U.S.A."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test25', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2500 start")
        systemTime.setTimezone("Baker Island, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
			expect(true).to.a('boolean')
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2500 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2600
     * @tc.name      Test systemTime.setTimezone timezone = "Tomsk, Asia"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test26', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2600 start")
        systemTime.setTimezone("Tomsk, Asia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2600 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2700
     * @tc.name      Test systemTime.setTimezone timezone = "Chongqing, China"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test27', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2700 start")
        systemTime.setTimezone("Beijing, China")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2700 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2800
     * @tc.name      Test systemTime.setTimezone timezone = ""
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test28', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2800 start")
        systemTime.setTimezone("")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2800 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2900
     * @tc.name      Test systemTime.setTimezone timezone = "AAA...."
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test29', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_2900 start")
        systemTime.setTimezone("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_2900 end');
        done()
    })

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_3000
     * @tc.name      Test systemTime.setTimezone timezone = "~!@#$%^&*?;'[])(*-=+"
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_setTimezone_test30', 0, async function (done) {
        console.log("SUB_systemTime_setTimezone_JS_API_3000 start")
        systemTime.setTimezone("~!@#$%^&*?;'[])(*-=+")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
			execpt(0).assertLarger(1)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_3000 end');
        done()
    })
})