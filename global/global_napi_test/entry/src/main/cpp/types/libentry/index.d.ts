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
import resourceManager from '@ohos.resourceManager';

export const GetFileList: (resmgr: resourceManager.ResourceManager, path: string) => Array<String>;
export const GetRawFileContent: (resmgr: resourceManager.ResourceManager, path: string) => Uint8Array;
export const GetRawFileDescriptor: (resmgr: resourceManager.ResourceManager, path: string) => resourceManager.RawFileDescriptor;
export const GetRawFileDescriptor64: (resmgr: resourceManager.ResourceManager, path: string) => resourceManager.RawFileDescriptor;
export const IsRawDir: (resmgr: resourceManager.ResourceManager, path: string) => Boolean;
export const GetDrawableDescriptor: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const GetDrawableDescriptorByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetMediaBase64: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const GetMediaBase64ByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetMedia: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const GetMediaByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetSymbolByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetSymbol: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const GetBoolByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetBool: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const GetPluralStringByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetPluralString: (resmgr: resourceManager.ResourceManager, resId: number, num: number) => Boolean;
export const GetColorByName: (resmgr: resourceManager.ResourceManager) => number;
export const GetColor: (resmgr: resourceManager.ResourceManager, id: number) => number;
export const GetIntByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetInt: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const GetFloatByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetFloat: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const GetLocales: (resmgr: resourceManager.ResourceManager) => Array<String>;
export const GetConfiguration: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetStringArray: (resmgr: resourceManager.ResourceManager, resId: number) => Array<String>;
export const GetStringArrayByName: (resmgr: resourceManager.ResourceManager) => Array<String>;
export const ReleaseStringArray: (resmgr: resourceManager.ResourceManager) => Boolean;
export const ReleaseConfiguration: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetStringByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const GetString: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const GetRawFileDescriptorData: (resmgr: resourceManager.ResourceManager, path: string) => resourceManager.RawFileDescriptor;
export const GetLocalesData: (resmgr: resourceManager.ResourceManager) => Array<String>;
export const GetMediaBase64DataByName: (resmgr: resourceManager.ResourceManager, name: string) => string;
export const GetMediaBase64Data: (resmgr: resourceManager.ResourceManager, resId: number) => string;
export const GetMediaData: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const GetMediaDataByName: (resmgr: resourceManager.ResourceManager, name: string) => Boolean;
export const GetDrawableDescriptorData: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const GetDrawableDescriptorDataByName: (resmgr: resourceManager.ResourceManager, name: string) => Boolean;
export const AddResource: (resmgr: resourceManager.ResourceManager) => number;
export const RemoveResource: (resmgr: resourceManager.ResourceManager) => Boolean;
