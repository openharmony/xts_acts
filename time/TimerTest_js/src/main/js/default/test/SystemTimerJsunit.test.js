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
     * @tc.name      systemTimer_createTimer_test_000
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('systemTimer_createTimer_test_000', 0, async function (done) {
        console.info("systemTimer_createTimer_test_000 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_000 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test_000 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_000 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0100
     * @tc.name      systemTimer_createTimer_test_001
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('systemTimer_createTimer_test_001', 0, async function (done) {
        console.info("systemTimer_createTimer_test_001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_001 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test_001 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0200
     * @tc.name      systemTimer_createTimer_test_002
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = true, interval (Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_002', 2, async function (done) {
        console.info("systemTimer_createTimer_test_002 start")
        let options = {
            type:systemTimer.TIMER_TYPE_WAKEUP,
            repeat:true,
            interval:5001
        }
        try {
            console.info("systemTimer_createTimer_test_002 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test_002 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_002 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0300
     * @tc.name      systemTimer_createTimer_test_003
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = true, interval (callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_003', 2, async function (done) {
        console.info("systemTimer_createTimer_test_003 start")
        let options = {
            type:systemTimer.TIMER_TYPE_WAKEUP,
            repeat:true,
            interval:5001
        }
        try {
            console.info("systemTimer_createTimer_test_003 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test_003 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_003 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0400
     * @tc.name      systemTimer_createTimer_test_004
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_EXACT, repeat = false (Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_004', 2, async function (done) {
        console.info("systemTimer_createTimer_test_004 start")
        let options = {
            type:systemTimer.TIMER_TYPE_EXACT,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_004 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test_004 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_004 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0500
     * @tc.name      systemTimer_createTimer_test_005
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_EXACT, repeat = false (callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_005', 2, async function (done) {
        console.info("systemTimer_createTimer_test_005 start")
        let options = {
            type:systemTimer.TIMER_TYPE_EXACT,
            repeat:false,
        }
        try {
            console.info("systemTimer_createTimer_test_005 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test_005 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_005 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0600
     * @tc.name      systemTimer_createTimer_test_006
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_IDLE, repeat = false, wantAgent (Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_006', 2, async function (done) {
        console.info("systemTimer_createTimer_test_006 start")
        let wantAgent = await WantAgent.getWantAgent(wantAgentInfo);
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
            wantAgent:wantAgent
        }
        try {
            console.info("systemTimer_createTimer_test_006 create timer")
            let timerID = await systemTimer.createTimer(options);
            expect(isIntNum(timerID)).assertTrue();
            console.info('systemTimer_createTimer_test_006 has SUCCESS');
            systemTimer.destroyTimer(timerID, function(e){
                done();
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_006 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0700
     * @tc.name      systemTimer_createTimer_test_007
     * @tc.desc      Test createTimer() interfaces, type = TIMER_TYPE_IDLE, repeat = false, wantAgent(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_007', 2, async function (done) {
        console.info("systemTimer_createTimer_test_007 start")
        let wantAgent = await WantAgent.getWantAgent(wantAgentInfo);
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
            wantAgent:wantAgent
        }
        try {
            console.info("systemTimer_createTimer_test_007 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                expect(isIntNum(timerID)).assertTrue();
                systemTimer.destroyTimer(timerID, function(e){
                    console.info('systemTimer_createTimer_test_007 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_createTimer_test_007 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0800
     * @tc.name      systemTimer_createTimer_test_008
     * @tc.desc      Test createTimer() interfaces, type = 'TIMER_TYPE_REALTIME'(String)(Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_008', 2, async function (done) {
        console.info("systemTimer_createTimer_test_008 start")
        let options = {
            type:'TIMER_TYPE_REALTIME',
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_008 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_008 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_0900
     * @tc.name      systemTimer_createTimer_test_009
     * @tc.desc      Test createTimer() interfaces, type = 'TIMER_TYPE_REALTIME'(String)(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_009', 2, async function (done) {
        console.info("systemTimer_createTimer_test_009 start")
        let options = {
            type:'TIMER_TYPE_REALTIME',
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_009 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test_009 failed")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_009 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1000
     * @tc.name      systemTimer_createTimer_test_010
     * @tc.desc      Test createTimer() interfaces, type = null(Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_010', 2, async function (done) {
        console.info("systemTimer_createTimer_test_010 start")
        let options = {
            type:null,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_010 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_010 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1100
     * @tc.name      systemTimer_createTimer_test_011
     * @tc.desc      Test createTimer() interfaces, type = null(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_011', 2, async function (done) {
        console.info("systemTimer_createTimer_test_011 start")
        let options = {
            type:null,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_011 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test_011 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_011 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1200
     * @tc.name      systemTimer_createTimer_test_012
     * @tc.desc      Test createTimer() interfaces, type = undefined(Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_012', 2, async function (done) {
        console.info("systemTimer_createTimer_test_012 start")
        let options = {
            type:undefined,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_012 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_012 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1300
     * @tc.name      systemTimer_createTimer_test_013
     * @tc.desc      Test createTimer() interfaces, type = undefined(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_013', 2, async function (done) {
        console.info("systemTimer_createTimer_test_013 start")
        let options = {
            type:undefined,
            repeat:false
        }
        try {
            console.info("systemTimer_createTimer_test_013 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test_013 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_013 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1400
     * @tc.name      systemTimer_createTimer_test_014
     * @tc.desc      Test createTimer() interfaces, no parameters(Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_014', 2, async function (done) {
        console.info("systemTimer_createTimer_test_014 start")
        try {
            console.info("systemTimer_createTimer_test_014 create timer")
            await systemTimer.createTimer();
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_014 has failed for '+e);
            expect(e.toString().indexOf('Wrong number of arguments') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1500
     * @tc.name      systemTimer_createTimer_test_015
     * @tc.desc      Test createTimer() interfaces, repeat = 'false'(String) (Promise)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_015', 2, async function (done) {
        console.info("systemTimer_createTimer_test_015 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:'false'
        }
        try {
            console.info("systemTimer_createTimer_test_015 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_015 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1600
     * @tc.name      systemTimer_createTimer_test_016
     * @tc.desc      Test createTimer() interfaces, repeat = 'false'(String)(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_016', 2, async function (done) {
        console.info("systemTimer_createTimer_test_016 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:'false'
        }
        try {
            console.info("systemTimer_createTimer_test_016 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test_016 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_016 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
      * @tc.number    SUB_systemTimer_createTimer_1700
      * @tc.name      systemTimer_createTimer_test_017
      * @tc.desc      Test createTimer() interfaces, repeat = 0(number) (Promise)
      * @tc.size      MEDIUM
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('systemTimer_createTimer_test_017', 2, async function (done) {
        console.info("systemTimer_createTimer_test_017 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:0
        }
        try {
            console.info("systemTimer_createTimer_test_017 create timer")
            await systemTimer.createTimer(options);
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_017 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_createTimer_1800
     * @tc.name      systemTimer_createTimer_test_018
     * @tc.desc      Test createTimer() interfaces, repeat = 0(number)(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_createTimer_test_018', 2, async function (done) {
        console.info("systemTimer_createTimer_test_018 start")
        let options = {
            type:systemTimer.TIMER_TYPE_REALTIME,
            repeat:0
        }
        try {
            console.info("systemTimer_createTimer_test_018 create timer")
            systemTimer.createTimer(options, function(err, timerID){
                console.info("systemTimer_createTimer_test_018 failed ")
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_createTimer_test_018 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument type') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_startTimer_0100
     * @tc.name      systemTimer_startTimer_test_001
     * @tc.desc      Test startTimer() interfaces, normal call(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('systemTimer_startTimer_test_001', 0, async function (done) {
        console.info("systemTimer_startTimer_test_001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        let triggerTime = 5000;
        try {
            console.info("systemTimer_startTimer_test_001 start timer")
            systemTimer.startTimer(timerID, triggerTime, function(err, data){
                systemTimer.stopTimer(timerID, function(err, data){
                    systemTimer.destroyTimer(timerID, function(err, data){
                        console.info('systemTimer_startTimer_test_001 has SUCCESS');
                        done();
                    });
                });
            });
        }catch (e) {
            console.info('systemTimer_startTimer_test_001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_startTimer_0300
     * @tc.name      systemTimer_startTimer_test_003
     * @tc.desc      Test startTimer() interfaces, timer = 0(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_startTimer_test_003', 2, async function (done) {
        console.info("systemTimer_startTimer_test_003 start")
        let timerID = 0;
        let triggerTime = 5000;
        try {
            console.info("systemTimer_startTimer_test_003 start timer")
            systemTimer.startTimer(timerID, triggerTime, function(err, data){
                systemTimer.stopTimer(timerID, function(err, data){
                    systemTimer.destroyTimer(timerID, function(err, data){
                        console.info('systemTimer_startTimer_test_003 has SUCCESS');
                        done();
                    });
                });
            });
        }catch (e) {
            console.info('systemTimer_startTimer_test_003 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_startTimer_0500
     * @tc.name      systemTimer_startTimer_test_005
     * @tc.desc      Test startTimer() interfaces, triggerTime = -5000(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_startTimer_test_005', 2, async function (done) {
        console.info("systemTimer_startTimer_test_005 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        let triggerTime = -5000;
        try {
            console.info("systemTimer_startTimer_test_005 start timer")
            systemTimer.startTimer(timerID, triggerTime, function(err, data){
                console.info('systemTimer_startTimer_test_005 failed');
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_startTimer_test_005 has failed for '+e);
            expect(e.toString().indexOf('Wrong argument triggerTime') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_stopTimer_0100
     * @tc.name      systemTimer_stopTimer_test_001
     * @tc.desc      Test stopTimer() interfaces, normal call(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('systemTimer_stopTimer_test_001', 0, async function (done) {
        console.info("systemTimer_stopTimer_test_001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        systemTimer.startTimer(timerID,5000);
        try {
            console.info("systemTimer_stopTimer_test_001 stop timer")
            systemTimer.stopTimer(timerID, function(err, data){
                systemTimer.destroyTimer(timerID, function(err, data){
                    console.info('systemTimer_stopTimer_test_001 has SUCCESS');
                    done();
                });
            });
        }catch (e) {
            console.info('systemTimer_stopTimer_test_001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_stopTimer_0400
     * @tc.name      systemTimer_stopTimer_test_004
     * @tc.desc      Test stopTimer() interfaces, timerID is not defined(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_stopTimer_test_004', 2, async function (done) {
        console.info("systemTimer_stopTimer_test_004 start")
        try {
            console.info("systemTimer_stopTimer_test_004 stop timer")
            systemTimer.stopTimer(timerID, function(err, data){
                console.info('systemTimer_stopTimer_test_004 failed');
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_stopTimer_test_004 has failed for '+e);
            expect(e.toString().indexOf('timerID is not defined') != -1).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_destroyTimer_0100
     * @tc.name      systemTimer_destroyTimer_test_001
     * @tc.desc      Test destroyTimer() interfaces, normal call(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('systemTimer_destroyTimer_test_001', 0, async function (done) {
        console.info("systemTimer_destroyTimer_test_001 start")
        let options = {
            type:systemTimer.TIMER_TYPE_IDLE,
            repeat:false,
        }
        let timerID = await systemTimer.createTimer(options);
        expect(isIntNum(timerID)).assertTrue();
        try {
            console.info("systemTimer_destroyTimer_test_001 destroy timer")
            systemTimer.destroyTimer(timerID, function(err, data){
                console.info('systemTimer_destroyTimer_test_001 has SUCCESS');
                done();
            });
        }catch (e) {
            console.info('systemTimer_destroyTimer_test_001 has failed for '+e);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number    SUB_systemTimer_destroyTimer_0400
     * @tc.name      systemTimer_destroyTimer_test_004
     * @tc.desc      Test destroyTimer() interfaces, timerID is not defined(callback)
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('systemTimer_destroyTimer_test_004', 2, async function (done) {
        console.info("systemTimer_destroyTimer_test_004 start")
        try {
            console.info("systemTimer_destroyTimer_test_004 destroy timer")
            systemTimer.destroyTimer(timerID, function(err, data){
                console.info('systemTimer_destroyTimer_test_004 failed');
            });
            expect(false).assertTrue();
        }catch (e) {
            console.info('systemTimer_destroyTimer_test_004 has failed for '+e);
            expect(e.toString().indexOf('timerID is not defined') != -1).assertTrue();
            done();
        }
    });
});