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
export const usbReleaseResource: () => number;
export const usbGetDeviceDescriptor: (a: number) => number;
export const usbGetConfigDescriptor: (a: number) => number;
export const usbFreeConfigDescriptor: (a: number) => number;
export const usbClaimInterface: (a: number) => number;
export const usbReleaseInterface: (a: number) => number;
export const usbSelectInterfaceSetting: (a: number) => number;
export const usbGetCurrentInterfaceSetting: (a: number) => number;
export const usbSendControlReadRequest: (a: number) => string;
export const usbSendControlWriteRequest: (a: number) => number;
export const usbSendPipeRequest: (a: number) => number;
export const usbCreateDeviceMemMap: (a: number) => number;
export const usbDestroyDeviceMemMap: (a: number) => number;
export const usbSendPipeRequestWithAshmem: (a: number) => number;