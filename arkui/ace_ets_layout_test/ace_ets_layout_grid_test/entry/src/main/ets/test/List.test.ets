/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

 import Grid_RowCol_TemplateChange from './Grid/GridTemplatesAllSet/GridTemplateChange/Grid_RowCol_TemplateChange.test.ets';
 import Grid_RowCol_GridSize from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_GridSize.test.ets';
 import Grid_RowCol_PadMar from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_PadMar.test.ets';
 import Grid_RowCol_Gap from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_Gap.test.ets';
 import Grid_RowCol_LayoutDirection from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_LayoutDirection.test.ets';
 import Grid_RowCol_maxCount from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_maxCount.test.ets';
 import Grid_RowCol_cellLength from './Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_cellLength.test.ets';
import grid_RowCol_ItemPadMarTest from './Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemPadMar.test';
import grid_RowCol_ItemOffsetTest from './Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemOffset.test';
import grid_RowCol_ItemPositionTest from './Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemPosition.test';
import grid_RowCol_ItemVisibilityTest from './Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemVisibility.test';
import grid_RowCol_ItemContentSizeTest from './Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemContentSize.test';
import grid_RowCol_ItemColumnStartEnd from './Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemColumnStartEnd.test';
import grid_RowCol_ItemRowStartEnd from './Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemRowStartEnd.test';
import grid_GridFrictionTest from './Grid/Grid_attribute/Grid_GridFriction.test';

export default function testsuite() {


  Grid_RowCol_TemplateChange()
  Grid_RowCol_GridSize()
  Grid_RowCol_PadMar()
  Grid_RowCol_Gap()
  Grid_RowCol_LayoutDirection()
  Grid_RowCol_maxCount()
  Grid_RowCol_cellLength()
  grid_RowCol_ItemPadMarTest();
  grid_RowCol_ItemOffsetTest();
  grid_RowCol_ItemPositionTest();
  grid_RowCol_ItemVisibilityTest();
  grid_RowCol_ItemContentSizeTest();
  grid_RowCol_ItemColumnStartEnd()
  grid_RowCol_ItemRowStartEnd()
  grid_GridFrictionTest();

}