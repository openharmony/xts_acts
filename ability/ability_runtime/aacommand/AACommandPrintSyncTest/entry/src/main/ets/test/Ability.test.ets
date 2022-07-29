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
    describe('ActsAbilityTest', function () {
        var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        function checkRunningProcess(name, dataInfo) {
            for (let i = 0, len = dataInfo.length; i < len; i++) {
                if (dataInfo[i].processName == name) {
                    return true;
                }
            }
            return false;
        }

        /**
         * @tc.number: ACTS_AACommand_printSync_0100
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid
         *           The printSync information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0100', 0, async function (done) {
            console.log("ACTS_AACommand_printSync_0100 --- start")
            var cmd = 'aa test -b com.example.aacommandprintsync -m entry_test  -s class ' +
            'ACTS_AACommand_01_3#ACTS_AACommand_printSync_0100 -s unittest OpenHarmonyTestRunner'
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_printSync_0100 - executeShellCommand: start ')
                console.log('ACTS_AACommand_printSync_0100 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_printSync_0100 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_printSync_0100 - executeShellCommand: end')
            })
            setTimeout(async() => {
                var procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_printSync_0100 getProcessRunningInfos ======> '
                + JSON.stringify(procrssinfo));
                var infores = checkRunningProcess('com.example.aacommandprintsync', procrssinfo)
                console.log("====>ACTS_AACommand_printSync_0100====>infores = " + infores)
                expect(infores==false).assertEqual(true);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_printSync_0200
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
         *           The length of the printSync message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0200', 0, async function (done) {
            console.log("ACTS_AACommand_printSync_0200 --- start")
            var cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
            'ACTS_AACommand_01_3#ACTS_AACommand_printSync_0200 -s unittest OpenHarmonyTestRunner'
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
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_printSync_0200 - executeShellCommand: start ')
                console.log('ACTS_AACommand_printSync_0200 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_printSync_0200 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_printSync_0200 - executeShellCommand: end')
            })
            setTimeout(async() => {
                var procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_printSync_0200 getProcessRunningInfos ======> ' +
                '' + JSON.stringify(procrssinfo));
                var infores = checkRunningProcess('com.example.aacommandprintsync', procrssinfo)
                console.log("====>ACTS_AACommand_printSync_0200====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_printSync_0300
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
         *           The length of the printSync message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0300', 0, async function (done) {
            console.log("ACTS_AACommand_printSync_0300 --- start")
            var cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
            'ACTS_AACommand_01_3#ACTS_AACommand_printSync_0300 -s unittest OpenHarmonyTestRunner'
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
            var msgcopy = 'fffffffffff'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_printSync_0300 - executeShellCommand: start ')
                console.log('ACTS_AACommand_printSync_0300 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(msg);
                console.log('ACTS_AACommand_printSync_0300 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                var j = data.stdResult.indexOf(msgcopy);
                console.log('ACTS_AACommand_printSync_0300 === query string j = ' + j);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_printSync_0300 - executeShellCommand: end')
            })
            setTimeout(async() => {
                var procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_printSync_0300 getProcessRunningInfos ======> '
                + JSON.stringify(procrssinfo));
                var infores = checkRunningProcess('com.example.aacommandprintsync', procrssinfo)
                console.log("====>ACTS_AACommand_printSync_0300====>infores = " + infores)
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })

        /**
         * @tc.number: ACTS_AACommand_printSync_0400
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
         *           printSync information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0400', 0, async function (done) {
            console.log("ACTS_AACommand_printSync_0400 --- start")
            var cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
            'ACTS_AACommand_01_3#ACTS_AACommand_printSync_0400 -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_printSync_0400 - executeShellCommand: start ')
                console.log('ACTS_AACommand_printSync_0400 stdResult = ' + data.stdResult)
                expect(data.stdResult.indexOf('start ability successfully')==-1).assertEqual(false);
                console.log('ACTS_AACommand_printSync_0400 - executeShellCommand: end')
            })
            setTimeout(async() => {
                var procrssinfo = await appManager.getProcessRunningInfos()
                console.log('ACTS_AACommand_printSync_0400 getProcessRunningInfos ======> '
                + JSON.stringify(procrssinfo));
                var infores = checkRunningProcess('com.example.aacommandprintsync', procrssinfo)
                console.log("====>ACTS_AACommand_printSync_0400====>infores = ")
                expect(infores).assertEqual(false);
                done();
            }, DELAY )
        })
    })
}