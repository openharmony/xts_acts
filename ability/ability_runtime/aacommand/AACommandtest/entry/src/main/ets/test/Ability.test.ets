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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import appManager from '@ohos.application.appManager';
const DELAY = 3000
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
export default function abilityTest() {
    describe('ACTS_AACommand_Test', function () {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        function checkRunningProcess(name, dataInfo) {
            for (let i = 0, len = dataInfo.length; i < len; i++) {
                if (dataInfo[i].processName == name) {
                    return true;
                }
            }
            return false;
        }

        /**
         * @tc.number: ACTS_AACommand_0100
         * @tc.name: -b, -s unittest, -p, -s class, -s level, -s size, -s testType, -s timeout,
         *           -s <any-key> <any-value>, -w, etc. of the test command arguments are
         *           valid ( -s class specifies only test suites).
         * @tc.desc: Verify that the test framework can start normally through the test command.
         */
        it('ACTS_AACommand_0100', 0, async function (done) {
            console.log("ACTS_AACommand_0100 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtesta' +
            'test -m entry_test ' +
            '-s unittest OpenHarmonyTestRunner ' +
            '-w 40 -s class ACTS_AACommand_01_3 -s level 1 -s size 0 -s testType aaa -s '+
            'timeout 5 -s 1 3 -D'
            let delay = 3000
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0100 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0100 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                console.log('ACTS_AACommand_0100 query string i = ' + i);
                expect(i == -1).assertEqual(false);
            })
            setTimeout(async () => {
                console.log('ACTS_AACommand_0100 - executeShellCommand: end')
                done();
            }, delay)
        })

        /**
         * @tc.number: ACTS_AACommand_0200
         * @tc.name: The -b parameter of the test command is invalid, and the other parameters such as -s and -w are valid.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0200', 0, async function (done) {
            console.log("ACTS_AACommand_0200 --- start")
            let cmd = 'aa test -b invalid -m entry_test -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0200 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0200 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('failed to start user test');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0200 query string i = ' + i);
                console.log('ACTS_AACommand_0200 query string j = ' + j);
                expect(i == -1).assertEqual(false);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0200 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0300
         * @tc.name: The -s parameter of the test command is invalid, and the other parameters such as -b and -w are valid.
         * @tc.desc:Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0300', 0, async function (done) {
            console.log("ACTS_AACommand_0300 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtestatest -m entry_test -s invalid'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0300 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0300 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('option [-s] is incorrect');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0300 query string i = ' + i);
                console.log('ACTS_AACommand_0300 query string j = ' + j);
                expect(i == -1).assertEqual(false);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0300 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0400
         * @tc.name: The -w parameter of the test command is invalid, and the other parameters such as -b and -s are valid.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0400', 0, async function (done) {
            console.log("ACTS_AACommand_0400 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtestatest -m entry_test ' +
            '-s unittest OpenHarmonyTestRunner ' +
            '-w 无效值'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0400 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0400 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0400 query string i = ' + i);
                console.log('ACTS_AACommand_0400 query string j = ' + j);
                expect(i == -1).assertEqual(true);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0400 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0500
         * @tc.name: The -b, -s, -w and other parameters of the test command are valid, and the
         *           invalid -z parameter is added.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0500', 0, async function (done) {
            console.log("ACTS_AACommand_0500 --- start")
            let cmd = 'aa test -b aa test -b com.example.actsaacommandtestatest -m entry_test' +
            '-s unittest OpenHarmonyTestRunner -z invalid'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0500 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0500 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('error: unknown option: -z');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0500 query string i = ' + i);
                console.log('ACTS_AACommand_0500 query string j = ' + j);
                expect(i == -1).assertEqual(false);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0500 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0600
         * @tc.name: The -p parameter of the test command is invalid, and the -b, -s, -w and other parameters are valid.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0600', 0, async function (done) {
            console.log("ACTS_AACommand_0600 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtestatest -m aatest -s unittest OpenHarmonyTestRunner -w 20'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0600 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0600 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0600 query string i = ' + i);
                console.log('ACTS_AACommand_0600 query string j = ' + j);
                expect(i == -1).assertEqual(true);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0600 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0700
         * @tc.name: The parameters of the test command are valid, 
         * and the finishTest interface is called in AsyncCallback
         * mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         * is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0700', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0700 --- start")
            var cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_finish_0700 -s unittest OpenHarmonyTestRunner'
            var finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_finishTest_0700 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0700 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0700 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                var j = data.stdResult.indexOf('TestFinished-ResultCode: -1');
                console.log('ACTS_AACommand_finishTest_0700 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_0700 - executeShellCommand: end')
            })
            setTimeout(async() => {
                var temp
                var cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_0800
         * @tc.name: The -b, -s, -w and other parameters of the test command are valid, and there is no -D 
         *          parameter setting.
         * @tc.desc: Verify that the test framework cannot be started in Debug mode through the test command.
         */
        it('ACTS_AACommand_0800', 0, async function (done) {
            console.log("ACTS_AACommand_0800 --- start")
            let cmd = 'aa test -b com.example.aacommand08 -m entry_test -s unittest OpenHarmonyTestRunner -w 3'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0800 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0800 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                console.log('ACTS_AACommand_0800 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_0800 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_0100
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The print information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_0100', 0, async function (done) {
            console.log("ACTS_AACommand_print_0100 --- start")
            let cmd = 'aa test -b com.example.aacommandrelyhap -m entry_test  -s class ACTS_AACommand_01_3#ACTS_AACo' +
            'mmand_print_0100 -s unittest OpenHarmonyTestRunner'
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0100 - executeShellCommand: start ')
                console.log('ACTS_AACommand_print_0100 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_print_0100 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_print_0100 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0100 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print01', procrssinfo)
                console.log("====>ACTS_AACommand_print_0100====>infores = " + infores)
                expect(infores==false).assertEqual(true);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_print_0200
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The length of the print message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_0200', 0, async function (done) {
            console.log("ACTS_AACommand_print_0200 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AAComm'+
            'and_print_0200 -s unittest OpenHarmonyTestRunner'
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+
            'aaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0200 - executeShellCommand: start ')
                console.log('ACTS_AACommand_print_0200 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_print_0200 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_print_0200 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0200 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print02', procrssinfo)
                console.log("====>ACTS_AACommand_print_0200====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_print_0300
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The length of the print message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_0300', 0, async function (done) {
            console.log("ACTS_AACommand_print_0300 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_'+
            'AACommand_print_0300 -s unittest OpenHarmonyTestRunner'
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
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
            let msgcopy = 'fffffffffff'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0300 - executeShellCommand: start ')
                console.log('ACTS_AACommand_print_0300 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_print_0300 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf(msgcopy);
                console.log('ACTS_AACommand_print_0300 === query string j = ' + j);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_print_0300 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0300 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print03', procrssinfo)
                console.log("====>ACTS_AACommand_print_0300====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_print_0400
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. print information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_0400', 0, async function (done) {
            console.log("ACTS_AACommand_print_0400 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AAComma'+
            'nd_print_0400 -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0400 - executeShellCommand: start ')
                console.log('ACTS_AACommand_print_0400 stdResult = ' + data.stdResult)
                expect(data.stdResult.indexOf('start ability successfully')==-1).assertEqual(false);
                console.log('ACTS_AACommand_print_0400 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0400 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print04', procrssinfo)
                console.log("====>ACTS_AACommand_print_0400====>infores = ")
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_print_0500
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The print information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_0500', 0, async function (done) {
            console.log("ACTS_AACommand_print_0500 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AAComm'+
            'and_print_0500 -s unittest OpenHarmonyTestRunner'
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0500 - executeShellCommand: start ')
                console.log('ACTS_AACommand_print_0500 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_print_0500 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_print_0500 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0500 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print05', procrssinfo)
                console.log("====>ACTS_AACommand_print_0500====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_print_0600
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The length of the print message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
         *           through the test command.
         */
        it('ACTS_AACommand_print_0600', 0, async function (done) {
            console.log("ACTS_AACommand_print_0600 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AA' +
            'Command_print_0600 -s unittest OpenHarmonyTestRunner'
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
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
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0600 - executeShellCommand: start ')
                console.log('ACTS_AACommand_print_0600 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_print_0600 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_print_0600 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0600 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print06', procrssinfo)
                console.log("====>ACTS_AACommand_print_0600====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_print_0700
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The length of the print message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_0700', 0, async function (done) {
            console.log("ACTS_AACommand_print_0700 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
            'ACTS_AACommand_01_3#ACTS_AACommand_print_0700 -s unittest OpenHarmonyTestRunner '
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaa'
            let msgcopy = 'fffffffffff'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0700 - executeShellCommand: start ')
                console.log('ACTS_AACommand_print_0700 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_print_0700 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf(msgcopy);
                console.log('ACTS_AACommand_print_0700 === query string j = ' + j);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_print_0700 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0700 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print07', procrssinfo)
                console.log("====>ACTS_AACommand_print_0700====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_print_0800
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. print information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
         *           through the test command.
         */
        it('ACTS_AACommand_print_0800', 0, async function (done) {
            console.log("ACTS_AACommand_print_0800 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_print_0800 -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_print_0800 - executeShellCommand: start ')
                console.log("ACTS_AACommand_print_0800 print  test  end ========> callback " )
                expect(data.stdResult.indexOf('start ability successfully')==-1).assertEqual(false);
                console.log('ACTS_AACommand_print_0800 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_print_0800 getProcessRunningInfos ======> ' + JSON.stringify(procrssinfo));
                let infores = checkRunningProcess('com.example.print08', procrssinfo)
                console.log("====>ACTS_AACommand_print_0800====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })



        /**
         * @tc.number: ACTS_AACommand_finishTest_0400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in
         *           AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code 
         *           parameter
         *           is valid (Number.MAX_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0400', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0400 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
            'ACTS_AACommand_01_3#ACTS_AACommand_finish_0400 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_finishTest_0400 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0400 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0400 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: -1');
                console.log('ACTS_AACommand_finishTest_0400 query string j = ' + j);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_finishTest_0400 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })


        /**
         * @tc.number: ACTS_AACommand_finishTest_0100
         * @tc.name: Each parameter of the test command is valid, and the finishTest interface is called
         *           in AsyncCallback mode.
         *           The msg parameter is valid (including Chinese and special characters) and the code parameter
         *           is valid (1).
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0100', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0100 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_finish_0100 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_finishTest_0100 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0100 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0100 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: 1');
                console.log('ACTS_AACommand_finishTest_0100 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_0100 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })


        /**
         * @tc.number: ACTS_AACommand_finishTest_0500
         * @tc.name: The parameters of the test command are valid, and the finishTest
         *           interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special
         *           characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0500', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0500 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
            'ACTS_AACommand_01_3#ACTS_AACommand_finish_0500 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_finishTest_0500 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0500 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0500 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: 0');
                console.log('ACTS_AACommand_finishTest_0500 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_0500 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0600
         * @tc.name: The parameters of the test command are valid, and the finishTest
         *           interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters)
         *           and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0600', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0600 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_finish_0600 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_finishTest_0600 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0600 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0600 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: 1');
                console.log('ACTS_AACommand_finishTest_0600 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_0600 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0700
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in 
         *           AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code 
         *           parameter
         *           is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0700', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0700 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_finish_0700 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_finishTest_0700 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0700 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0700 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: -1');
                console.log('ACTS_AACommand_finishTest_0700 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_0700 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })


        /**
         * @tc.number: ACTS_AACommand_finishTest_0900
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0900', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0900 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_finish_0900 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_0900 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0900 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0900 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: 1');
                console.log('ACTS_AACommand_finishTest_0900 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_0900 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })


        /**
         * @tc.number: ACTS_AACommand_finishTest_1200
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1200', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1200 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap' +
            ' -s class ACTS_AACommand_01_3#ACTS_AACommand_finish_1200 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_1200 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_1200 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_1200 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: -1');
                console.log('ACTS_AACommand_finishTest_1200 query string j = ' + j);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_finishTest_1200 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1300', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1300 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_1300 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_1300 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_1300 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_1300 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: 0');
                console.log('ACTS_AACommand_finishTest_1300 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_1300 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1400', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1400 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_1400 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_1400 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_1400 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_1400 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: 1');
                console.log('ACTS_AACommand_finishTest_1400 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_1400 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1500
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1500', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1500 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_1500 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_1500 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_1500 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_1500 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                let j = data.stdResult.indexOf('TestFinished-ResultCode: -1');
                console.log('ACTS_AACommand_finishTest_1500 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_1500 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
                 * @tc.number: ACTS_AACommand_finishTest_0200
                 * @tc.name: The parameters of the test command are valid, and the finishTest 
                 *           interface is called in AsyncCallback
                 *           mode. The msg parameter is invalid (null) and the code parameter is valid (1)
                 * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
                 */
        it('ACTS_AACommand_finishTest_0200', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0200 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_0200 -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd, () => {
                console.log('ACTS_AACommand_finishTest_0200 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") >= 0).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in 
         *           AsyncCallback mode. The msg parameter is invalid (Undefined) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0300', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0300 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_0300 -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd, () => {
                console.log('ACTS_AACommand_finishTest_0300 - executeShellCommand: start ')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") >= 0).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0800
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in 
         *           AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the
         *           code parameter is valid (“ABCD”)
         * @tc.desc: Verify that the process of the test framework is not stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0800', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0800 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_finish_0800 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_finishTest_0800 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_0800 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_0800 query string i = ' + i);
                expect(i == -1).assertEqual(true);
                let j = data.stdResult.indexOf('TestFinished-ResultCode:');
                console.log('ACTS_AACommand_finishTest_0800 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_0800 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_AACommand_finishTest_0800 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") >= 0).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1000
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is invalid(null) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1000', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1000 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
            'class ACTS_AACommand_01_3#ACTS_AACommand_finish_1000 -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_1000 - executeShellCommand: start ')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") >=0).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1100
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is invalid(undefined) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1100', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1100 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
            '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_1100 -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_1100 - executeShellCommand: start ')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") >= 0).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })
        /**
        * @tc.number: ACTS_AACommand_finishTest_1600
        * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in 
        *           Promisemode. The msg parameter is valid(including Chinese and special characters) and the 
        *           code parameter
        *           is valid (ABCD)
        * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
        */
        it('ACTS_AACommand_finishTest_1600', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1600 --- start")
            let cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap' +
            ' -s class ACTS_AACommand_01_3#ACTS_AACommand_finish_1600 -s unittest OpenHarmonyTestRunner'
            let finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.log('ACTS_AACommand_finishTest_1600 - executeShellCommand: start ')
                console.log('ACTS_AACommand_finishTest_1600 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf(finishmsg);
                console.log('ACTS_AACommand_finishTest_1600 query string i = ' + i);
                expect(i == -1).assertEqual(true);
                let j = data.stdResult.indexOf('TestFinished-ResultCode:');
                console.log('ACTS_AACommand_finishTest_1600 query string j = ' + j);
                expect(j == -1).assertEqual(false);
                console.log('ACTS_AACommand_finishTest_1600 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_AACommand_finishTest_1600 - executeShellCommand: end')
            })
            setTimeout(async() => {
                let temp
                let cmd ='aa dump -a'
                abilityDelegator.executeShellCommand(cmd,
                    (err: any, d: any) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data : ' + JSON.stringify(d));
                        temp = d["stdResult"];
                        expect(temp.indexOf("com.example.aacommandrelyhap") >= 0).assertTrue()
                        console.info('executeShellCommand end');
                    })
                done();
            }, DELAY )
        })
    })
};
