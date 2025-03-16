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
export const createAVRecorder: () => number;

export const prepareAVRecorder: (mapB: ESObject, fdNumber: String) => number;

export const createPrepareAVRecorder: () => number;

export const startAVRecorder: () => number;

export const pauseAVRecorder: () => number;

export const resumeAVRecorder: () => number;

export const stopAVRecorder: () => number;

export const resetAVRecorder: () => number;

export const releaseAVRecorder: () => number;

export const updateRotationAVRecorder: (videoRotation: number) => number;

export const prepareCamera: (focusMode: number, cameraDeviceIndex: number, sceneMode: number, previewId: string,
  photeId: string, videoId: string, videoFrameWidth: number, videoFrameHeight: number) => number;

export const setPreviewSurfaceId: () => number;

export const getAVRecorderConfig: () => number;

export const getAvailableEncoder: () => number;



