/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import getWithUniqueId from './ComponentSnapshotByUniqueId/getWithUniqueId.test';

import GetChangedPointerId from './GetChangedPointerId/GetChangedPointerId.test';
import componentSnapshot from './componentSnapshot/componentSnapshot.test';
import longpressGestureTest from './isFingerCountLimited/LongPressGesture.test';
import panGestureTest from './isFingerCountLimited/PanGesture.test';
import pinchGestureTest from './isFingerCountLimited/PinchGesture.test';
import rotationGestureTest from './isFingerCountLimited/RotationGesture.test';
import swipeGestureTest from './isFingerCountLimited/SwipeGesture.test';
import tapGestureTest from './isFingerCountLimited/TapGesture.test';
import setKeyProcessingModeTest from './setKeyProcessingModeTest/setKeyProcessingModeTest.test';
import SnapshotOptions_region from './SnapshotOptions_region/SnapshotOptions_region.test';

export default function testsuite() {
  getWithUniqueId();
  GetChangedPointerId();
  componentSnapshot();
  longpressGestureTest();
  panGestureTest();
  pinchGestureTest();
  rotationGestureTest();
  swipeGestureTest();
  tapGestureTest();
  setKeyProcessingModeTest();
  SnapshotOptions_region();
}