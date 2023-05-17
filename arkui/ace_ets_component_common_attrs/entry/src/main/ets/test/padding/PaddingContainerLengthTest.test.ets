/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Utils from '../../MainAbility/common/Utils';
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

export default function paddingTest() {
  //A list of components that support size attributes is required.
  let supportView = [
    'Badge',
    'Column',
    'Counter',
    'GridRow',
    'Grid',
    'List',
    'Panel',
    'Refresh',
    'Row',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'WaterFlow',
    'ColumnSplit',
    'Flex',
    'FlowItem',
    'GridCol',
    'GridItem',
    'ListItemGroup',
    'Navigator',
    'RelativeContainer',
    'RowSplit',
    'ListItem'
  ]

  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 300;
  let parentHeight = 300;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig = {
    testName: 'testPaddingContainerLength',
    pageName: 'PaddingContainerPageLength',
    pageUrl: 'MainAbility/pages/padding/PaddingContainerPageLength',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues = [{
    describe: 'SetNumber',
    setValue: {
      padding: 10
    },
    expectValue: {
      padding: '10.00vp',
      top: vp2px(10),
      right: vp2px(10),
      bottom: vp2px(10),
      left: vp2px(10)
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      padding: '100px'
    },
    expectValue: {
      padding: '100.00px',
      top: 100,
      right: 100,
      bottom: 100,
      left: 100
    }
  }, {
    describe: 'SetResource',
    setValue: {
      padding: $r('app.float.10vp'),
    },
    expectValue: {
      padding: '10.00vp',
      top: vp2px(10),
      right: vp2px(10),
      bottom: vp2px(10),
      left: vp2px(10)
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      padding: '10%',
    },
    expectValue: {
      padding: '10.00%',
      parentWidthAfter: vp2px(parentWidth) * 0.1
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingContainerLengthTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async data => {
      //Modify the reference component properties.
      AttrsManager.change(data.caseTag, {
        padding: 0
      });
      await Utils.sleep(1000);

      //Obtain dimensional information for target components.
      let targetRectBefore = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verify the width size of the target component.
      let targetRectBeforeWidth = targetRectBefore.right - targetRectBefore.left;

      console.info('[' + data.caseTag + '] targetRectBeforeWidth:' + targetRectBeforeWidth);

      //Verify the height size of the reference component.
      let targetRectBeforeHeight = targetRectBefore.bottom - targetRectBefore.top;

      console.info('[' + data.caseTag + '] targetRectBeforeHeight:' + targetRectBeforeHeight);

      //Modify the target component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let targetRectAfter = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verification method for special reference components.
      if (data.pageConfig.componentKey == 'RelativeContainer' || data.pageConfig.componentKey == 'RowSplit'
      || data.pageConfig.componentKey == 'ListItemGroup' || data.pageConfig.componentKey == 'List'
      || data.pageConfig.componentKey == 'ColumnSplit' || data.pageConfig.componentKey == 'Flex'
      || data.pageConfig.componentKey == 'GridCol' || data.pageConfig.componentKey == 'FlowItem'
      || data.pageConfig.componentKey == 'GridRow' || data.pageConfig.componentKey == 'Panel'
      || data.pageConfig.componentKey == 'SideBarContainer' || data.pageConfig.componentKey == 'TabContent'
      || data.pageConfig.componentKey == 'WaterFlow' /*||data.pageConfig.componentKey == 'ListItem'*/) {
        //Obtain the size information of the targetRect component.
        let targetRect = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

        //Verification method for special targetRect components.
        if (data.testValue.describe == 'SetNumber' || data.testValue.describe == 'SetResource'
        || data.testValue.describe == 'SetStringPx') {
          console.info('[' + data.caseTag + ']targetRect.top - targetRectAfter.top:'
          + (targetRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] targetRect.left - targetRectAfter.left:'
          + (targetRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - targetRect.bottom:'
          + (targetRectAfter.bottom - targetRect.bottom));
          console.info('[' + data.caseTag + ']targetRectAfter.right - targetRect.right:'
          + (targetRectAfter.right - targetRect.right));

          expect(targetRect.top - targetRectAfter.top).assertEqual(data.testValue.expectValue.top);
          expect(targetRectAfter.bottom - targetRect.bottom).assertEqual(data.testValue.expectValue.bottom);
          expect(targetRectAfter.right - targetRect.right).assertEqual(data.testValue.expectValue.right);
          expect(targetRect.left - targetRectAfter.left).assertEqual(data.testValue.expectValue.left);
        } else if (data.testValue.describe == 'SetStringPercent') {
          console.info('[' + data.caseTag + ']referenceRect.top - targetRectAfter.top:'
          + (targetRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
          + (targetRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
          + (targetRectAfter.bottom - targetRect.bottom));
          console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
          + (targetRectAfter.right - targetRect.right));

          expect(targetRect.top - targetRectAfter.top)
            .assertEqual((data.testValue.expectValue.parentWidthAfter));
          expect(targetRectAfter.bottom - targetRect.bottom)
            .assertEqual((data.testValue.expectValue.parentWidthAfter));
          expect(targetRectAfter.right - targetRect.right)
            .assertEqual((data.testValue.expectValue.parentWidthAfter));
          expect(targetRect.left - targetRectAfter.left)
            .assertEqual((data.testValue.expectValue.parentWidthAfter));
        }
      } else if (data.pageConfig.componentKey == 'Tabs') {
        let referenceRect = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[1]);
        let rectTabBar = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]);
        console.info('rectTabBar.bottom - rectTabBar.top:')
        if (data.testValue.describe == 'SetNumber' || data.testValue.describe == 'SetStringPx'
        || data.testValue.describe == 'SetResource') {
          console.info('[' + data.caseTag + '] referenceRect.top - targetRectAfter.top:'
          + (referenceRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
          + (referenceRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
          + (targetRectAfter.bottom - referenceRect.bottom));
          console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
          + (targetRectAfter.right - referenceRect.right));

          expect(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top))
            .assertEqual(data.testValue.expectValue.top);
          expect(targetRectAfter.bottom - referenceRect.bottom)
            .assertEqual(data.testValue.expectValue.bottom);
          expect(targetRectAfter.right - referenceRect.right)
            .assertEqual(data.testValue.expectValue.right);
          expect(referenceRect.left - targetRectAfter.left)
            .assertEqual(data.testValue.expectValue.left);
        } else if (data.testValue.describe == 'SetStringPercent') {
          console.info('[' + data.caseTag + '] referenceRect.top - targetRectAfter.top:'
          + (referenceRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
          + (referenceRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
          + (targetRectAfter.bottom - referenceRect.bottom));
          console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
          + (targetRectAfter.right - referenceRect.right));

          expect(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top))
            .assertEqual(data.testValue.expectValue.parentWidthAfter);
          expect(targetRectAfter.bottom - referenceRect.bottom)
            .assertEqual(data.testValue.expectValue.parentWidthAfter);
          expect(targetRectAfter.right - referenceRect.right)
            .assertEqual(data.testValue.expectValue.parentWidthAfter);
          expect(referenceRect.left - targetRectAfter.left)
            .assertEqual(data.testValue.expectValue.parentWidthAfter);
        }
      } else {
        //Verify the width size of the target component.
        let targetRectAfterWidth = targetRectAfter.right - targetRectAfter.left;
        console.info('[' + data.caseTag + '] targetRectAfterWidth:' + targetRectAfterWidth);

        //Verify the height size of the target component.
        let targetRectAfterHeight = targetRectAfter.bottom - targetRectAfter.top;
        let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);

        console.info('[' + data.caseTag + '] targetRectAfterHeight:' + targetRectAfterHeight);
        console.info('[' + data.caseTag + '] targetRectAfterWidth:' + targetRectAfterWidth);

        //Confirm that the size attribute values have been successfully set.
        expect(viewObj.$attrs.padding).assertEqual(data.testValue.expectValue.padding);
        if (data.testValue.describe == 'SetStringPercent') {
          //Confirm that the calculated value is consistent with the expected value.
          let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
          expect(viewObj.$attrs.padding).assertEqual(data.testValue.expectValue.padding);
          expect(targetRectAfterWidth - targetRectBeforeWidth)
            .assertEqual((data.testValue.expectValue.parentWidthAfter) * 2);
          expect(targetRectAfterHeight - targetRectBeforeHeight)
            .assertEqual((data.testValue.expectValue.parentWidthAfter) * 2);
        } else {
          //Verify if other methods were successful.
          expect(targetRectAfterWidth - targetRectBeforeWidth)
            .assertEqual(data.testValue.expectValue.left + data.testValue.expectValue.right);
          expect(targetRectAfterHeight - targetRectBeforeHeight)
            .assertEqual(data.testValue.expectValue.top + data.testValue.expectValue.bottom);
        }
      }
    })
  })
}