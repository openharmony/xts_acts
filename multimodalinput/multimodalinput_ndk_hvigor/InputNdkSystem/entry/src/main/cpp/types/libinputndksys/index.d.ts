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
export const GetAxisEventAction: () => number;
export const GetAxisEventDisplayX: () => number;
export const GetAxisEventDisplayY: () => number;
export const GetAxisEventAxisValue: () => number;
export const GetAxisEventActionTime: () => number;
export const GetAxisEventType: () => number;
export const GetAxisEventSourceType: () => number;
export const DestroyAxisEvent: () => number;
export const AddKeyEventMonitor: () => number;
export const RemoveKeyEventMonitor: () => number;
export const AddMouseEventMonitor: () => number;
export const RemoveMouseEventMonitor: () => number;
export const AddTouchEventMonitor: () => number;
export const RemoveTouchEventMonitor: () => number;
export const AddAxisEventMonitorForAll: () => number;
export const RemoveAxisEventMonitorForAll: () => number;
export const AddAxisEventMonitor: () => number;
export const RemoveAxisEventMonitor: () => number;
export const AddKeyEventInterceptor: () => number;
export const RemoveKeyEventInterceptor: () => number;
export const AddInputEventInterceptor: () => number;
export const RemoveInputEventInterceptor: () => number;