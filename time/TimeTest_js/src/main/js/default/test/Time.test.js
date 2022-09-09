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

// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import systemTime from '@ohos.systemTime'

describe('TimeTest', function(){
	console.log("-------------------TimeTest start----------------------" );

	/**
     * @tc.number    SUB_systemTime_setTime_JS_API_0100
     * @tc.name      Test systemTime.setTime
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('SUB_systemTime_setTime_JS_API_0100', 0, async function (done) {
		console.log("SUB_systemTime_setTime_JS_API_0100 start")
		systemTime.setTime(1526003846000)
			.then(data =>{
				console.log("setTime ===data " + data)
				execpt(data).assertEqual(true)
			}).catch(error => {
			console.log("setTime ===error " + error)
			execpt(0).assertLarger(1)
		});
		console.log('SUB_systemTime_setTime_JS_API_0100 end');
		done()
	})

	/**
     * @tc.number    SUB_systemTime_setTime_JS_API_0200
     * @tc.name      Test systemTime.setTime Invalid value
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('SUB_systemTime_setTime_JS_API_0200', 0, async function (done) {
		console.log("SUB_systemTime_setTime_JS_API_0200 start")
		systemTime.setTime(15222)
			.then(data => {
				console.log("setTime ===data " + data)
				expect(true).assertTrue();
			}).catch(error => {
			console.log("setTime ===error " + error)
			execpt(0).assertLarger(1)
		});
		console.log('SUB_systemTime_setTime_JS_API_0200 end');
		done()
	})

	/**
     * @tc.number    SUB_systemTime_setTime_JS_API_0300
     * @tc.name      Test systemTime.setTime3
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('SUB_systemTime_setTime_JS_API_0300', 0, async function (done) {
		console.log("SUB_systemTime_setTime_JS_API_0300 start")
		systemTime.setTime(1597156246000, (err, data) => {
			if (err) {
				console.log("setTime ===error: " + err);
				expect().assertFail()
			}else{
				console.log("setTime ===data: " + data);
				expect(true).assertTrue();
			}
		});
		console.log('SUB_systemTime_setTime_JS_API_0300 end');
		done()
	})

	/**
     * @tc.number    SUB_systemTime_setTime_JS_API_0400
     * @tc.name      Test systemTime.setTime4  Invalid value
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
	it('SUB_systemTime_setTime_JS_API_0400', 0, async function (done) {
		console.log("SUB_systemTime_setTime_JS_API_0400 start")
		try{
			systemTime.setTime(18, (err, data) => {
			console.log("setTime ===data: " + data);
			console.log("setTime ===error: " + err);
			expect(true).assertTrue();
		})}catch(error) {error => {
			expect(1).assertLarger(0)
			}
		}
		console.log('SUB_systemTime_setTime_JS_API_0400 end');
		done()
	})

	/**
    * @tc.number    SUB_systemTime_setDate_JS_API_0100
    * @tc.name      Test systemTime.setDate Invalid value
    * @tc.desc      Test systemTime_setDate API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
	it('SUB_systemTime_setDate_JS_API_0100', 0, async function (done) {
		console.log("SUB_systemTime_setDate_JS_API_0100 start");
		var data = new Date("October 13, 2020 11:13:00");
		systemTime.setDate(1).then(data => {
			console.log("setTime ===data " + data);
			expect(true).assertTrue();
		}).catch(error => {
			console.log("setTime ===error " + error);
			expect().assertFail()
		});
		done();
	});

	/**
    * @tc.number    SUB_systemTime_setDate_JS_API_0200
    * @tc.name      Test systemTime.setDate Invalid value
    * @tc.desc      Test systemTime_setDate API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
	it('SUB_systemTime_setDate_JS_API_0200', 0, async function (done) {
		console.log("SUB_systemTime_setDate_JS_API_0200 start");
		systemTime.setDate(0).then(data => {
			console.log("setTime ===data " + data);
			expect(true).assertTrue();
		}).catch(error => {
			console.log("setTime ===error " + error);
			expect().assertFail()
		});
		done();
	});

	/**
    * @tc.number    SUB_systemTime_setDate_JS_API_0300
    * @tc.name      Test systemTime.setDate Invalid value
    * @tc.desc      Test systemTime_setDate API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
	it('SUB_systemTime_setDate_JS_API_0300', 0, async function (done) {
		console.log("SUB_systemTime_setDate_JS_API_0300 start");
		var data = new Date("October 13, 2020 11:13:00");
		systemTime.setDate(data, (error, data) => {
			if(error){
				console.log("setTime ===error " + error);
				expect().assertFail()
			}else{
				console.log("setTime ===data " + data);
				expect(true).assertTrue();
			}
		});
		done();
	});

	/**
    * @tc.number    SUB_systemTime_setTimezone_JS_API_0100
    * @tc.name      Test systemTime.setTimezone Invalid value
    * @tc.desc      Test systemTime_setTimezone API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
	it('SUB_systemTime_setTimezone_JS_API_0100', 0, async function (done) {
		console.log("SUB_systemTime_setTimezone_JS_API_0100 start");
		systemTime.setTimezone('Asia, Shanghai').then(data => {
			console.log("setTime ===data " + data)
			expect().assertFail()
		}).catch(error => {
			console.log("setTime ===error " + error)
			expect(true).assertTrue();
		});
		done();
	});

	/**
    * @tc.number    SUB_systemTime_setTimezone_JS_API_0200
    * @tc.name      Test systemTime.setTimezone Invalid value
    * @tc.desc      Test systemTime_setTimezone API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
	it('SUB_systemTime_setTimezone_JS_API_0200', 0, async function (done) {
		console.log("SUB_systemTime_setTimezone_JS_API_0200 start");
		systemTime.setTimezone('Beijing,China').then(data => {
			console.log("setTime ===data " + data)
			expect().assertFail()
		}).catch(error => {
			console.log("setTime ===error " + error)
			expect(true).assertTrue();
		});
		done();
	});

	/**
    * @tc.number    SUB_systemTime_setTimezone_JS_API_0300
    * @tc.name      Test systemTime.setTimezone Invalid value
    * @tc.desc      Test systemTime_setTimezone API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
	it('SUB_systemTime_setTimezone_JS_API_0300', 0, async function (done) {
		console.log("SUB_systemTime_setTimezone_JS_API_0300 start");
		systemTime.setTimezone('Baker Island, U.S.A.').then(data => {
			console.log("setTime ===data " + data)
			expect().assertFail()
		}).catch(error => {
			console.log("setTime ===error " + error)
			expect(true).assertTrue();
		});
		done();
	});
})
