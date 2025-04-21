/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { application, common } from '@kit.AbilityKit';

let context = getContext(this) as common.UIAbilityContext;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = globalThis.context;
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0100
     * @tc.name    Call context.getApplicationcontext().setFontSizeScale, pass the parameter fontSize as -1, and
     * return a 401 error code
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0100', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0100';
      try {
        let applicationContext = context.getApplicationContext();
        applicationContext.setFontSizeScale(-1);
      } catch(error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0200
     * @tc.name    Call context. getApplication context(). setFontSizeScale, pass parameter fontSize as 0, return
     * success
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0200', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0200';
      try {
        let applicationContext = context.getApplicationContext();
        applicationContext.setFontSizeScale(0);
        console.log(`${caseName} Succeed to set size of font.`);
        done();
      } catch(error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0300
     * @tc.name    Call context. getApplication context(). setFontSizeScale, pass parameter fontSize as 2, return
     * success
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0300', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0300';
      try {
        let applicationContext = context.getApplicationContext();
        applicationContext.setFontSizeScale(2);
        console.log(`${caseName} Succeed to set size of font.`);
        done();
      } catch(error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0400
     * @tc.name    Call context. getApplication context(). setFontSizeScale, pass parameter fontSize as 9999999,
     * return success
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0400', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0400';
      try {
        let applicationContext = context.getApplicationContext();
        applicationContext.setFontSizeScale(9999999);
        console.log(`${caseName} Succeed to set size of font.`);
        done();
      } catch(error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0500
     * @tc.name    Call context.getApplicationcontext().setFontSizeScale, pass the parameter fontSize as null, and
     * return a 401 error code
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0500', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0500';
      try {
        let applicationContext = context.getApplicationContext();
        applicationContext.setFontSizeScale(null);
      } catch(error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done()
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0600
     * @tc.name    Call context.getApplicationcontext().setFontSizeScale, pass the parameter fontSize as undefined,
     * and return a 401 error code
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0600', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0600';
      try {
        let applicationContext = context.getApplicationContext();
        applicationContext.setFontSizeScale(undefined);
      } catch(error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done()
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0700
     * @tc.name    Call application to get the applicationcontext, call setFontSizeScale, and return 401 error code
     * when the parameter fontSize is -1
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0700', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0700';
      try {
        let applicationContext = application.getApplicationContext();
        applicationContext.setFontSizeScale(-1);
      } catch (error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0800
     * @tc.name    Call application to get the applicationcontext, call setFontSizeScale, and return success when
     * the parameter fontSize is 0
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0800', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0800';
      try {
        let applicationContext = application.getApplicationContext();
        applicationContext.setFontSizeScale(0);
        console.log(`${caseName} Succeed to set sizescale of font.`);
        done();
      } catch (error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_0900
     * @tc.name    Call application to get the applicationcontext, call setFontSizeScale, and return success when
     * the parameter fontSize is 2
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0900', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0900';
      try {
        let applicationContext = application.getApplicationContext();
        applicationContext.setFontSizeScale(2);
        console.log(`${caseName} Succeed to set sizescale of font.`);
        done();
      } catch (error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_1000
     * @tc.name    Call application to get the applicationcontext, call setFontSizeScale, and return success when
     * the parameter fontSize is 9999999
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1000', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1000';
      try {
        let applicationContext = application.getApplicationContext();
        applicationContext.setFontSizeScale(9999999);
        console.log(`${caseName} Succeed to set sizescale of font.`);
        done();
      } catch (error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100
     * @tc.name    Call application to get the applicationcontext, call setFontSizeScale, and return 401 error code
     * when the parameter fontSize is null
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100';
      try {
        let applicationContext = application.getApplicationContext();
        applicationContext.setFontSizeScale(null);
        console.log(`${caseName} Succeed to set sizescale of font.`);
      } catch (error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_1200
     * @tc.name    Call application to get the applicationcontext, call setFontSizeScale, and return 401 error code
     * when the parameter fontSize is undefined
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1200', Level.LEVEL0, (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1200';
      try {
        let applicationContext = application.getApplicationContext();
        applicationContext.setFontSizeScale(undefined);
        console.log(`${caseName} Succeed to set sizescale of font.`);
      } catch (error) {
        console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });
  })
}