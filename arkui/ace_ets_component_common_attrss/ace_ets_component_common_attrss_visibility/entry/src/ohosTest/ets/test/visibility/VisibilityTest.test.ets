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

import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetComponentHeight: number = 0;
  targetComponentWidth: number = 0;
  referenceComponentKey: string = '';
  parentComponentKey: string = '';
}

class TestValues {
  describe: string = '';
  setValue?: Visibility;
  expectValue: ESObject;
}

export default function visibilityTest() {
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
    //'Navigation',
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
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'ColumnSplit',
    'Counter',
    'Flex',
    //'FlowItem',
    'GridCol',
    'GridRow',
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
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    'WaterFlow'
  ]
  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;

  let pageConfig: PageConfig = {
    testName: 'testVisibility',
    pageName: 'VisibilityPage',
    pageUrl: 'MainAbility/pages/visibility/VisibilityPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey'
  }


  let testValues: TestValues[] = [{
    //    describe: 'SetNone',
    //    setValue: Visibility.None,
    //    expectValue: {
    //      visibility: 'Visibility.None',
    //      width: 0,
    //      height: 0
    //    }
    //  }, {
    describe: 'SetHidden',
    setValue: Visibility.Hidden,
    expectValue: {
      visibility: 'Visibility.Hidden'
    }
  }, {
    describe: 'SetVisible',
    setValue: Visibility.Visible,
    expectValue: {
      visibility: 'Visibility.Visible'
    }
  }]

  describe('VisibilityTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      AttrsManager.change(data.caseTag, Visibility.Visible);
      await Utils.sleep(1000);

      //Reference component area information before getting case execution
      console.info('[' + data.caseTag + '] get referenceComponent rect before position changed.');
      let referenceRectBefore: ESObject = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

      //Reference Component Previous Size
      let referenceBeforeHeight = referenceRectBefore.bottom - referenceRectBefore.top;
      let referenceBeforeWidth = referenceRectBefore.right - referenceRectBefore.left;

      //Target component area information before getting case execution
      console.info('[' + data.caseTag + '] get Component rect before position changed.');
      let rectBefore: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);

      //Target Component Previous Size
      let rectBeforeHeight = rectBefore.bottom - rectBefore.top;
      let rectBeforeWidth = rectBefore.right - rectBefore.left;

      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Get reference component and target component area information
      let rectAfter: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);
      let referenceRectAfter: ESObject = Utils.getComponentRect(data.pageConfig.referenceComponentKey);
      let parentComponentRect: ESObject = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      //Component width and height calculation
      let height = rectAfter.bottom - rectAfter.top;
      let width = rectAfter.right - rectAfter.left;
      let referenceHeight = referenceRectAfter.bottom - referenceRectAfter.top;
      let referenceWidth = referenceRectAfter.right - referenceRectAfter.left;
      console.info('[' + data.caseTag + ']' + 'width is:' + JSON.stringify(width));
      console.info('[' + data.caseTag + ']' + 'height is:' + JSON.stringify(height));
      console.info('[' + data.caseTag + ']' + 'rectBeforeWidth is:' + JSON.stringify(rectBeforeWidth));
      console.info('[' + data.caseTag + ']' + 'rectBeforeHeight is:' + JSON.stringify(rectBeforeHeight));
      if ('SetNone' == data.testValue.describe) {
        if ((data.pageConfig.componentKey == 'FlowItem') || (data.pageConfig.componentKey == 'GridItem')) {
          expect(referenceRectAfter.top).assertEqual(referenceRectBefore.top);
          expect(referenceRectAfter.left).assertEqual(referenceRectBefore.left);
        } else if ((data.pageConfig.componentKey == 'MenuItem')
          || (data.pageConfig.componentKey == 'MenuItemGroup')
          || (data.pageConfig.componentKey == 'ListItem')
          || (data.pageConfig.componentKey == 'ListItemGroup')
          || (data.pageConfig.componentKey == 'GridCol')) {
          expect(referenceRectAfter.top).assertEqual(rectBefore.top);
          expect(referenceRectAfter.left).assertEqual(rectBefore.left);
        } else {
          //The left side of the reference component coincides with the left side of the parent component
          expect(referenceRectAfter.left).assertEqual(parentComponentRect.left);
        }
        expect(width).assertEqual(data.testValue.expectValue.width);
        expect(height).assertEqual(data.testValue.expectValue.height);
      } else {
        expect(referenceRectAfter.top).assertEqual(referenceRectBefore.top);
        expect(referenceRectAfter.left).assertEqual(referenceRectBefore.left);
        console.info('[' + data.caseTag + ']' + 'height is:' + height);
        console.info('[' + data.caseTag + ']' + 'width is:' + width);
        //Expect the size of the component to remain the same before and after
        expect(width).assertEqual(rectBeforeWidth);
        expect(height).assertEqual(rectBeforeHeight);
        //Component size not equal to 0
        expect(width > 0).assertEqual(true);
        expect(height > 0).assertEqual(true);
      }
      let rect: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + ']' + 'visibility is:' + rect.$attrs.visibility);
      expect(rect.$attrs.visibility).assertEqual(data.testValue.expectValue.visibility);
      //The expected size of the reference component remains unchanged before and after
      expect(referenceHeight).assertEqual(referenceBeforeHeight);
      expect(referenceWidth).assertEqual(referenceBeforeWidth);
    });
  })
}