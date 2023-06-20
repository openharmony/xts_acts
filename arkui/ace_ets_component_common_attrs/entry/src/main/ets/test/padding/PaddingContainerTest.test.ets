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
  //A list of components that support padding attributes is required.
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

  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig = {
    testName: 'testPaddingContainer',
    pageName: 'PaddingContainerPage',
    pageUrl: 'MainAbility/pages/padding/PaddingContainerPage',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues = [
    {
      describe: 'SetPadding',
      setValue: {
        padding: {
          top: 200,
          right: 100,
          bottom: 100,
          left: 100
        }
      },
      expectValue: {
        padding: {
          'top': '200.00vp', 'right': '100.00vp', 'bottom': '100.00vp', 'left': '100.00vp'
        },
        top: vp2px(200),
        right: vp2px(100),
        bottom: vp2px(100),
        left: vp2px(100)
      }
    }, {
    describe: 'SetPaddingTop',
    setValue: {
      padding: {
        top: 200
      }
    },
    expectValue: {
      padding: {
        'top': '200.00vp', 'right': '0.00vp', 'bottom': '0.00vp', 'left': '0.00vp'
      },
      top: vp2px(200),
      right: vp2px(0),
      bottom: vp2px(0),
      left: vp2px(0)
    }
  }, {
    describe: 'SetPaddingRight',
    setValue: {
      padding: {
        right: 200
      }
    },
    expectValue: {
      padding: {
        'top': '0.00vp', 'right': '200.00vp', 'bottom': '0.00vp', 'left': '0.00vp'
      },
      top: vp2px(0),
      right: vp2px(200),
      bottom: vp2px(0),
      left: vp2px(0)
    }
  }, {
    describe: 'SetPaddingBottom',
    setValue: {
      padding: {
        bottom: 200
      }
    },
    expectValue: {
      padding: {
        'top': '0.00vp', 'right': '0.00vp', 'bottom': '200.00vp', 'left': '0.00vp'
      },
      top: vp2px(0),
      right: vp2px(0),
      bottom: vp2px(200),
      left: vp2px(0)
    }
  }, {
    describe: 'SetPaddingLeft',
    setValue: {
      padding: {
        left: 200
      }
    },
    expectValue: {
      padding: {
        'top': '0.00vp', 'right': '0.00vp', 'bottom': '0.00vp', 'left': '200.00vp'
      },
      top: vp2px(0),
      right: vp2px(0),
      bottom: vp2px(0),
      left: vp2px(200)
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingContainerTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async data => {
      //Modify the reference component properties.
      AttrsManager.change(data.caseTag, {
        padding: {
          left: 0, right: 0, top: 0, bottom: 0
        }
      });
      await Utils.sleep(1000);

      //Obtain dimensional information for reference components.
      let targetRectBefore = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verify the width size of the reference component.
      let targetRectBeforeWidth = targetRectBefore.right - targetRectBefore.left;

      //Verify the height size of the reference component.
      let targetRectBeforeHeight = targetRectBefore.bottom - targetRectBefore.top;

      //Modify the target component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain dimensional information for target components.
      let targetRectAfter = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verification method for special reference components
      if (data.pageConfig.componentKey == 'RelativeContainer' || data.pageConfig.componentKey == 'RowSplit'
      || data.pageConfig.componentKey == 'ListItemGroup' || data.pageConfig.componentKey == 'List'
      || data.pageConfig.componentKey == 'ColumnSplit' || data.pageConfig.componentKey == 'Flex'
      || data.pageConfig.componentKey == 'GridCol' || data.pageConfig.componentKey == 'FlowItem'
      || data.pageConfig.componentKey == 'GridRow' || data.pageConfig.componentKey == 'Panel'
      || data.pageConfig.componentKey == 'SideBarContainer' || data.pageConfig.componentKey == 'TabContent'
      || data.pageConfig.componentKey == 'WaterFlow') {
        //Obtain the size information of the reference component.
        let targetRect = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

        console.info('[' + data.caseTag + '] targetRect.top - targetRectAfter.top:'
        + (targetRect.top - targetRectAfter.top));
        console.info('[' + data.caseTag + '] targetRectAfter.bottom - targetRect.bottom:'
        + (targetRectAfter.bottom - targetRect.bottom));
        console.info('[' + data.caseTag + '] targetRectAfter.right - targetRect.right:'
        + (targetRectAfter.right - targetRect.right));
        console.info('[' + data.caseTag + '] targetRect.left - targetRectAfter.left:'
        + (targetRect.left - targetRectAfter.left));

        //Verification method for special reference components.
        if (data.testValue.describe == 'SetPadding') {
          expect(targetRect.top - targetRectAfter.top)
            .assertEqual(data.testValue.expectValue.top);
          expect(targetRectAfter.bottom - targetRect.bottom)
            .assertEqual(data.testValue.expectValue.bottom);
          expect(targetRectAfter.right - targetRect.right)
            .assertEqual(data.testValue.expectValue.right);
          expect(targetRect.left - targetRectAfter.left)
            .assertEqual(data.testValue.expectValue.left);
        } else if (data.testValue.describe == 'SetPaddingTop') {
          expect(targetRect.top - targetRectAfter.top)
            .assertEqual(data.testValue.expectValue.top);
        } else if (data.testValue.describe == 'SetPaddingBottom') {
          expect(targetRectAfter.bottom - targetRect.bottom)
            .assertEqual(data.testValue.expectValue.bottom);
        } else if (data.testValue.describe == 'SetPaddingRight') {
          expect(targetRectAfter.right - targetRect.right)
            .assertEqual(data.testValue.expectValue.right);
        } else if (data.testValue.describe == 'SetPaddingLeft') {
          expect(targetRect.left - targetRectAfter.left)
            .assertEqual(data.testValue.expectValue.left);
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
        if (data.testValue.describe == 'SetPadding') {
          expect(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top))
            .assertEqual(data.testValue.expectValue.top);
          expect(targetRectAfter.bottom - referenceRect.bottom)
            .assertEqual(data.testValue.expectValue.bottom);
          expect(targetRectAfter.right - referenceRect.right)
            .assertEqual(data.testValue.expectValue.right);
          expect(referenceRect.left - targetRectAfter.left)
            .assertEqual(data.testValue.expectValue.left);
        } else if (data.testValue.describe == 'SetPaddingTop') {
          expect(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top))
            .assertEqual(data.testValue.expectValue.top);
        } else if (data.testValue.describe == 'SetPaddingBottom') {
          expect(targetRectAfter.bottom - referenceRect.bottom)
            .assertEqual(data.testValue.expectValue.bottom);
        } else if (data.testValue.describe == 'SetPaddingRight') {
          expect(targetRectAfter.right - referenceRect.right)
            .assertEqual(data.testValue.expectValue.right);
        } else if (data.testValue.describe == 'SetPaddingLeft') {
          expect(referenceRect.left - targetRectAfter.left)
            .assertEqual(data.testValue.expectValue.left);
        }
      } else {
        //Verify the width size of the target component.
        let targetRectAfterWidth = targetRectAfter.right - targetRectAfter.left;

        //Verify the height size of the target component.
        let targetRectAfterHeight = targetRectAfter.bottom - targetRectAfter.top;
        let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);

        //Confirm that the size attribute values have been successfully set.
        expect(viewObj.$attrs.padding).assertEqual(JSON.stringify(data.testValue.expectValue.padding));

        console.info('[' + data.caseTag + '] targetRectBeforeWidth:' + targetRectBeforeWidth);
        console.info('[' + data.caseTag + '] targetRectBeforeHeight:' + targetRectBeforeHeight);
        console.info('[' + data.caseTag + '] referenceRectAfterWidth:' + targetRectAfterWidth);
        console.info('[' + data.caseTag + '] referenceRectAfterHeight:' + targetRectAfterHeight);

        //Confirm that the calculated value is consistent with the expected value.
        expect(targetRectAfterWidth - targetRectBeforeWidth)
          .assertEqual(data.testValue.expectValue.left + data.testValue.expectValue.right);
        expect(targetRectAfterHeight - targetRectBeforeHeight)
          .assertEqual(data.testValue.expectValue.top + data.testValue.expectValue.bottom);
      }
    })
  })
}