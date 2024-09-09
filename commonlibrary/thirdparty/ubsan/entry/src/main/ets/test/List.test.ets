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
import AlignmentTest from './Alignment.test';
import BoolTest from './Bool.test';
import Divide0 from './Divide0.test';
import Bounds from './Bounds.test';
import Enum from './Enum.test';
import FloatCastOverflow from './FloatCastOverflow.test';
import PointerOverflow from './PointerOverflow.test';
import ObjectSize from './ObjectSize.test';
import Null from './Null.test';
import NonnullAttribute from './NonnullAttribute.test';
import ReturnNonnullAttribute from './ReturnNonnullAttribute.test';
import Shift from './Shift.test';
import IntegerOverFlow from './IntegerOverFlow.test';
import VlaBound from './VlaBound.test';

export default function testsuite() {
  AlignmentTest();
  BoolTest();
  Divide0();
  Bounds();
  Enum();
  FloatCastOverflow();
  PointerOverflow();
  ObjectSize();
  Null();
  NonnullAttribute();
  ReturnNonnullAttribute();
  Shift();
  IntegerOverFlow();
  VlaBound();
}
