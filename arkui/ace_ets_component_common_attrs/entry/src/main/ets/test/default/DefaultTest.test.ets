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

export default function defaultTest() {

  //Component to be tested
  let supportView = [
    'AlphabetIndexer',
    'Blank',
    'Button',
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
    //'Menu',
    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'RichText',
    'ScrollBar',
    'Search',
    //'Select',
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
    'Badge',
    'Column',
    'ColumnSplit',
    'Counter',
    'Flex',
    'FlowItem',
    'GridRow',
    //'GridCol',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    //'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'WaterFlow',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape'
  ]

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig = {
    testName: 'testDefault',
    pageName: 'DefaultPage',
    pageUrl: 'MainAbility/pages/default/DefaultPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues = [{
    describe: 'Padding',
    exceptView: ['AlphabetIndexer', 'Button', 'TextArea', 'TextInput', 'Menu', 'RichText'],
    expectValue: {
      padding: '0.00vp'
    }
  }, {
    describe: 'Margin',
    exceptView: ['Checkbox', 'CheckboxGroup', 'Radio', 'Search', 'Toggle', 'RichText', 'RowSplit'],
    expectValue: {
      margin: '0.00vp'
    }
  }, {
    describe: 'ConstraintSize',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      constraintSize: {
        'minWidth': '0.00vp', 'minHeight': '0.00vp', 'maxWidth': 'Infinityvp', 'maxHeight': 'Infinityvp'
      }
    }
  }, {
    describe: 'LayoutWeight',
    exceptView: ['Web'],
    expectValue: {
      layoutWeight: 0
    }
  }, {
    describe: 'MarkAnchor',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      markAnchor: {
        x: '', y: ''
      }
    }
  }, {
    describe: 'Offset',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      offset: {
        x: '', y: ''
      }
    }
  }]

  describe('DefaultTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      if (data.testValue.describe == 'Padding') {
        // Test padding defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.padding:' + data.viewObj.$attrs.padding);
        expect(data.viewObj.$attrs.padding).assertEqual(data.testValue.expectValue.padding);
      } else if (data.testValue.describe == 'Margin') {
        // Test margin defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.margin:' + data.viewObj.$attrs.margin);
        expect(data.viewObj.$attrs.margin).assertEqual(data.testValue.expectValue.margin);
      } else if (data.testValue.describe == 'ConstraintSize') {
        // Test constraintSize defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.constraintSize:' + data.viewObj.$attrs.constraintSize);
        expect(data.viewObj.$attrs.constraintSize)
          .assertEqual(JSON.stringify(data.testValue.expectValue.constraintSize));
      } else if (data.testValue.describe == 'LayoutWeight') {
        // Test layoutWeight defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.layoutWeight:' + data.viewObj.$attrs.layoutWeight);
        expect(data.viewObj.$attrs.layoutWeight).assertEqual(data.testValue.expectValue.layoutWeight);
      } else if (data.testValue.describe == 'MarkAnchor') {
        // Test markAnchor defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.x:' + data.viewObj.$attrs.markAnchor.x);
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.y:' + data.viewObj.$attrs.markAnchor.y);
        expect(data.viewObj.$attrs.markAnchor.x).assertEqual(data.testValue.expectValue.markAnchor.x);
        expect(data.viewObj.$attrs.markAnchor.y).assertEqual(data.testValue.expectValue.markAnchor.y);
      } else if (data.testValue.describe == 'Offset') {
        // Test offset defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.x:' + data.viewObj.$attrs.offset.x);
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.y:' + data.viewObj.$attrs.offset.y);
        expect(data.viewObj.$attrs.offset.x).assertEqual(data.testValue.expectValue.offset.x);
        expect(data.viewObj.$attrs.offset.y).assertEqual(data.testValue.expectValue.offset.y);
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
        + data.pageConfig.componentKey);
      }
    });
  })
}