/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

export const add: (a: number, b: number) => number;
export const oHHiAppEventWrite: () => number;
export const oHHiAppEventConfigure: () => number;
export const oHHiAppEventAddBoolParam: () => number;
export const oHHiAppEventAddBoolArrayParam: () => number;
export const oHHiAppEventAddInt8Param: () => number;
export const oHHiAppEventAddInt8ArrayParam: () => number;
export const oHHiAppEventAddInt16Param: () => number;
export const oHHiAppEventAddInt16ArrayParam: () => number;
export const oHHiAppEventAddInt32Param: () => number;
export const oHHiAppEventAddInt32ArrayParam: () => number;
export const oHHiAppEventAddInt64Param: () => number;
export const oHHiAppEventAddInt64ArrayParam: () => number;
export const oHHiAppEventAddFloatParam: () => number;
export const oHHiAppEventAddFloatArrayParam: () => number;
export const oHHiAppEventAddDoubleParam: () => number;
export const oHHiAppEventAddDoubleArrayParam: () => number;
export const oHHiAppEventAddStringParam: () => number;
export const oHHiAppEventAddStringArrayParam: () => number;
export const oHHiAppEventCreateParamList: () => number;
export const setAppEventFilter: () => number;
export const setAppEventFilterInvName: () => number;
export const setAppEventFilterInvDomain: () => number;
export const setAppEventFilterInvWatcher: () => number;
export const setTriggerCondition: () => number;
export const setTriggerConditionInvWatcher: () => number;
export const setWatcherOnTrigger: () => number;
export const setWatcherOnTriggerInvWatcher: () => number;
export const setWatcherOnReceive: () => number;
export const setWatcherOnReceiveInvWatcher: () => number;
export const takeWatcherData: () => number;
export const takeWatcherDataInvWatcher: () => number;
export const takeWatcherDataInvOperation: () => number;
export const addWatcher: () => number;
export const addWatcherInvWatcher: () => number;
export const removeWatcher: () => number;
export const removeWatcherInvWatcher: () => number;
export const removeWatcherInvOperation: () => number;