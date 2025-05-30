/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

/**
 * Test of common attribute: clickEffect
 */
export default function clickEffectTest() {
  //A list of components that support padding attributes is required.
  //A list of components that support padding attributes is required.
  let supportView = [
    'CheckboxGroup',
   ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig:ESObject = {
    testName: 'testClickEffect',
    pageName: 'clickEffectPage',
    pageUrl: 'MainAbility/pages/clickEffect/ClickEffectPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  //The data type to be tested, this parameter is required.
  let testValues:ESObject[]= [{
    describe: 'SetClickEffect',
    setValue: {
      clickEffect: { level: ClickEffectLevel.LIGHT , scale: 0.5 } as ESObject
    } as ESObject,
    expectValue: {
      clickEffect: { level: '0' , scale: '0.500000' } as ESObject
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('clickEffectTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
       console.info('[' + data.caseTag + ']' + 'clickEffect is:' + data.viewObj.$attrs.clickEffect.level);
      console.info('[' + data.caseTag + ']' + 'clickEffect is:' + data.viewObj.$attrs.clickEffect.scale);
       expect(data.viewObj.$attrs.clickEffect.scale)
         .assertEqual(data.testValue.expectValue.clickEffect.scale);
        expect(data.viewObj.$attrs.clickEffect.level)
        .assertEqual(data.testValue.expectValue.clickEffect.level);
    });
  })
}