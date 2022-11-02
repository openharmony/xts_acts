
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
export default function abilityTest() {
    describe('ACTS_AACommand_01_3', function () {
        /**
         * @tc.number: ACTS_AACommand_print_01_0100
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The print information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0100', 0, async function (done) {
            console.log("ACTS_AACommand_print_01_0100 start ====> " )
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.print(msg,(err,data)=>{
                console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback " )
                console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback err: "+JSON.stringify(err) )
                console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback data: "+JSON.stringify(data))
            })
            await sleep(1000);
            var finishmsg = 'ACTS_AACommand_print_01_0100 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then((data)=>{
                console.log("ACTS_AACommand_print_01_0100 finishTest  test  end ========> callback " )
                console.log("ACTS_AACommand_print_01_0100 finishTest  test  end ========> callback data: "+JSON.stringify(data))
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0200
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The length of the print message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0200', 0, async function (done) {
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'
            globalThis.abilityDelegator.print(msg,()=>{
                console.log("print  test  end ========> callback " )
            })
            await sleep(1000);
            var finishmsg = 'ACTS_AACommand_print_01_0200 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0200 print  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0300
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The length of the print message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0300', 0, async function (done) {
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae' +
            'fffffffffff'
            globalThis.abilityDelegator.print(msg,()=>{
                console.log("print  test  end ========> callback " )
            })
            await sleep(1000);
            var finishmsg = 'ACTS_AACommand_print_01_0300 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0300 print  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0400
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. print information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0400', 0, async function (done) {
            globalThis.abilityDelegator.print(null,()=>{
                console.log("print  test  end ========> callback " )
            })
            await sleep(1000);
            var finishmsg = 'ACTS_AACommand_print_01_0400 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0400 print  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0500
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The print information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0500', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.print(msg).then(()=>{
                console.log("ACTS_AACommand_print_01_0500 print  test  end ========> callback " )
            })
            await sleep(1000);
            var finishmsg = 'ACTS_AACommand_print_01_0500 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0500 print  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0600
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The length of the print message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
         *           through the test command.
         */
        it('ACTS_AACommand_print_01_0600', 0, async function (done) {
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'
            globalThis.abilityDelegator.print(msg).then(()=>{
                console.log("ACTS_AACommand_print_01_0600 print  test  end ========> callback " )
            })
            await sleep(1000);
            var finishmsg = 'ACTS_AACommand_print_01_0600 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0600 2 print  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0700
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The length of the print message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0700', 0, async function (done) {
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae' +
            'fffffffffff'
            globalThis.abilityDelegator.print(msg).then(()=>{
                console.log("ACTS_AACommand_print_01_0700 print  test  end ========> callback " )
            })
            await sleep(1000);
            var finishmsg = 'ACTS_AACommand_print_01_0700 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0700 2 print  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0800
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. print information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
         *           through the test command.
         */
        it('ACTS_AACommand_print_01_0800', 0, async function (done) {
            globalThis.abilityDelegator.print("").then(()=>{
                console.log("ACTS_AACommand_print_01_0800 print  test  end ========> callback " )
            })
            var finishmsg = 'ACTS_AACommand_print_01_0800 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0800 2 print  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0100
         * @tc.name: Each parameter of the test command is valid, and the finishTest interface is called
         *           in AsyncCallback mode.
         *           The msg parameter is valid (including Chinese and special characters) and the code parameter
         *           is valid (1).
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0100', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146ACTS_AACommand_finish_01_0100'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, 1,()=>{
                console.log("ACTS_AACommand_finish_01_0100 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0200
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid (null) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0200', 0, async function (done) {
            setTimeout(() => {
                console.log('ACTS_AACommand_finish_01_0200 code:'+JSON.stringify(code))
                if(code!=undefined){
                    expect().assertFail();
                }
                done();
            }, 3000)
            var code = globalThis.abilityDelegator.finishTest(null, 1,()=>{
                console.log(" ACTS_AACommand_finish_01_0200 finishTest  test  end ========> callback " )
                expect().assertFail();
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid (Undefined) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0300', 0, async function (done) {
            setTimeout(() => {
                console.log('ACTS_AACommand_finish_01_0300 code:'+JSON.stringify(code))
                if(code!=undefined){
                    expect().assertFail();
                }
                done();
            }, 3000)
            var code = globalThis.abilityDelegator.finishTest(undefined, 1,()=>{
                console.log(" ACTS_AACommand_finish_01_0300 finishTest  test  end ========> callback " )
                expect().assertFail();
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0400', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, Number.MAX_VALUE,()=>{
                console.log("ACTS_AACommand_finish_01_0400 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0500
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0500', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE,()=>{
                console.log("ACTS_AACommand_finish_01_0500 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0600
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0600', 0, async function (done) {

            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, (Number.MIN_VALUE+1),()=>{
                console.log("ACTS_AACommand_finish_01_0600 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0700
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0700', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, (Number.MIN_VALUE-1),()=>{
                console.log("ACTS_AACommand_finish_01_0700 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0800
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the
         *           code parameter is valid (“ABCD”)
         * @tc.desc: Verify that the process of the test framework is not stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0800', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, 'ABCD',()=>{
                console.log(" ACTS_AACommand_finish_01_0800 finishTest  test  end ========> callback " )
                expect().assertFail();
            })
            await sleep(2000);
            done();
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0900
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0900', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, 1).then(() => {
                console.log("ACTS_AACommand_finish_01_0900 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1000
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is invalid(null) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1000', 0, async function (done) {
            globalThis.abilityDelegator.finishTest(null, 1)
            await sleep(2000);
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1100
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is invalid(undefined) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1100', 0, async function (done) {
            globalThis.abilityDelegator.finishTest(undefined, 1)
            await sleep(2000);
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1200
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1200', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, Number.MAX_VALUE).then(()=>{
                console.log("ACTS_AACommand_finish_01_1200 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1300', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE).then(()=>{
                console.log("ACTS_AACommand_finish_01_1300 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1400', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE+1).then(()=>{
                console.log("ACTS_AACommand_finish_01_1400 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1500
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1500', 0, async function (done) {
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            await sleep(1000);
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE-1).then(()=>{
                console.log("ACTS_AACommand_finish_01_1500 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1600
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (ABCD)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1600', 0, async function (done) {
            var code = null
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            setTimeout(() => {
                console.log('ACTS_AACommand_finish_01_1600 code:'+JSON.stringify(code))
                if(code!=undefined){
                    expect().assertFail();
                }
                done();
            }, 3000)
            code = globalThis.abilityDelegator.finishTest(msg, 'ABCD')
        })
    })
};

