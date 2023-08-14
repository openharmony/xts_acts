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
import listItem_SizeChange from './List/List_Space/ListItemChange/ListItem_SizeChange.test.ets';
import listItem_Margin from './List/List_Space/ListItemChange/ListItem_Margin.test.ets';
import listItem_Padding from './List/List_Space/ListItemChange/ListItem_Padding.test.ets';
import listItem_PadMar from './List/List_Space/ListItemChange/ListItem_PadMar.test.ets';
import listItem_Visibility from './List/List_Space/ListItemChange/ListItem_Visibility.test.ets';
import listItem_Position from './List/List_Space/ListItemChange/ListItem_Position.test.ets';
import listItem_Offset from './List/List_Space/ListItemChange/ListItem_Offset.test.ets';
import listItem_InSertChange from './List/List_Space/ListItemChange/ListItem_InSertChange.test.ets';
import list_SpaceChangeTest from './List/List_SpaceChange/List_SpaceChange.test';
import list_ListInitialIndex1Test from './List/List_initialIndex/List_ListInitialIndex1.test';
import list_ListInitialIndex2Test from './List/List_initialIndex/List_ListInitialIndex2.test';
import list_ListInitialIndex3Test from './List/List_initialIndex/List_ListInitialIndex3.test';
import list_ListInitialIndex4Test from './List/List_initialIndex/List_ListInitialIndex4.test';
import list_ListInitialIndex5Test from './List/List_initialIndex/List_ListInitialIndex5.test';
import list_ListInitialIndex6Test from './List/List_initialIndex/List_ListInitialIndex6.test';
import List_alignListItem from './List/List_Space/ListChange/List_alignListItem.test';
import List_divider from './List/List_Space/ListChange/List_divider.test';
import List_lanes from './List/List_Space/ListChange/List_lanes.test';
import List_ListDirection from './List/List_Space/ListChange/List_ListDirection.test';
import List_ListSize from './List/List_Space/ListChange/List_ListSize.test';
import List_Margin from './List/List_Space/ListChange/List_Margin.test';
import List_Padding from './List/List_Space/ListChange/List_Padding.test';
import List_PadMar from './List/List_Space/ListChange/List_PadMar.test';
import list_ListFrictionTest from './List/List_attribute/List_ListFriction.test';

export default function testsuite() {
  
  listItem_SizeChange()
  listItem_Margin()
  listItem_Padding()
  listItem_PadMar()
  listItem_Visibility()
  listItem_Position()
  listItem_Offset()
  listItem_InSertChange()
  list_ListInitialIndex1Test();
  list_ListInitialIndex2Test();
  list_ListInitialIndex3Test();
  list_ListInitialIndex4Test();
  list_ListInitialIndex5Test();
  list_ListInitialIndex6Test();
  list_SpaceChangeTest();
  List_alignListItem();
  List_divider();
  List_lanes();
  List_ListDirection();
  List_ListSize();
  List_Margin();
  List_Padding();
  List_PadMar();
  list_ListFrictionTest();
  
}