/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import ArraylistTest1 from "./ArrayList/ArrayList1.test";
import ArraylistTest2 from "./ArrayList/ArrayList2.test";
import HashMapTest1 from "./HashMap/HashMap1.test";
import HashMapTest2 from "./HashMap/HashMap2.test";
import HashSetTest1 from "./HashSet/HashSet1.test";
import LightWeightMapTest1 from "./LightWeightMap/LightWeightMap1.test";
import LightWeightMapTest2 from "./LightWeightMap/LightWeightMap2.test";
import LightWeightSetTest1 from "./LightWeightSet/LightWeightSet1.test";
import LightWeightSetTest2 from "./LightWeightSet/LightWeightSet2.test";
import PlainArrayTest1 from "./PlainArray/PlainArray1.test";
import PlainArrayTest2 from "./PlainArray/PlainArray2.test";
import ListTest1 from "./List/List1.test";
import DequeTest1 from "./Deque/Deque1.test";
import LinkedListTest1 from "./LinkedList/LinkedList1.test";

export default function testsuite() {
  ArraylistTest1();
  ArraylistTest2();
  HashMapTest1();
  HashMapTest2();
  HashSetTest1();
  LightWeightMapTest1();
  LightWeightMapTest2();
  LightWeightSetTest1();
  LightWeightSetTest2();
  PlainArrayTest1();
  PlainArrayTest2();
  ListTest1();
  DequeTest1()
  LinkedListTest1();

}
