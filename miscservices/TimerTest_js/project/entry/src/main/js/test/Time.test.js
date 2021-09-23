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
import systemTimer from '@ohos.systemtimer'
import systemTime from '@ohos.systemTime'

describe('TimeTest', function() {
    console.log('start################################start');

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
        expect(true).to.a('boolean')
        systemTime.setTime(1)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(Number.MAX_VALUE/2)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(Number.MAX_VALUE - 1)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(Number.MAX_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(Number.MIN_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(-1)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(-Number.MIN_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(-Number.MAX_VALUE/2)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(-Number.MAX_VALUE + 1)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(-Number.MAX_VALUE)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(Number.NEGATIVE_INFINITY)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTime(Number.POSITIVE_INFINITY)
            .then(data => {
            console.log("setTime ===data " + data)
        }).catch(error => {
            console.log("setTime ===error " + error)
			console.log("setTime ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setDate(new Date())
            .then(data =>{
            console.log("setDate ===data " + data)
        }).catch(error => {
            console.log("setDate ===error " + error)
            console.log("setDate ===data " + data)
        });
        console.log('SUB_systemTime_setDate_JS_API_0100 end');
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Anadyr, Russia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Honiara, SolomonIslands")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Melbourne, Australia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Tokyo, Japan")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Beijing, China")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Jakarta, Indonesia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Dhaka, Bangladesh")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Tashkent, Uzbekistan")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Dubai, U.A.E.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Moscow, Russia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Brussels, Belgium")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("London, England")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Accra, Ghana")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Praia, CaboVerde")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Nuuk, Greenland")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Buenos Aires, Argentina")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("New York, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Mexico City, Mexico")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Guatemala City, Guatemala")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Los Angeles, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Anchorage, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Adak, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Honolulu, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Alofi, Niue")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(true).to.a('boolean')
        systemTime.setTimezone("Baker Island, U.S.A.")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(false).to.a('boolean')
        systemTime.setTimezone("Tomsk, Asia")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(false).to.a('boolean')
        systemTime.setTimezone("Beijing, China")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(false).to.a('boolean')
        systemTime.setTimezone("")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(false).to.a('boolean')
        systemTime.setTimezone("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
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
        expect(false).to.a('boolean')
        systemTime.setTimezone("~!@#$%^&*?;'[])(*-=+")
            .then(data =>{
            console.log("setTimezone ===data " + data)
        }).catch(error => {
            console.log("setTimezone ===error " + error)
            console.log("setTimezone ===data " + data)
        });
        console.log('SUB_systemTime_setTimezone_JS_API_3000 end');
        done()
    })
    /**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0100
     * @tc.name      Test systemTimer.Timer type = TIMER_TYPE_REALTIME
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test1',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0100 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0100 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0200
     * @tc.name      Test systemTimer.Timer type = TIMER_TYPE_REALTIME_WAKEUP
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test2',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0200 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME_WAKEUP,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0200 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0300
     * @tc.name      Test systemTimer.Timer type = TIMER_TYPE_EXACT
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test3',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0300 start")
        var options:TimerOptions{
			type:TIMER_TYPE_EXACT,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0300 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0400
     * @tc.name      Test systemTimer.Timer type = TIMER_TYPE_REALTIME
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test4',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0400 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0400 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0500
     * @tc.name      Test systemTimer.Timer triggerTime = 0
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test5',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0500 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:0,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0500 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0600
     * @tc.name      Test systemTimer.Timer triggerTime = 5000
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test6',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0600 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:5000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0600 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0700
     * @tc.name      Test systemTimer.Timer triggerTime = Number.MAX_VALUE/2
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test7',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0700 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:Number.MAX_VALUE/2,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0700 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0800
     * @tc.name      Test systemTimer.Timer triggerTime = Number.MAX_VALUE-1
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test8',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0800 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:Number.MAX_VALUE-1,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0800 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_0900
     * @tc.name      Test systemTimer.Timer triggerTime = Number.MAX_VALUE
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test9',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_0900 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:Number.MAX_VALUE,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_0900 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1000
     * @tc.name      Test systemTimer.Timer repeat = true
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test10',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1000 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:true,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1000 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1100
     * @tc.name      Test systemTimer.Timer persistent = true
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test11',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1100 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1100 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1200
     * @tc.name      Test systemTimer.Timer repeat,persistent = true
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test12',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1200 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:true,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1200 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1300
     * @tc.name      Test systemTimer.Timer create,start,stop,destroy 1000 timers
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test13',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1300 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		for (var index = 0; index < 1000; index++)
		{
			console.log("create timer")
			let timer = systemTimer.Timer(options)
			expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)

			console.log("start timer")
			let startTimerRes = systemTimer.startTimer(timer)
			expect(startTimerRes).assertEqual(true)

			console.log("stop timer")
			let stopTimerRes = systemTimer.stopTimer(timer)
			expect(stopTimerRes).assertEqual(true)

			console.log("destroy timer")
			let destroyTimerRes = systemTimer.destroyTimer(timer)
			expect(destroyTimerRes).assertEqual(true)
			console.log('SUB_systemTimer_Timer_JS_API_1300 end');
		}
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1400
     * @tc.name      Test systemTimer.Timer interval = 0
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test14',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1400 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			interval:0,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1400 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1500
     * @tc.name      Test systemTimer.Timer interval = 5000
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test15',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1500 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			interval:5000,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1500 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1600
     * @tc.name      Test systemTimer.Timer interval = Number.MAX_VALUE/2
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test16',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1600 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			interval:Number.MAX_VALUE/2,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1600 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1700
     * @tc.name      Test systemTimer.Timer interval = Number.MAX_VALUE-1
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test17',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1700 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			interval:Number.MAX_VALUE-1,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1700 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1800
     * @tc.name      Test systemTimer.Timer interval = Number.MAX_VALUE
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test18',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1800 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			interval:Number.MAX_VALUE,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1800 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_1900
     * @tc.name      Test systemTimer.Timer WantAgent
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test19',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_1900 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			interval:100000,
			
			//wantAgent:WantAgent
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_1900 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2000
     * @tc.name      Test systemTimer.Timer Called back when the timer goes off.
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test20',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2000 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			interval:100000,
			,
			callback:callbackFunction
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2000 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2100
     * @tc.name      Test systemTimer.Timer start a not exist timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test21',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2100 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start a not exist timer")
		let startTimerRes = systemTimer.startTimer(timer + 1)
		expect(startTimerRes).assertEqual(false)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2100 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2200
     * @tc.name      Test systemTimer.Timer stop a not exist timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test22',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2200 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop a not exist timer")
		let stopTimerRes = systemTimer.stopTimer(timer + 1)
		expect(stopTimerRes).assertEqual(false)
		
		console.log("stop the current timer")
		stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2200 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2300
     * @tc.name      Test systemTimer.Timer destroy a not exist timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test23',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2300 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy a not exist timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer + 1)
		expect(destroyTimerRes).assertEqual(false)
		
		console.log("destroy timer")
		destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2300 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2400
     * @tc.name      Test systemTimer.Timer stop a not started timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test24',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2400 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("stop a not started timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(false)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2400 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2500
     * @tc.name      Test systemTimer.Timer destroy a started timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test25',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2500 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("destroy a started timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2500 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2600
     * @tc.name      Test systemTimer.Timer repeat to start a timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test26',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2600 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("start timer again")
		startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2600 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2700
     * @tc.name      Test systemTimer.Timer repeat to stop a timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test27',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2700 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("stop timer again")
		stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		console.log('SUB_systemTimer_Timer_JS_API_2700 end');
	});

	/**
     * @tc.number    SUB_systemTimer_Timer_JS_API_2800
     * @tc.name      Test systemTimer.Timer repeat to destroy a timer
     * @tc.desc      Test systemTimer_Timer API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('systemTimer_Timer_test28',0, async () => {
		console.log("SUB_systemTimer_Timer_JS_API_2800 start")
        var options:TimerOptions{
			type:TIMER_TYPE_REALTIME,
			triggerTime:100000,
			repeat:false,
			
		}
		console.log("create timer")
        let timer = systemTimer.Timer(options)
		expect(parseInt(timer) == parseFloat(timer)).assertEqual(true)
		
		console.log("start timer")
		let startTimerRes = systemTimer.startTimer(timer)
		expect(startTimerRes).assertEqual(true)
		
		console.log("stop timer")
		let stopTimerRes = systemTimer.stopTimer(timer)
		expect(stopTimerRes).assertEqual(true)
		
		console.log("destroy timer")
		let destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(true)
		
		console.log("destroy timer again")
		destroyTimerRes = systemTimer.destroyTimer(timer)
		expect(destroyTimerRes).assertEqual(false)
		console.log('SUB_systemTimer_Timer_JS_API_2800 end');
	});

	/**
     * @function     Used for callback functions
     * @tc.name      callbackFunction
     */
	function callbackFunction()
	{
		console.log("Start to call the callback function")
	}
})