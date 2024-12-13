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
export const oHNativeImageCreate: () => number;
export const oHNativeImageAcquireNativeWindow: () => number;
export const oHNativeImageAcquireNativeWindowAbnormal: () => number;
export const oHNativeImageAttachContext: () => number;
export const oHNativeImageAttachContextAbnormal: () => number;
export const oHNativeImageDetachContext: () => number;
export const oHNativeImageDetachContextAbnormal: () => number;
export const oHNativeImageUpdateSurfaceImage: () => number;
export const oHNativeImageUpdateSurfaceImageBoundary: () => number;
export const oHNativeImageUpdateSurfaceImageAbnormal: () => number;
export const oHNativeImageGetTimestamp: () => number;
export const oHNativeImageGetTransformMatrix: () => number;
export const oHNativeImageGetTransformMatrixAbnormal: () => number;
export const oHNativeImageDestroy: () => number;
export const oHNativeImageCreateNormal: () => number;
export const oHNativeImageCreateAbnormal: () => number;
export const oHNativeImageDestroy1: () => number;
export const oHNativeImageCreateMuch: () => number;
export const oHNativeImageAcquireNativeWindowNullptr: () => number;
export const oHNativeImageAcquireNativeWindowNormal: () => number;
export const oHNativeImageAttachContextNullptr: () => Array<number>;
export const oHNativeImageDetachContextNullptr: () => number;
export const oHNativeImageAttachContextNormal: () => Array<number>;
export const oHNativeImageDetachContextNormal: () => Array<number>;
export const oHNativeImageGetSurfaceIdNullptr: () => Array<number>;
export const oHNativeGetSurfaceIdNormal: () => number;
export const oHNativeImageUpdateSurfaceImageNullptr: () => number;
export const oHNativeImageGetTimestampNullptr: () => number;
export const oHNativeImageGetTransformMatrixNullptr: () => Array<number>;
export const oHNativeImageGetTransformMatrixV2Nullptr: () => Array<number>;
export const oHNativeImageUpdateSurfaceImageNormal: () => number;
export const oHNativeImageGetTimestampNormal: () => Array<number>;
export const oHNativeImageGetTransformMatrixNormal: () => Array<number>;
export const oHNativeImageGetTransformMatrixV2Normal: () => Array<number>;
export const oHNativeImageSetOnFrameAvailableListenerNullptr: () => number;
export const oHNativeImageUnSetOnFrameAvailableListenerNullptr: () => number;
export const oHNativeImageSetOnFrameAvailableListenerNormal: () => Array<number>;
export const oHNativeImageUnsetOnFrameAvailableListenerNormal: () => Array<number>;