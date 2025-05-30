/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

export const testDatePickerMode: (a: string) => void;

export const textPickerEnableHapticFeedback: (a: string) => void;

export const datePickerEnableHapticFeedback: (a: string) => void;

export const swiperIndicatorTest: (a: string) => void;

export const testExpectedFrameRateRangeCallback: (a: string) => void;

export const DragEndPendingTest_001: () => string[];

export const VisibleAreaEventOptionsTest_a: () => string[];

export const VisibleAreaEventOptionsTest_b: () => string[];

export const VisibleAreaEventOptionsTest_c: () => string[];

export const VisibleAreaEventOptionsTest_d: () => string[];

export const TestGestureInterrupter: (a: string) => string[];

export const XComponentCreateNativeNode: (content: NodeContent, tag: string, context: object) => void;
export const XComponentAttachToMainTree: () => void;
export const XComponentDetachFromMainTree: () => void;
export const XComponentDispose: () => void;
export const XComponentSetUserData: () => void;
export const XComponentGetUserData: () => string;
export const XComponentInitialize: () => number;
export const XComponentFinalize: () => number;
export const XComponentRemoveSurfaceCallback: () => number;