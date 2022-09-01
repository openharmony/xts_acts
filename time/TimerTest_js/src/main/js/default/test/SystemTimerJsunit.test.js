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

import {describe, it, expect} from 'deccjsunit/index';
import systemTimer from '@ohos.systemTimer';
import WantAgent from '@ohos.wantAgent';

var wantAgentInfo = {
    wants: [
        {
            deviceId: "deviceId",
            bundleName: "com.neu.setResultOnAbilityResultTest1",
            abilityName: "com.example.test.MainAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true,true,false}",
            parameters:
            {
                mykey0: 2222,
                mykey1: [1, 2, 3],
                mykey2: "[1, 2, 3]",
                mykey3: "ssssssssssssssssssssssssss",
                mykey4: [false, true, false],
                mykey5: ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
                mykey6: true,
            }
        }
    ],
    operationType: WantAgent.OperationType.START_ABILITIES,
    requestCode: 0
}

describe('systemTimerTest', function () {
    
	function isIntNum(val) {
		return typeof val === 'number' && val % 1 === 0;
	  }

    /**
     * @tc.number    SUB_systemTimer_createTimer_0000
     * @tc.name      systemTimer_createTimer_test000
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTimer_createTimer_test000', 0, async function (done) {
        console.info("systemTimer_createTimer_test000 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test000 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test000 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test000 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0100
     * @tc.name      systemTimer_createTimer_test001
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTimer_createTimer_test001', 0, async function (done) {
        console.info("systemTimer_createTimer_test001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test001 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test001 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0200
     * @tc.name      systemTimer_createTimer_test002
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = true, interval (Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test002', 0, async function (done) {
        console.info("systemTimer_createTimer_test002 start")
        let options = {
            type:systemTimer.TIMER_TYPE_WAKEUP,
            repeat:true,
            interval:5001
        }
        try {
            console.info("systemTimer_createTimer_test002 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test002 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test002 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0300
     * @tc.name      systemTimer_createTimer_test003
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = true, interval (callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test003', 0, async function (done) {
        console.info("systemTimer_createTimer_test003 start")
        let options = {
            type:systemTimer.TIMER_TYPE_WAKEUP,
            repeat:true,
            interval:5001
        }
        try {
            console.info("systemTimer_createTimer_test003 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test003 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test003 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0400
     * @tc.name      systemTimer_createTimer_test004
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_EXACT, repeat = false (Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test004', 0, async function (done) {
        console.info("systemTimer_createTimer_test004 start")
        let options = {
            type:systemTimer.TIMER_TYPE_EXACT,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test004 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test004 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test004 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0500
     * @tc.name      systemTimer_createTimer_test005
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_EXACT, repeat = false (callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test005', 0, async function (done) {
        console.info("systemTimer_createTimer_test005 start")
        let options = {
            type:systemTimer.TIMER_TYPE_EXACT,
            repeat:false,
        }
        try {
            console.info("systemTimer_createTimer_test005 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test005 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test005 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0600
     * @tc.name      systemTimer_createTimer_test006
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_IDLE, repeat = false, wantAgent (Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test006', 0, async function (done) {
        console.info("systemTimer_createTimer_test006 start")
        let wantAgent = await WantAgent.getWantAgent(wantAgentInfo);
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
            wantAgent:wantAgent
        }
        try {
            console.info("systemTimer_createTimer_test006 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test006 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test006 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0700
     * @tc.name      systemTimer_createTimer_test007
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_IDLE, repeat = false, wantAgent(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test007', 0, async function (done) {
        console.info("systemTimer_createTimer_test007 start")
        let wantAgent = await WantAgent.getWantAgent(wantAgentInfo);
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
            wantAgent:wantAgent
        }
        try {
            console.info("systemTimer_createTimer_test007 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test007 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test007 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0800
     * @tc.name      systemTimer_createTimer_test008
     * @tc.desc      Test createTimer() interfaces, type = 'TIMER_TYPE_REALTIME'(String)(Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test008', 0, async function (done) {
        console.info("systemTimer_createTimer_test008 start")
        let options = {
            type:'TIMER_TYPE_REALTIME',
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test008 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test008 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0900
     * @tc.name      systemTimer_createTimer_test009
     * @tc.desc      Test createTimer() interfaces, type = 'TIMER_TYPE_REALTIME'(String)(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test009', 0, async function (done) {
        console.info("systemTimer_createTimer_test009 start")
        let options = {
            type:'TIMER_TYPE_REALTIME',
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test009 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test009 failed")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test009 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1000
     * @tc.name      systemTimer_createTimer_test010
     * @tc.desc      Test createTimer() interfaces, type = null(Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test010', 0, async function (done) {
        console.info("systemTimer_createTimer_test010 start")
        let options = {
            type:null,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test010 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test010 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1100
     * @tc.name      systemTimer_createTimer_test011
     * @tc.desc      Test createTimer() interfaces, type = null(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test011', 0, async function (done) {
        console.info("systemTimer_createTimer_test011 start")
        let options = {
            type:null,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test011 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test011 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test011 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1200
     * @tc.name      systemTimer_createTimer_test012
     * @tc.desc      Test createTimer() interfaces, type = undefined(Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test012', 0, async function (done) {
        console.info("systemTimer_createTimer_test012 start")
        let options = {
            type:undefined,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test012 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test012 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1300
     * @tc.name      systemTimer_createTimer_test013
     * @tc.desc      Test createTimer() interfaces, type = undefined(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test013', 0, async function (done) {
        console.info("systemTimer_createTimer_test013 start")
        let options = {
            type:undefined,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test013 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test013 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test013 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1400
     * @tc.name      systemTimer_createTimer_test014
     * @tc.desc      Test createTimer() interfaces, no parameters(Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test014', 0, async function (done) {
        console.info("systemTimer_createTimer_test014 start")
        try {
            console.info("systemTimer_createTimer_test014 create timer")
            await systemTimer.createTimer();
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test014 has failed for '+e);
            expect(e.toString().indexOf('Wrong number of arguments') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1500
     * @tc.name      systemTimer_createTimer_test015
     * @tc.desc      Test createTimer() interfaces, repeat = 'false'(String) (Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test015', 0, async function (done) {
        console.info("systemTimer_createTimer_test015 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:'false'
        }
        try {
            console.info("systemTimer_createTimer_test015 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test015 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1600
     * @tc.name      systemTimer_createTimer_test016
     * @tc.desc      Test createTimer() interfaces, repeat = 'false'(String)(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test016', 0, async function (done) {
        console.info("systemTimer_createTimer_test016 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:'false'
        }
        try {
            console.info("systemTimer_createTimer_test016 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test016 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test016 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
      * @tc.number    SUB_systemTimer_createTimer_1700
      * @tc.name      systemTimer_createTimer_test017
      * @tc.desc      Test createTimer() interfaces, repeat = 0(number) (Promise)
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
      */
    it('systemTimer_createTimer_test017', 0, async function (done) {
        console.info("systemTimer_createTimer_test017 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:0
        }
        try {
            console.info("systemTimer_createTimer_test017 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test017 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1800
     * @tc.name      systemTimer_createTimer_test018
     * @tc.desc      Test createTimer() interfaces, repeat = 0(number)(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_createTimer_test018', 0, async function (done) {
        console.info("systemTimer_createTimer_test018 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:0
        }
        try {
            console.info("systemTimer_createTimer_test018 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test018 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test018 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_startTimer_0100
     * @tc.name      systemTimer_startTimer_test001
     * @tc.desc      Test startTimer() interfaces, normal call(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTimer_startTimer_test001', 0, async function (done) {
        console.info("systemTimer_startTimer_test001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        let triggerTime = 5000;
        try {
            console.info("systemTimer_startTimer_test001 start timer")
            systemTimer.startTimer(timerID, triggerTime, function(err, data){
                systemTimer.stopTimer(timerID, function(err, data){
                    systemTimer.destroyTimer(timerID, function(err, data){
                        console.info('systemTimer_startTimer_test001 has SUCCESS');
                        done();
                    });
                });
            });
        }catch (e) {
            console.info('systemTimer_startTimer_test001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_startTimer_0300
     * @tc.name      systemTimer_startTimer_test003
     * @tc.desc      Test startTimer() interfaces, timer = 0(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_startTimer_test003', 0, async function (done) {
        console.info("systemTimer_startTimer_test003 start")
        let timerID = 0;
        let triggerTime = 5000;
        try {
            console.info("systemTimer_startTimer_test003 start timer")
            systemTimer.startTimer(timerID, triggerTime, function(err, data){
                systemTimer.stopTimer(timerID, function(err, data){
                    systemTimer.destroyTimer(timerID, function(err, data){
                        console.info('systemTimer_startTimer_test003 has SUCCESS');
                        done();
                    });
                });
            });
        }catch (e) {
            console.info('systemTimer_startTimer_test003 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_startTimer_0500
     * @tc.name      systemTimer_startTimer_test005
     * @tc.desc      Test startTimer() interfaces, triggerTime = -5000(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_startTimer_test005', 0, async function (done) {
        console.info("systemTimer_startTimer_test005 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        let triggerTime = -5000;
        try {
            console.info("systemTimer_startTimer_test005 start timer")
            systemTimer.startTimer(timerID, triggerTime, function(err, data){
                console.info('systemTimer_startTimer_test005 failed');
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_startTimer_test005 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument triggerTime') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_stopTimer_0100
     * @tc.name      systemTimer_stopTimer_test001
     * @tc.desc      Test stopTimer() interfaces, normal call(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTimer_stopTimer_test001', 0, async function (done) {
        console.info("systemTimer_stopTimer_test001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        systemTimer.startTimer(timerID,5000);
        try {
            console.info("systemTimer_stopTimer_test001 stop timer")
            systemTimer.stopTimer(timerID, function(err, data){
                systemTimer.destroyTimer(timerID, function(err, data){
                    console.info('systemTimer_stopTimer_test001 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_stopTimer_test001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_stopTimer_0400
     * @tc.name      systemTimer_stopTimer_test004
     * @tc.desc      Test stopTimer() interfaces, timerID is not defined(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_stopTimer_test004', 0, async function (done) {
        console.info("systemTimer_stopTimer_test004 start")
        try {
            console.info("systemTimer_stopTimer_test004 stop timer")
            systemTimer.stopTimer(timerID, function(err, data){
                console.info('systemTimer_stopTimer_test004 failed');
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_stopTimer_test004 has failed for '+e);
            expect(e.toString().indexOf('timerID is not defined') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_destroyTimer_0100
     * @tc.name      systemTimer_destroyTimer_test001
     * @tc.desc      Test destroyTimer() interfaces, normal call(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTimer_destroyTimer_test001', 0, async function (done) {
        console.info("systemTimer_destroyTimer_test001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        try {
            console.info("systemTimer_destroyTimer_test001 destroy timer")
            systemTimer.destroyTimer(timerID, function(err, data){
                console.info('systemTimer_destroyTimer_test001 has SUCCESS');
                done();
            });
        }catch (e) {
            console.info('systemTimer_destroyTimer_test001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_destroyTimer_0400
     * @tc.name      systemTimer_destroyTimer_test004
     * @tc.desc      Test destroyTimer() interfaces, timerID is not defined(callback)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('systemTimer_destroyTimer_test004', 0, async function (done) {
        console.info("systemTimer_destroyTimer_test004 start")
        try {
            console.info("systemTimer_destroyTimer_test004 destroy timer")
            systemTimer.destroyTimer(timerID, function(err, data){
                console.info('systemTimer_destroyTimer_test004 failed');
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_destroyTimer_test004 has failed for '+e);
            expect(e.toString().indexOf('timerID is not defined') != -1).assertTrue();
            done();
        }
    });
});
