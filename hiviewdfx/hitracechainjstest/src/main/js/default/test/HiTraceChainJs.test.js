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
import HiTraceChain from '@ohos.HiTraceChain'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import hilog from '@ohos.hilog'

describe('HiTraceJsTest', function () {

    /**
    * run before testClass
    */
    beforeAll(function () {
        console.info('beforeAll called');
    })

    /**
    * run after testClass
    */
    afterAll(function () {
        console.info('afterAll called');
    })

    /**
     * @tc.number DFX_DFT_Hitrace_JS_001
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi01', 1, async function (done) {
        console.info('testHitraceApi01 start');
        try{
            let traceId = hiTraceChain.begin("hitrace01");
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi01 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi01 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi01 end');
        done();
    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_002
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi02', 1, async function (done) {
        console.info('testHitraceApi02 start');
        try{
            let traceId = hiTraceChain.begin("hitrace02", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC |
            hiTraceChain.HiTraceFlag.DONOT_CREATE_SPAN);
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi02 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi02 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi02 end');
        done();
    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_003
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi03', 1, async function (done) {
        console.info('testHitraceApi03 start');
        try{
            let traceId = hiTraceChain.begin("hitrace03", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId !== curTraceId){
                expect().assertFail();
                console.log(`testHitraceApi03 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi03 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi03 end');
        done();
    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_004
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi04', 1, async function (done) {
        console.info('testHitraceApi04 start');
        try{
            let traceId = hiTraceChain.begin("hitrace04", hiTraceChain.HiTraceFlag.NO_BE_INFO);
            let spanTraceId = hiTraceChain.createSpan();
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.NO_BE_INFO);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi04 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi04 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi04 end');
        done();
    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_005
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi05', 1, async function (done) {
        console.info('testHitraceApi05 start');
        try{
            let traceId = hiTraceChain.begin("hitrace05");
            hiTraceChain.enable(asyncTraceId, hiTraceChain.HiTraceFlag.DISABLE_LOG);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.DISABLE_LOG);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi05 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi05 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi05 end');
        done();
    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_006
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi06', 1, async function (done) {
        console.info('testHitraceApi06 start');
        try{
            let traceId = hiTraceChain.begin("hitrace06");
            hiTraceChain.enable(asyncTraceId, hiTraceChain.HiTraceFlag.FAILURE_TRIGGER);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId,
            hiTraceChain.HiTraceFlag.FAILURE_TRIGGER);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi06 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi06 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi06 end');
        done();
    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_007
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi07', 1, async function (done) {
        console.info('testHitraceApi07 start');
        try{
            let traceId = hiTraceChain.begin("hitrace07", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO)
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi07 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi07 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi07 end');
        done();
    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_008
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi08', 1, async function (done) {
        console.info('testHitraceApi08 start');
        hiTraceChain.clearId();
        let traceId = hiTraceChain.begin("hitrace08", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        let curChainId = traceId.chainId;
        new Promise(function(resolve, reject){
            resolve()
        }).then(() => {
            console.info('in testHitraceApi08 then callback')
            console.info(`testHitraceApi08 ${hiTraceChain.getId().chainId} <> ${curChainId}`)
            except(hiTraceChain.getId().chainId == curChainId).assertTrue()
            done()
        })
        hiTraceChain.end(traceId);
        done()
        console.info('testHitraceApi08 end');

    })

     /**
     * @tc.number DFX_DFT_Hitrace_JS_009
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHiAppEventApi09', 1, async function (done) {
        console.info('testHitraceApi09 start');
        hiTraceChain.clearId();
        let traceId = hiTraceChain.begin("hitrace09", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        let curChainId = traceId.chainId;
        async function asyncTask() {
        }
        asyncTask().then(() => {
            console.info('in testhiTraceApi09 then callback')
            console.info(`testHitraceApi09 ${hiTraceChain.getId().chainId} <> ${curChainId}`)
            except(hiTraceChain.getId().chainId == curChainId).assertTrue()
            done()
        })
        hiTraceChain.end(traceId);
        done()
        console.info('testHitraceApi09 end');
    })
})
