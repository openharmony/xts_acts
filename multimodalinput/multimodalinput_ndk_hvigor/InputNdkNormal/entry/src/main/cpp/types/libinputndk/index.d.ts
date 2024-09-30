/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
export const CreateKeyState: () => number;
export const DestroyKeyState: () => number;
export const SetKeyCode: (a: number) => number;
export const SetKeyPressed: (a: number) => number;
export const SetKeySwitch: (a: number) => number;
export const GetKeyPressed: (a: number) => number;
export const GetKeySwitch: (a: number) => number;
export const GetKeyState: (a: number) => number;
export const CreateKeyEvent: () => number;
export const InjectKeyEvent: () => number;
export const DestroyKeyEvent: () => number;
export const GetKeyEventAction: () => number;
export const GetKeyEventActionDestroy: () => number;
export const GetKeyEventKeyCode: () => number;
export const GetKeyEventKeyCodeDestroy: () => number;
export const GetKeyEventActionTime: (a: number) => number;
export const GetKeyEventActionTimeDestroy: (a: number) => number;
export const createTouchEvent: () => number;
export const destroyTouchEvent: () => number;
export const touchEventAction: (a: number) => number;
export const touchEventFingerId: (a: number) => number;
export const touchEventDisplayX: (a: number) => number;
export const touchEventDisplayY: (a: number) => number;
export const touchEventActionTime: (a: number) => number;
export const injectTouchEvent: (a: number, b: number) => number;
export const createMouseEvent: () => number;
export const destroyMouseEvent: () => number;
export const mouseEventAction: (a: number) => number;
export const mouseEventDisplayX: (a: number) => number;
export const mouseEventDisplayY: (a: number) => number;
export const mouseEventButton: (a: number) => number;
export const mouseEventAxisType: (a: number) => number;
export const mouseEventAxisValue: (a: double) => number;
export const mouseEventActionTime: (a: number) => number;
export const injectMouseEvent: (a: number, b: number) => number;
export const RegisterDeviceListener: () => number;
export const UnregisterDeviceListener: () => number;
export const RegisterDeviceListener2: () => number;
export const UnregisterDeviceListener2: () => number;
export const UnregisterDeviceListeners: () => number;
export const RegisterDeviceListener3: () => number;
export const UnregisterDeviceListener3: () => number;
export const RegisterDeviceListener4: () => number;
export const UnregisterDeviceListener4: () => number;
export const RegisterDeviceListener5: () => number;
export const UnregisterDeviceListener5: () => number;
export const RegisterDeviceListener6: () => number;
export const UnregisterDeviceListener6: () => number;
export const GetDeviceIds: () => number;
export const GetDeviceIds2: () => number;
export const GetDeviceIds3: () => number;
export const GetDeviceIds4: () => number;
export const GetDeviceIds5: () => number;
export const GetKeyboardType: () => number;
export const GetKeyboardType2: () => number;
export const GetKeyboardType3: () => number;
export const GetKeyboardType4: () => number;
export const GetDevice: () => number;
export const GetDevice2: () => number;
export const GetDevice3: () => number;
export const GetDevice4: () => number;
export const GetDeviceName: () => number;
export const GetDeviceName2: () => number;
export const GetDeviceName3: () => number;
export const GetDeviceName4: () => number;
export const GetDeviceAddress: () => number;
export const GetDeviceAddress2: () => number;
export const GetDeviceAddress3: () => number;
export const GetDeviceAddress4: () => number;
export const GetDeviceId: () => number;
export const GetDeviceId2: () => number;
export const GetDeviceId3: () => number;
export const GetCapabilities: () => number;
export const GetCapabilities2: () => number;
export const GetCapabilities3: () => number;
export const GetCapabilities4: () => number;
export const GetDeviceVersion: () => number;
export const GetDeviceVersion2: () => number;
export const GetDeviceVersion3: () => number;
export const GetDeviceVersion4: () => number;
export const GetDeviceProduct: () => number;
export const GetDeviceProduct2: () => number;
export const GetDeviceProduct3: () => number;
export const GetDeviceProduct4: () => number;
export const GetDeviceVendor: () => number;
export const GetDeviceVendor2: () => number;
export const GetDeviceVendor3: () => number;
export const GetDeviceVendor4: () => number;
export const DestroyDeviceInfo: () => number;