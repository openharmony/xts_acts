/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import MySequenceable from "./my_sequenceable";
import IInterfaceDeclare from "../interfaceDeclare/i_interface_declare";

export default interface IZidlToolTest {
    onewayVoidVoid(callback: onewayVoidVoidCallback): void;
    voidVoid(callback: voidVoidCallback): void;
    booleanVoid(callback: booleanVoidCallback): void;
    byteVoid(callback: byteVoidCallback): void;
    shortVoid(callback: shortVoidCallback): void;
    intVoid(callback: intVoidCallback): void;
    longVoid(callback: longVoidCallback): void;
    floatVoid(callback: floatVoidCallback): void;
    doubleVoid(callback: doubleVoidCallback): void;
    stringVoid(callback: stringVoidCallback): void;
    sequenceableVoid(callback: sequenceableVoidCallback): void;
    interfaceVoid(callback: interfaceVoidCallback): void;
    mapStringStringVoid(callback: mapStringStringVoidCallback): void;
    doubleArrayVoid(callback: doubleArrayVoidCallback): void;
    voidInMapStringInt(param: Map<string, number>, callback: voidInMapStringIntCallback): void;
    voidInStringArray(param: string[], callback: voidInStringArrayCallback): void;
    voidOutMapStringInt(callback: voidOutMapStringIntCallback): void;
    voidOutStringArray(callback: voidOutStringArrayCallback): void;
    voidInOutMapStringInt(param: Map<string, number>, callback: voidInOutMapStringIntCallback): void;
    voidInOutStringArray(param: string[], callback: voidInOutStringArrayCallback): void;
    voidInInt(param: number, callback: voidInIntCallback): void;
    voidInString(param: string, callback: voidInStringCallback): void;
    voidOutInt(callback: voidOutIntCallback): void;
    voidOutString(callback: voidOutStringCallback): void;
    voidInOutInt(param: number, callback: voidInOutIntCallback): void;
    voidInOutString(param: string, callback: voidInOutStringCallback): void;
    voidParameterTypeBoolean(param: boolean, callback: voidParameterTypeBooleanCallback): void;
    voidParameterTypeByte(param: number, callback: voidParameterTypeByteCallback): void;
    voidParameterTypeShort(param: number, callback: voidParameterTypeShortCallback): void;
    voidParameterTypeInt(param: number, callback: voidParameterTypeIntCallback): void;
    voidParameterTypeLong(param: number, callback: voidParameterTypeLongCallback): void;
    voidParameterTypeFloat(param: number, callback: voidParameterTypeFloatCallback): void;
    voidParameterTypeDouble(param: number, callback: voidParameterTypeDoubleCallback): void;
    voidParameterTypeString(param: string, callback: voidParameterTypeStringCallback): void;
    voidParameterTypeSequenceable(param: MySequenceable, callback: voidParameterTypeSequenceableCallback): void;
    voidParameterTypeInterface(param: IInterfaceDeclare, callback: voidParameterTypeInterfaceCallback): void;
    voidParameterTypeMapStringString(param: Map<string, string>, callback: voidParameterTypeMapStringStringCallback): void;
    voidParameterTypeDoubleArray(param: number[], callback: voidParameterTypeDoubleArrayCallback): void;
    voidOrderOutIn(paramI: number, callback: voidOrderOutInCallback): void;
    voidOrderInOutIn(paramI: number, paramS: string, callback: voidOrderInOutInCallback): void;
    voidOrderOutInOut(paramS: string, callback: voidOrderOutInOutCallback): void;
    voidOrderInInOutOut(paramS: string, paramI: number, callback: voidOrderInInOutOutCallback): void;
}
export type onewayVoidVoidCallback = (errCode: number) => void;
export type voidVoidCallback = (errCode: number) => void;
export type booleanVoidCallback = (errCode: number, returnValue: boolean) => void;
export type byteVoidCallback = (errCode: number, returnValue: number) => void;
export type shortVoidCallback = (errCode: number, returnValue: number) => void;
export type intVoidCallback = (errCode: number, returnValue: number) => void;
export type longVoidCallback = (errCode: number, returnValue: number) => void;
export type floatVoidCallback = (errCode: number, returnValue: number) => void;
export type doubleVoidCallback = (errCode: number, returnValue: number) => void;
export type stringVoidCallback = (errCode: number, returnValue: string) => void;
export type sequenceableVoidCallback = (errCode: number, returnValue: MySequenceable) => void;
export type interfaceVoidCallback = (errCode: number, returnValue: IInterfaceDeclare) => void;
export type mapStringStringVoidCallback = (errCode: number, returnValue: Map<string, string>) => void;
export type doubleArrayVoidCallback = (errCode: number, returnValue: number[]) => void;
export type voidInMapStringIntCallback = (errCode: number) => void;
export type voidInStringArrayCallback = (errCode: number) => void;
export type voidOutMapStringIntCallback = (errCode: number, param: Map<string, number>) => void;
export type voidOutStringArrayCallback = (errCode: number, param: string[]) => void;
export type voidInOutMapStringIntCallback = (errCode: number, param: Map<string, number>) => void;
export type voidInOutStringArrayCallback = (errCode: number, param: string[]) => void;
export type voidInIntCallback = (errCode: number) => void;
export type voidInStringCallback = (errCode: number) => void;
export type voidOutIntCallback = (errCode: number, param: number) => void;
export type voidOutStringCallback = (errCode: number, param: string) => void;
export type voidInOutIntCallback = (errCode: number, param: number) => void;
export type voidInOutStringCallback = (errCode: number, param: string) => void;
export type voidParameterTypeBooleanCallback = (errCode: number) => void;
export type voidParameterTypeByteCallback = (errCode: number) => void;
export type voidParameterTypeShortCallback = (errCode: number) => void;
export type voidParameterTypeIntCallback = (errCode: number) => void;
export type voidParameterTypeLongCallback = (errCode: number) => void;
export type voidParameterTypeFloatCallback = (errCode: number) => void;
export type voidParameterTypeDoubleCallback = (errCode: number) => void;
export type voidParameterTypeStringCallback = (errCode: number) => void;
export type voidParameterTypeSequenceableCallback = (errCode: number) => void;
export type voidParameterTypeInterfaceCallback = (errCode: number) => void;
export type voidParameterTypeMapStringStringCallback = (errCode: number) => void;
export type voidParameterTypeDoubleArrayCallback = (errCode: number) => void;
export type voidOrderOutInCallback = (errCode: number, paramS: string) => void;
export type voidOrderInOutInCallback = (errCode: number, paramI: number) => void;
export type voidOrderOutInOutCallback = (errCode: number, paramI: number, paramS: string) => void;
export type voidOrderInInOutOutCallback = (errCode: number, paramI: number, paramS2: string) => void;

