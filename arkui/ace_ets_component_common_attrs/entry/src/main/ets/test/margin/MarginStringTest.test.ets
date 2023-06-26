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

import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

export default function marginStringTest() {
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Blank',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Select',
    'Slider',
    'Stepper',
    'StepperItem',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Web',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Badge',
    'Column',
    'ColumnSplit',
    'Counter',
    'Flex',
    'FlowItem',
    'GridRow',
    'GridCol',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'WaterFlow'
  ]

  let pageConfig = {
    testName: 'testMargin',
    pageName: 'MarginPageString',
    pageUrl: 'MainAbility/pages/margin/MarginPageString',
    targetGroupView: 'targetGroupView',
    parentComponentKey: 'parentComponentKey',
    referenceComponentKeyTop: 'referenceComponentKeyTop',
    referenceComponentKeyBottom: 'referenceComponentKeyBottom',
    referenceComponentKeyLeft: 'referenceComponentKeyLeft',
    referenceComponentKeyRight: 'referenceComponentKeyRight',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues = [{
    describe: 'SetStringPercent',
    setValue: {
      margin: '10%'
    },
    expectValue: {
      margin: '10.00%',
      top: '0.10',
      right: '0.10',
      bottom: '0.10',
      left: '0.10'
    }
  }]

  describe('MarginStringTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //component
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);
      //parentComponent
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      //Component margin
      let top = 0;
      let left = 0;
      let right = 0;
      let bottom = 0;
      if ((data.pageConfig.componentKey == 'ListItem')
      || (data.pageConfig.componentKey == 'Blank')
      || (data.pageConfig.componentKey == 'ListItemGroup')) {
        //Reference component
        let rectTop = Utils.getComponentRect(data.pageConfig.referenceComponentKeyTop)
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectTop.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        //Reference component
        let rectTop = Utils.getComponentRect(data.pageConfig.referenceComponentKeyTop)
        //Component to reference component and parent component margin calculation
        top = rect.top - rectTop.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if (data.pageConfig.componentKey == 'StepperItem') {
        //parentComponent
        let rectParent = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0])
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if ((data.pageConfig.componentKey == 'GridCol')
      || (data.pageConfig.componentKey == 'FlowItem')
      || (data.pageConfig.componentKey == 'GridItem')
      || (data.pageConfig.componentKey == 'MenuItem')
      || (data.pageConfig.componentKey == 'MenuItemGroup')) {
        //Component to parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else {
        //Reference component
        let rectTop = Utils.getComponentRect(data.pageConfig.referenceComponentKeyTop);
        let rectBottom = Utils.getComponentRect(data.pageConfig.referenceComponentKeyBottom);
        let rectLeft = Utils.getComponentRect(data.pageConfig.referenceComponentKeyLeft);
        let rectRight = Utils.getComponentRect(data.pageConfig.referenceComponentKeyRight);
        //Component to reference component and parent component margin calculation
        top = rect.top - rectTop.bottom;
        left = rect.left - rectLeft.right;
        right = rectRight.left - rect.right;
        bottom = rectBottom.top - rect.bottom;
      }
      console.info('[' + data.caseTag + ']' + 'top is: ' + top);
      console.info('[' + data.caseTag + ']' + 'left is: ' + left);
      console.info('[' + data.caseTag + ']' + 'right is: ' + right);
      console.info('[' + data.caseTag + ']' + 'bottom is: ' + bottom);
      console.info('[' + data.caseTag + ']' + 'margin is: ' + data.viewObj.$attrs.margin)
      //Parent component width
      let width = rectParent.right - rectParent.left;
      //Ratio of margin to parent component width
      let topPercent = Number(top / width).toFixed(2);
      let leftPercent = Number(left / width).toFixed(2);
      let rightPercent = Number(right / width).toFixed(2);
      let bottomPercent = Number(bottom / width).toFixed(2);
      console.info('[' + data.caseTag + ']' + 'topPercent is: ' + topPercent);
      console.info('[' + data.caseTag + ']' + 'leftPercent is: ' + leftPercent);
      console.info('[' + data.caseTag + ']' + 'rightPercent is: ' + rightPercent);
      console.info('[' + data.caseTag + ']' + 'bottomPercent is: ' + bottomPercent);
      //Confirm if the margin is correct
      expect(data.viewObj.$attrs.margin).assertEqual(data.testValue.expectValue.margin);
      expect(topPercent).assertEqual(data.testValue.expectValue.top);
      expect(rightPercent).assertEqual(data.testValue.expectValue.right);
      expect(bottomPercent).assertEqual(data.testValue.expectValue.bottom);
      expect(leftPercent).assertEqual(data.testValue.expectValue.left);
    });
  })
}