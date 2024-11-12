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
import backgroundTaskManager from '@ohos.backgroundTaskManager'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function ShortTaskMgrApiTest() {
describe("ShortTaskMgrApiTest", function () {
    beforeAll(function() {
        
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll caled')
    })

    afterAll(function() {
        
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll caled')
    })

    beforeEach(function() {
        
        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach caled')
    })

    afterEach(function() {
        
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
         console.info('afterEach caled')
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_007
     * @tc.name      testRequestSuspendDelayFun001
     * @tc.desc      test request a suspend daly reason is NumberType.
     */
    it("testRequestSuspendDelayFun001", 0, async function (done) {
        console.info('----------------------testRequestSuspendDelayFun001---------------------------');
        function callback() {}
        let reason = 123;
        try{
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('testRequestSuspendDelayFun001 backgroundTaskManager fail, because of reason is :' + 
                reason);
                expect(info.requestId).assertEqual(-1);
            } else {
                console.info('testRequestSuspendDelayFun001 backgroundTaskManager success,requestId:' + 
                info.requestId);
                expect(info.requestId).assertLarger(0);
            }
        }catch(error){
            console.info('testRequestSuspendDelayFun001 backgroundTaskManager fail, because of :' + error);
        }
        done();
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_008
     * @tc.name      testRequestSuspendDelayFun002
     * @tc.desc      test request a suspend daly reason is BooleanType.
     */
 it("testRequestSuspendDelayFun002", 0, async function (done) {
    console.info('----------------------testRequestSuspendDelayFun002---------------------------');
    function callback() {}
    let reason = true;
    try{
        let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
        if (info.requestId === -1) {
            console.info('testRequestSuspendDelayFun002 backgroundTaskManager fail, because of reason is :' + 
            reason);
            expect(info.requestId).assertEqual(-1);
        } else {
            console.info('testRequestSuspendDelayFun002 backgroundTaskManager success,requestId:' + 
            info.requestId);
            expect(info.requestId).assertLarger(0);
        }
    }catch(error){
        console.info('testRequestSuspendDelayFun002 backgroundTaskManager fail, because of :' + error);
    }
    done();
})

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_009
     * @tc.name      testRequestSuspendDelayFun003
     * @tc.desc      test request a suspend daly reason is NullType.
     */
it("testRequestSuspendDelayFun003", 0, async function (done) {
    console.info('----------------------testRequestSuspendDelayFun003---------------------------');
    function callback() {}
    let reason = null;
    try{
        let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
        if (info.requestId === -1) {
            console.info('testRequestSuspendDelayFun003 backgroundTaskManager fail, because of reason is :' + 
            reason);
            expect(info.requestId).assertEqual(-1);
        } else {
            console.info('testRequestSuspendDelayFun003 backgroundTaskManager success,requestId:' + 
            info.requestId);
            expect(info.requestId).assertLarger(0);
        }
    }catch(error){
        console.info('testRequestSuspendDelayFun003 backgroundTaskManager fail, because of :' + error);
    }
    done();
})

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_010
     * @tc.name      testRequestSuspendDelayFun004
     * @tc.desc      test request a suspend daly reason is EmptyString.
     */
    it("testRequestSuspendDelayFun004", 0, async function (done) {
        console.info('----------------------testRequestSuspendDelayFun004---------------------------');
        function callback() {}
        let reason = "";
        try{
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('testRequestSuspendDelayFun004 backgroundTaskManager fail, because of reason is :' + 
                reason);
                expect(info.requestId).assertEqual(-1);
            } else {
                console.info('testRequestSuspendDelayFun004 backgroundTaskManager success,requestId:' + 
                info.requestId);
                expect(info.requestId).assertLarger(0);
            }
        }catch(error){
            console.info('testRequestSuspendDelayFun004 backgroundTaskManager fail, because of :' + error);
        }
        done();
    })


    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_011
     * @tc.name      testRequestSuspendDelayFun005
     * @tc.desc      test request a suspend daly reason Undefined.
     */
    it("testRequestSuspendDelayFun005", 0, async function (done) {
        console.info('----------------------testRequestSuspendDelayFun005---------------------------');
        function callback() {}
        let reason;
        try{
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('testRequestSuspendDelayFun005 backgroundTaskManager fail, because of reason is :' + 
                reason);
                expect(info.requestId).assertEqual(-1);
            } else {
                console.info('testRequestSuspendDelayFun005 backgroundTaskManager success,requestId:' + 
                info.requestId);
                expect(info.requestId).assertLarger(0);
            }
        }catch(error){
            console.info('testRequestSuspendDelayFun005 backgroundTaskManager fail, because of :' + error);
        }
        done();
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_012
     * @tc.name      testGetRemainingDelayTimeFun001
     * @tc.desc      test getRemainingDelayTime Callback ,requestId non-existent.
     */
    it("testGetRemainingDelayTimeFun001", 0, async function (done) {
        console.info('----------------------testGetRemainingDelayTimeFun001---------------------------');
        function callback() {}
        let info = backgroundTaskManager.requestSuspendDelay("test", callback);
        if (info.requestId != -1) {
            console.info('testGetRemainingDelayTimeFun001 backgroundTaskManager success, requestId:' + 
            info.requestId);
            expect(info.requestId).assertLarger(0);
        } else {
            expect(info.requestId).assertEqual(-1);
            done();
        }

        backgroundTaskManager.getRemainingDelayTime(info.requestId+1, (err, res) => {
            if (err) {
                console.info('testGetRemainingDelayTimeFun001 backgroundTaskManager error,cause:' + err.code);
                expect(err.code).assertLarger(0);

            } else {
                console.info('testGetRemainingDelayTimeFun001 backgroundTaskManager success, delaytime:' + res);
                expect(res).assertLarger(0);
            }
            backgroundTaskManager.cancelSuspendDelay(info.requestId)
        });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_013
     * @tc.name      testGetRemainingDelayTimeFun002
     * @tc.desc      test getRemainingDelayTime Promise ,requestId non-existent.
     */
    it("testGetRemainingDelayTimeFun002", 0, async function (done) {
        console.info('----------------------testGetRemainingDelayTimeFun002---------------------------');
        function callback() {}
        let info = backgroundTaskManager.requestSuspendDelay("test", callback);
        if (info.requestId != -1) {
            console.info('testGetRemainingDelayTimeFun002 backgroundTaskManager success, requestId:' + 
            info.requestId);
            expect(info.requestId).assertLarger(0);
        } else {
            expect(info.requestId).assertEqual(-1);
            done();
        }

        backgroundTaskManager.getRemainingDelayTime(info.requestId+1)
            .then(res => {
                console.info('testGetRemainingDelayTimeFun002 backgroundTaskManager success, delaytime:' + res);
                expect(res).assertLarger(0);
            })
            .catch(err =>{
                console.info('testGetRemainingDelayTimeFun002 backgroundTaskManager error,cause:' + err.code);
                expect(err.code).assertLarger(0);
            });
        backgroundTaskManager.cancelSuspendDelay(info.requestId);
        setTimeout(()=>{
            done();
        }, 500);
    })   

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_014
     * @tc.name      testGetRemainingDelayTimeFun003
     * @tc.desc      test getRemainingDelayTime Promise ,requestId is null.
     */
    it("testGetRemainingDelayTimeFun003", 0, async function (done) {
        console.info('----------------------testGetRemainingDelayTimeFun003---------------------------');
        let requestId = null;
        try{
            backgroundTaskManager.getRemainingDelayTime(requestId)
            .then(res => {
                console.info('testGetRemainingDelayTimeFun003 backgroundTaskManager success, delaytime:' + res);
                expect(res).assertLarger(0);
            })
            .catch(err =>{
                console.info('testGetRemainingDelayTimeFun003 backgroundTaskManager error,cause:' + err.code);
                expect(err.code).assertLarger(0);
            });
        }catch(error){
            console.info('testGetRemainingDelayTimeFun003 backgroundTaskManager error,' + error);
        } 
        setTimeout(()=>{
            done();
        }, 500);
    })   

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_015
     * @tc.name      testGetRemainingDelayTimeFun004
     * @tc.desc      test getRemainingDelayTime Callback ,requestId = -1.
     */
    it("testGetRemainingDelayTimeFun004", 0, async function (done) {
        console.info('----------------------testGetRemainingDelayTimeFun004---------------------------');
        let requestId = -1;
        backgroundTaskManager.getRemainingDelayTime(requestId, (err, res) => {
            if (err) {
                console.info('testGetRemainingDelayTimeFun001 backgroundTaskManager error,cause:' + err.code);
                expect(err.code).assertLarger(0);

            } else {
                console.info('testGetRemainingDelayTimeFun001 backgroundTaskManager success, delaytime:' + res);
                expect(res).assertLarger(0);
            }
        });
        setTimeout(()=>{
            done();
        }, 500);
    })
    
    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_016
     * @tc.name      testGetRemainingDelayTimeFun005
     * @tc.desc      test getRemainingDelayTime Promise ,requestId = 0.
     */
    it("testGetRemainingDelayTimeFun005", 0, async function (done) {
        console.info('----------------------testGetRemainingDelayTimeFun005---------------------------');
        let requestId = 0;
        try{
            backgroundTaskManager.getRemainingDelayTime(requestId)
            .then(res => {
                console.info('testGetRemainingDelayTimeFun005 backgroundTaskManager success, delaytime:' + res);
                expect(res).assertLarger(0);
            })
            .catch(err =>{
                console.info('testGetRemainingDelayTimeFun005 backgroundTaskManager error,cause:' + err.code);
                expect(err.code).assertLarger(0);
            });
        }catch(error){
            console.info('testGetRemainingDelayTimeFun005 backgroundTaskManager error,' + error);
        } 
        setTimeout(()=>{
            done();
        }, 500);
    })
})
}