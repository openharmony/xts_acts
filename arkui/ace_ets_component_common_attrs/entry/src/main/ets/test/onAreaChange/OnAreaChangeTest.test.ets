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
import { describe, expect } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { AttrsManager } from '../../MainAbility/common/AttrsManager';

export default function onAreaChangeTest() {

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
    //'MenuItemGroup',
    'Navigation',
    'NavRouter',
    //'NavDestination',
    'PatternLock',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    //'RichText',
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
    'Badge',
    'Column',
    'ColumnSplit',
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
    'Shape',
    'Counter'
  ]

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;
  let parentMargin = 30;
  let parentKey = 'parentKey'
  let compareButtonKey = 'compareButtonKey'
  let compareOldTextKey = 'compareOldTextKey'
  let compareNewTextKey = 'compareNewTextKey'

  let pageConfig = {
    testName: 'testOnAreaChange',
    pageName: 'OnAreaChangePage',
    pageUrl: 'MainAbility/pages/onAreaChange/OnAreaChangePage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentMargin: parentMargin,
    parentKey: parentKey,
    compareButtonKey: compareButtonKey,
    compareOldTextKey: compareOldTextKey,
    compareNewTextKey: compareNewTextKey
  }

  //Test content and expected results
  let testValues = [{
    describe: 'SetMove',
    setValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    },
    expectValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    }
  }, {
    describe: 'SetWidthHeight',
    setValue: {
      width: 60,
      height: 60
    },
    expectValue: {
      width: 60,
      height: 60
    }
  }, {
    describe: 'SetOffset',
    exceptView: ['RichText'],
    setValue: {
      offset: {
        x: 50, y: 50
      }
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp', left: vp2px(50), top: vp2px(50)
    }
  }]

  describe('OnAreaChangeTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async data => {
      //Get Information about the location of the target component before the change
      let parentRectBefore = Utils.getComponentRect(data.pageConfig.parentKey);
      let targetRectBefore = Utils.getComponentRect(data.pageConfig.componentKey);
      if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
        console.info('[' + data.caseTag + '] Find Parent Component Before');
        let parentComponent = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[1];
        parentComponent.$children.forEach(element => {
          if ('Swiper' == element.$type) {
            parentRectBefore = Utils.getComponentRectByObj(element);
          }
        });
      }
      console.info('[' + data.caseTag + '] targetRectBefore: ' + JSON.stringify(targetRectBefore));
      console.info('[' + data.caseTag + '] parentRectBefore: ' + JSON.stringify(parentRectBefore));

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //After the change, obtain the location information of the target component and parent container
      let parentRectAfter = Utils.getComponentRect(data.pageConfig.parentKey);
      let targetRectAfter = Utils.getComponentRect(data.pageConfig.componentKey);
      let RectAfter = parentRectAfter
      let compareOldTextComponent = Utils.getComponentByKey(data.pageConfig.compareOldTextKey);
      let compareNewTextComponent = Utils.getComponentByKey(data.pageConfig.compareNewTextKey);
      if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
        console.info('[' + data.caseTag + '] Find Parent Component After');
        let parentComponent = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[1];
        parentComponent.$children.forEach(element => {
          if ('Swiper' == element.$type) {
            parentRectAfter = Utils.getComponentRectByObj(element);
          }
        });
      }
      console.info('[' + data.caseTag + '] compareOldTextComponent.$attrs.content: ' +
      compareOldTextComponent.$attrs.content);
      console.info('[' + data.caseTag + '] compareNewTextComponent.$attrs.content: ' +
      compareNewTextComponent.$attrs.content);
      console.info('[' + data.caseTag + '] targetRectAfter: ' + JSON.stringify(targetRectAfter));

      if (data.testValue.describe == 'SetMove') {
        let compareButtonRectAfter = Utils.getComponentRect(data.pageConfig.compareButtonKey);
        console.info('[' + data.caseTag + '] compareButtonRectAfter: ' + JSON.stringify(compareButtonRectAfter));
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        expect(px2vp(compareButtonRectAfter.right - compareButtonRectAfter.left))
          .assertEqual(data.testValue.expectValue.compareButtonWidth);
        expect(px2vp(compareButtonRectAfter.bottom - compareButtonRectAfter.top))
          .assertEqual(data.testValue.expectValue.compareButtonHeight);
        await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
          targetRectAfter, parentRectBefore, parentRectAfter);
      } else if (data.testValue.describe == 'SetWidthHeight') {
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        if ((data.pageConfig.componentKey == 'GridCol') || (data.pageConfig.componentKey == 'ListItemGroup')) {
          expect(px2vp(targetRectAfter.bottom - targetRectAfter.top)).assertEqual(data.testValue.expectValue.height);
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
          expect(px2vp(RectAfter.right - RectAfter.left)).assertEqual(data.testValue.expectValue.width);
          expect(px2vp(RectAfter.bottom - RectAfter.top)).assertEqual(data.testValue.expectValue.height);
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else {
          expect(px2vp(targetRectAfter.right - targetRectAfter.left)).assertEqual(data.testValue.expectValue.width);
          expect(px2vp(targetRectAfter.bottom - targetRectAfter.top)).assertEqual(data.testValue.expectValue.height);
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        }
      } else if (data.testValue.describe == 'SetOffset') {
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.offset.x: ' + viewObj.$attrs.offset.x);
        expect(viewObj.$attrs.offset.x).assertEqual(data.testValue.expectValue.x);
        console.info('[' + data.caseTag + '] viewObj.$attrs.offset.y: ' + viewObj.$attrs.offset.y);
        expect(viewObj.$attrs.offset.y).assertEqual(data.testValue.expectValue.y);
        expect(Number(targetRectAfter.left - targetRectBefore.left).toFixed(2))
          .assertEqual(Number(data.testValue.expectValue.left).toFixed(2));
        expect(Number(targetRectAfter.top - targetRectBefore.top).toFixed(2))
          .assertEqual(Number(data.testValue.expectValue.top).toFixed(2));
        expect(compareOldTextComponent.$attrs.content).assertEqual('');
        expect(compareNewTextComponent.$attrs.content).assertEqual('');
      }
    });
  })

  async function checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
                              targetRectAfter, parentRectBefore, parentRectAfter) {
    //Check that the position information before the change is correct
    console.info('[' + data.caseTag + '] checkResults');
    expect(compareOldTextComponent.$attrs.content != '').assertEqual(true);
    expect(compareNewTextComponent.$attrs.content != '').assertEqual(true);
    let compareOldTextObj = JSON.parse(compareOldTextComponent.$attrs.content);
    let compareNewTextObj = JSON.parse(compareNewTextComponent.$attrs.content);
    console.info('[' + data.caseTag + '] compareOldTextObj.width: ' + compareOldTextObj.width);
    expect(compareOldTextObj.width).assertEqual(px2vp(targetRectBefore.right - targetRectBefore.left));
    console.info('[' + data.caseTag + '] compareOldTextObj.height: ' + compareOldTextObj.height);
    expect(compareOldTextObj.height).assertEqual(px2vp(targetRectBefore.bottom - targetRectBefore.top));
    console.info('[' + data.caseTag + '] compareOldTextObj.position.x: ' + compareOldTextObj.position.x);
    expect(compareOldTextObj.position.x).assertEqual(px2vp(targetRectBefore.left - parentRectBefore.left));
    console.info('[' + data.caseTag + '] compareOldTextObj.position.y: ' + compareOldTextObj.position.y);
    expect(compareOldTextObj.position.y).assertEqual(px2vp(targetRectBefore.top - parentRectBefore.top));
    console.info('[' + data.caseTag + '] compareOldTextObj.globalPosition.x: ' + compareOldTextObj.globalPosition.x);
    expect(compareOldTextObj.globalPosition.x).assertEqual(px2vp(targetRectBefore.left));
    console.info('[' + data.caseTag + '] compareOldTextObj.globalPosition.y: ' + compareOldTextObj.globalPosition.y);
    expect(compareOldTextObj.globalPosition.y).assertEqual(px2vp(targetRectBefore.top));

    //Check whether the changed position information is correct
    console.info('[' + data.caseTag + '] compareNewTextObj.width: ' + compareNewTextObj.width);
    expect(compareNewTextObj.width).assertEqual(px2vp(targetRectAfter.right - targetRectAfter.left));
    console.info('[' + data.caseTag + '] compareNewTextObj.height: ' + compareNewTextObj.height);
    expect(compareNewTextObj.height).assertEqual(px2vp(targetRectAfter.bottom - targetRectAfter.top));
    console.info('[' + data.caseTag + '] compareNewTextObj.position.x: ' + compareNewTextObj.position.x);
    expect(compareNewTextObj.position.x).assertEqual(px2vp(targetRectAfter.left - parentRectAfter.left));
    console.info('[' + data.caseTag + '] compareNewTextObj.position.y: ' + compareNewTextObj.position.y);
    expect(compareNewTextObj.position.y).assertEqual(px2vp(targetRectAfter.top - parentRectAfter.top));
    console.info('[' + data.caseTag + '] compareNewTextObj.globalPosition.x: ' + compareNewTextObj.globalPosition.x);
    expect(compareNewTextObj.globalPosition.x).assertEqual(px2vp(targetRectAfter.left));
    console.info('[' + data.caseTag + '] compareNewTextObj.globalPosition.y: ' + compareNewTextObj.globalPosition.y);
    expect(compareNewTextObj.globalPosition.y).assertEqual(px2vp(targetRectAfter.top));
  }
}