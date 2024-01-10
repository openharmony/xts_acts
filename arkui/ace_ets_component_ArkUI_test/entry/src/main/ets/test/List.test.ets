/**
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
import extendTrackTest from './Track/extendTrackTest.test.ets';
import localTrackTest from './Track/localTrackTest.test.ets';
import provideTrackTest from './Track/provideTrackTest.test.ets';
import StateTrackTest from './Track/StateTrackTest.test.ets';
import nestTrackTest from './Track/nestTrackTest.test.ets';
import storageTrackTest from './Track/storageTrackTest.test.ets';
import GestureClick from './GestureRelatedTest/GestureClick.test.ets'
import GestureContiune from './GestureRelatedTest/GestureContiune.test.ets'
import GestureDrag from './GestureRelatedTest/GestureDrag.test.ets'
import GestureIsSystemGesture from './GestureRelatedTest/GestureIsSystemGesture.test.ets'
import GestureLongPressGesture from './GestureRelatedTest/GestureLongPressGesture.test.ets'
import GesturePanGesture from './GestureRelatedTest/GesturePanGesture.test.ets'
import GesturePinchGesture from './GestureRelatedTest/GesturePinchGesture.test.ets'
import GestureReject from './GestureRelatedTest/GestureReject.test.ets'
import GestureRotationGesture from './GestureRelatedTest/GestureRotationGesture.test.ets'
import GestureSwipeGesture from './GestureRelatedTest/GestureSwipeGesture.test.ets'
import GestureTap from './GestureRelatedTest/GestureTap.test.ets'
import GestureTapGesture from './GestureRelatedTest/GestureTapGesture.test.ets'
import provideBrother1 from './ProvideTest/provideBrother1.test.ets'
import provideBrother2 from './ProvideTest/provideBrother2.test.ets'
import provideComponent1 from './ProvideTest/provideComponent1.test.ets'
import provideComponent2 from './ProvideTest/provideComponent2.test.ets'
import provideParent2 from './ProvideTest/provideParent2.test.ets'
import provideParent3 from './ProvideTest/provideParent3.test.ets'
import provideParent4 from './ProvideTest/provideParent4.test.ets'
import provideParent5 from './ProvideTest/provideParent5.test.ets'
import provideParent6 from './ProvideTest/provideParent6.test.ets'
export default function testsuite() {
  extendTrackTest()
  localTrackTest()
  provideTrackTest()
  StateTrackTest()
  nestTrackTest()
  storageTrackTest()
  GestureClick();
  GestureContiune();
  GestureDrag();
  GestureIsSystemGesture();
  GestureLongPressGesture();
  GesturePanGesture();
  GesturePinchGesture();
  GestureReject();
  GestureRotationGesture();
  GestureSwipeGesture();
  GestureTap();
  GestureTapGesture();
  provideBrother1()
  provideBrother2()
  provideComponent1()
  provideComponent2()
  provideParent2()
  provideParent3()
  provideParent4()
  provideParent5()
  provideParent6()
}