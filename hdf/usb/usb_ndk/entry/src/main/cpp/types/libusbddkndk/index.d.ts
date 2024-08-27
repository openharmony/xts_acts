/*
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
export const usbInit: () => number;
export const usbRelease: () => number;
export const usbGetDeviceDescriptorOne: (a: number) => number;
export const usbGetDeviceDescriptorTwo: (a: number) => number;
export const usbGetConfigDescriptorOne: (a: number) => number;
export const usbGetConfigDescriptorTwo: () => number;
export const usbGetConfigDescriptorThree: (a: number) => number;
export const usbFreeConfigDescriptor: (a: number) => number;
export const usbClaimInterfaceOne: (a: number) => number;
export const usbClaimInterfaceTwo: () => number;
export const usbClaimInterfaceThree: (a: number) => number;
export const usbReleaseInterface: (a: number) => number;
export const usbSelectInterfaceSettingOne: (a: number) => number;
export const usbSelectInterfaceSettingTwo: (a: number) => number;
export const usbGetCurrentInterfaceSettingOne: (a: number) => number;
export const usbGetCurrentInterfaceSettingTwo: (a: number) => number;
export const usbGetCurrentInterfaceSettingThree: (a: number) => string;
export const usbSendControlReadRequestOne: (a: number) => string;
export const usbSendControlReadRequestTwo: (a: number) => number;
export const usbSendControlReadRequestThree: (a: number) => string;
export const usbSendControlReadRequestFour: (a: number) => string;
export const usbSendControlReadRequestFive: (a: number) => number;

export const usbSendControlWriteRequestOne: (a: number) => number;
export const usbSendControlWriteRequestTwo: (a: number) => number;
export const usbSendControlWriteRequestThree: (a: number) => number;
export const usbSendControlWriteRequestFour: (a: number) => number;
export const usbSendPipeRequestOne: (a: number) => number;
export const usbSendPipeRequestTwo: (a: number) => number;
export const usbSendPipeRequestThree: (a: number) => number;
export const usbSendPipeRequestFour: (a: number) => number;
export const usbCreateDeviceMemMapOne: (a: number) => number;
export const usbCreateDeviceMemMapTwo: (a: number) => number;
export const usbDestroyDeviceMemMap: (a: number) => number;
export const usbSendPipeRequestWithAshmemOne: (a: number) => number;
export const usbSendPipeRequestWithAshmemTwo: (a: number) => number;
export const usbSendPipeRequestWithAshmemThree: (a: number) => number;
export const usbSendPipeRequestWithAshmemFour: (a: number) => number;