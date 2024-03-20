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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let msg: string;
let msgcopy: string;

export default function abilityTest() {
  describe('ActsAACommandPrinOneTest', () => {
    afterEach(async (done: Function) => {
      console.log("ActsAACommandPrinOneTest afterEach called");
      let wantInfo: Want = {
        bundleName: "com.example.aacommandprintonetest",
        abilityName: "MainAbility"
      };
      await AppStorage.get<common.UIAbilityContext>("abilityContext").startAbility(wantInfo).then((data) => {
        console.log("ActsAACommandPrinOneTest startAbility data : " + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log("ActsAACommandPrinOneTest startAbility err : " + JSON.stringify(err));
      });
      setTimeout(() => {
        console.log("ActsAACommandPrinOneTest afterEach end");
        done();
      }, 1000);
    });

    /**
     * @tc.number: ACTS_AACommand_print_0100
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in AsyncCallback mode. The print information includes Chinese, special characters, etc.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_print_0100', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0100 --- start");
      msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
      expect(AppStorage.get<string>("stdResult3")).assertContain(msg);
      done();
    });

    /**
     * @tc.number: ACTS_AACommand_print_0200
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in AsyncCallback mode. The length of the print message is 1000 characters.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_print_0200', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0200 --- start");
      msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaa' +
        '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae';
      expect(AppStorage.get<string>("stdResult4")).assertContain(msg);
      done();
    });

    /**
     * @tc.number: ACTS_AACommand_print_0300
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in AsyncCallback mode. The length of the print message is greater than 1000 characters.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_print_0300', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0300 --- start");
      msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaa' +
        '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae';
      let msgcopy = 'fffffffffff';
      let stdResult5 = AppStorage.get<string>("stdResult5");
      expect(stdResult5).assertContain(msg);
      expect(stdResult5.indexOf(msgcopy) == -1).assertEqual(true);
      done();
    });

    /**
     * @tc.number: ACTS_AACommand_print_0400
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in AsyncCallback mode. print information is null.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_print_0400', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0400 --- start");
      msg = 'start ability successfully';
      expect(AppStorage.get<string>("stdResult6")).assertContain(msg);
      done();
    });

    /**
     * @tc.number: ACTS_AACommand_print_0500
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in Promise mode. The print information includes Chinese, special characters, etc.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_print_0500', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0500 --- start");
      msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
      expect(AppStorage.get<string>("stdResult7")).assertContain(msg);
      done();
    });

    /**
     * @tc.number: ACTS_AACommand_print_0600
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in Promise mode. The length of the print message is 1000 characters.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
     *           through the test command.
     */
    it('ACTS_AACommand_print_0600', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0600 --- start");
      msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaa' +
        '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae';
      expect(AppStorage.get<string>("stdResult8")).assertContain(msg);
      done();
    });

    /**
     * @tc.number: ACTS_AACommand_print_0700
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in Promise mode. The length of the print message is greater than 1000 characters.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_print_0700', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0700 --- start");
      msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaa' +
        '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '9aaaaaaaaa';
      msgcopy = 'fffffffffff';
      let stdResult9: string = AppStorage.get<string>("stdResult9");
      expect(stdResult9).assertContain(msg);
      expect(stdResult9.indexOf(msgcopy) == -1).assertEqual(true);
      done();
    });

    /**
     * @tc.number: ACTS_AACommand_print_0800
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
     *           called in Promise mode. print information is null.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
     *           through the test command.
     */
    it('ACTS_AACommand_print_0800', 0, async (done: Function) => {
      console.log("ACTS_AACommand_print_0800 --- start");
      msg = 'start ability successfully';
      expect(AppStorage.get<string>("stdResult10")).assertContain(msg);
      done();
    });
  })
}