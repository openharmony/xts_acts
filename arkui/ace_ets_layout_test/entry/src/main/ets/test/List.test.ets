/*
 * Copyright (c) 2023-2030 iSoftStone Information Technology (Group) Co.,Ltd.
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
 import flexBase_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexBaseJsunit.test.ets';
 import flexPadding_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexPaddingJsunit.test.ets';
 import flexMargin_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexMarginJsunit.test.ets';
 import flexExceed_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexExceedJsunit.test.ets';
 import flexHeightModify_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexHeightModifyJsunit.test.ets';
 import flexOffset_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexOffsetJsunit.test.ets';
 import flexVisibility_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexVisibilityJsunit.test.ets';
 import flexAlignSelf_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexAlignSelfJsunit.test.ets';
 import flexTextMargin_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexTextMarginJsunit.test.ets';
 import Row_Space from './Row/spaceChanged/Row_Space.test.ets';
 import Column_Space from './Column/spaceChanged/Column_Space.test.ets';
 import Grid_RowCol_TemplateChange from './Grid/GridTemplatesAllSet/GridTemplateChange/Grid_RowCol_TemplateChange.test.ets';
 import Grid_RowCol_GridSize from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_GridSize.test.ets';
 import Grid_RowCol_PadMar from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_PadMar.test.ets';
 import Grid_RowCol_Gap from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_Gap.test.ets';
 import Grid_RowCol_LayoutDirection from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_LayoutDirection.test.ets';
 import Grid_RowCol_maxCount from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_maxCount.test.ets';
 import Grid_RowCol_cellLength from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_cellLength.test.ets';
export default function testsuite() {
  flexBase_AutoJsunit()
  flexPadding_AutoJsunit()
  flexMargin_AutoJsunit()
  flexExceed_AutoJsunit()
  flexHeightModify_AutoJsunit()
  flexOffset_AutoJsunit()
  flexVisibility_AutoJsunit()
  flexAlignSelf_AutoJsunit()
  flexTextMargin_AutoJsunit()
  Row_Space()
  Column_Space()
  Grid_RowCol_TemplateChange()
  Grid_RowCol_GridSize()
  Grid_RowCol_PadMar()
  Grid_RowCol_Gap()
  Grid_RowCol_LayoutDirection()
  Grid_RowCol_maxCount()
  Grid_RowCol_cellLength()
}