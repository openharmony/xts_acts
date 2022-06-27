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

import {onewayVoidVoidCallback} from "./i_zidl_tool_test";
import {voidVoidCallback} from "./i_zidl_tool_test";
import {booleanVoidCallback} from "./i_zidl_tool_test";
import {byteVoidCallback} from "./i_zidl_tool_test";
import {shortVoidCallback} from "./i_zidl_tool_test";
import {intVoidCallback} from "./i_zidl_tool_test";
import {longVoidCallback} from "./i_zidl_tool_test";
import {floatVoidCallback} from "./i_zidl_tool_test";
import {doubleVoidCallback} from "./i_zidl_tool_test";
import {stringVoidCallback} from "./i_zidl_tool_test";
import {sequenceableVoidCallback} from "./i_zidl_tool_test";
import {interfaceVoidCallback} from "./i_zidl_tool_test";
import {mapStringStringVoidCallback} from "./i_zidl_tool_test";
import {doubleArrayVoidCallback} from "./i_zidl_tool_test";
import {voidInMapStringIntCallback} from "./i_zidl_tool_test";
import {voidInStringArrayCallback} from "./i_zidl_tool_test";
import {voidOutMapStringIntCallback} from "./i_zidl_tool_test";
import {voidOutStringArrayCallback} from "./i_zidl_tool_test";
import {voidInOutMapStringIntCallback} from "./i_zidl_tool_test";
import {voidInOutStringArrayCallback} from "./i_zidl_tool_test";
import {voidInIntCallback} from "./i_zidl_tool_test";
import {voidInStringCallback} from "./i_zidl_tool_test";
import {voidOutIntCallback} from "./i_zidl_tool_test";
import {voidOutStringCallback} from "./i_zidl_tool_test";
import {voidInOutIntCallback} from "./i_zidl_tool_test";
import {voidInOutStringCallback} from "./i_zidl_tool_test";
import {voidParameterTypeBooleanCallback} from "./i_zidl_tool_test";
import {voidParameterTypeByteCallback} from "./i_zidl_tool_test";
import {voidParameterTypeShortCallback} from "./i_zidl_tool_test";
import {voidParameterTypeIntCallback} from "./i_zidl_tool_test";
import {voidParameterTypeLongCallback} from "./i_zidl_tool_test";
import {voidParameterTypeFloatCallback} from "./i_zidl_tool_test";
import {voidParameterTypeDoubleCallback} from "./i_zidl_tool_test";
import {voidParameterTypeStringCallback} from "./i_zidl_tool_test";
import {voidParameterTypeSequenceableCallback} from "./i_zidl_tool_test";
import {voidParameterTypeInterfaceCallback} from "./i_zidl_tool_test";
import {voidParameterTypeMapStringStringCallback} from "./i_zidl_tool_test";
import {voidParameterTypeDoubleArrayCallback} from "./i_zidl_tool_test";
import {voidOrderOutInCallback} from "./i_zidl_tool_test";
import {voidOrderInOutInCallback} from "./i_zidl_tool_test";
import {voidOrderOutInOutCallback} from "./i_zidl_tool_test";
import {voidOrderInInOutOutCallback} from "./i_zidl_tool_test";
import IZidlToolTest from "./i_zidl_tool_test";
import rpc from "@ohos.rpc";
import MySequenceable from "./my_sequenceable";
import IInterfaceDeclare from "../interfaceDeclare/i_interface_declare";
import InterfaceDeclareStub from "../interfaceDeclare/interface_declare_stub";

export default class ZidlToolTestStub extends rpc.RemoteObject implements IZidlToolTest {
    constructor(des: string) {
        super(des);
    }
    
    onRemoteRequest(code: number, data, reply, option): boolean {
        console.log("onRemoteRequest called, code = " + code);
        switch(code) {
            case ZidlToolTestStub.COMMAND_ONEWAY_VOID_VOID: {
                this.onewayVoidVoid((errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_VOID: {
                this.voidVoid((errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_BOOLEAN_VOID: {
                this.booleanVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(returnValue ? 1 : 0);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_BYTE_VOID: {
                this.byteVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_SHORT_VOID: {
                this.shortVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_INT_VOID: {
                this.intVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_LONG_VOID: {
                this.longVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeLong(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_FLOAT_VOID: {
                this.floatVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeFloat(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_DOUBLE_VOID: {
                this.doubleVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeDouble(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_STRING_VOID: {
                this.stringVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeString(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_SEQUENCEABLE_VOID: {
                this.sequenceableVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeSequenceable(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_INTERFACE_VOID: {
                this.interfaceVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeRemoteObject(returnValue as InterfaceDeclareStub);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_MAP_STRING_STRING_VOID: {
                this.mapStringStringVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(returnValue.size);
                        for (let [key, value] of returnValue) {
                            reply.writeString(key);
                            reply.writeString(value);
                        }
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_DOUBLE_ARRAY_VOID: {
                this.doubleArrayVoid((errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeDoubleArray(returnValue);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_MAP_STRING_INT: {
                let _param = new Map();
                let _paramSize = data.readInt();
                for (let i = 0; i < _paramSize; ++i) {
                    let key = data.readString();
                    let value = data.readInt();
                    _param.set(key, value);
                }
                this.voidInMapStringInt(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_STRING_ARRAY: {
                let _param = data.readStringArray();
                this.voidInStringArray(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_OUT_MAP_STRING_INT: {
                this.voidOutMapStringInt((errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(param.size);
                        for (let [key, value] of param) {
                            reply.writeString(key);
                            reply.writeInt(value);
                        }
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_OUT_STRING_ARRAY: {
                this.voidOutStringArray((errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeStringArray(param);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_OUT_MAP_STRING_INT: {
                let _param = new Map();
                let _paramSize = data.readInt();
                for (let i = 0; i < _paramSize; ++i) {
                    let key = data.readString();
                    let value = data.readInt();
                    _param.set(key, value);
                }
                this.voidInOutMapStringInt(_param, (errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(param.size);
                        for (let [key, value] of param) {
                            reply.writeString(key);
                            reply.writeInt(value);
                        }
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_OUT_STRING_ARRAY: {
                let _param = data.readStringArray();
                this.voidInOutStringArray(_param, (errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeStringArray(param);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_INT: {
                let _param = data.readInt();
                this.voidInInt(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_STRING: {
                let _param = data.readString();
                this.voidInString(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_OUT_INT: {
                this.voidOutInt((errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(param);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_OUT_STRING: {
                this.voidOutString((errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeString(param);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_OUT_INT: {
                let _param = data.readInt();
                this.voidInOutInt(_param, (errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(param);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_IN_OUT_STRING: {
                let _param = data.readString();
                this.voidInOutString(_param, (errCode, param) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeString(param);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_BOOLEAN: {
                let _param = data.readInt() == 1 ? true : false;
                this.voidParameterTypeBoolean(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_BYTE: {
                let _param = data.readInt();
                this.voidParameterTypeByte(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_SHORT: {
                let _param = data.readInt();
                this.voidParameterTypeShort(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_INT: {
                let _param = data.readInt();
                this.voidParameterTypeInt(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_LONG: {
                let _param = data.readLong();
                this.voidParameterTypeLong(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_FLOAT: {
                let _param = data.readFloat();
                this.voidParameterTypeFloat(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_DOUBLE: {
                let _param = data.readDouble();
                this.voidParameterTypeDouble(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_STRING: {
                let _param = data.readString();
                this.voidParameterTypeString(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_SEQUENCEABLE: {
                let _param = new MySequenceable();
                data.readSequenceable(_param);
                this.voidParameterTypeSequenceable(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_INTERFACE: {
                let _param = data.readRemoteObject();
                this.voidParameterTypeInterface(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_MAP_STRING_STRING: {
                let _param = new Map();
                let _paramSize = data.readInt();
                for (let i = 0; i < _paramSize; ++i) {
                    let key = data.readString();
                    let value = data.readString();
                    _param.set(key, value);
                }
                this.voidParameterTypeMapStringString(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_PARAMETER_TYPE_DOUBLE_ARRAY: {
                let _param = data.readDoubleArray();
                this.voidParameterTypeDoubleArray(_param, (errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_ORDER_OUT_IN: {
                let _paramI = data.readInt();
                this.voidOrderOutIn(_paramI, (errCode, paramS) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeString(paramS);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_ORDER_IN_OUT_IN: {
                let _paramI = data.readInt();
                let _paramS = data.readString();
                this.voidOrderInOutIn(_paramI, _paramS, (errCode, paramI) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(paramI);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_ORDER_OUT_IN_OUT: {
                let _paramS = data.readString();
                this.voidOrderOutInOut(_paramS, (errCode, paramI, paramS) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(paramI);
                        reply.writeString(paramS);
                    }
                });
                return true;
            }
            case ZidlToolTestStub.COMMAND_VOID_ORDER_IN_IN_OUT_OUT: {
                let _paramS = data.readString();
                let _paramI = data.readInt();
                this.voidOrderInInOutOut(_paramS, _paramI, (errCode, paramI, paramS2) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(paramI);
                        reply.writeString(paramS2);
                    }
                });
                return true;
            }
            default: {
                console.log("invalid request code" + code);
                break;
            }
        }
        return false;
    }
    
    onewayVoidVoid(callback: onewayVoidVoidCallback): void{}
    voidVoid(callback: voidVoidCallback): void{}
    booleanVoid(callback: booleanVoidCallback): void{}
    byteVoid(callback: byteVoidCallback): void{}
    shortVoid(callback: shortVoidCallback): void{}
    intVoid(callback: intVoidCallback): void{}
    longVoid(callback: longVoidCallback): void{}
    floatVoid(callback: floatVoidCallback): void{}
    doubleVoid(callback: doubleVoidCallback): void{}
    stringVoid(callback: stringVoidCallback): void{}
    sequenceableVoid(callback: sequenceableVoidCallback): void{}
    interfaceVoid(callback: interfaceVoidCallback): void{}
    mapStringStringVoid(callback: mapStringStringVoidCallback): void{}
    doubleArrayVoid(callback: doubleArrayVoidCallback): void{}
    voidInMapStringInt(param: Map<string, number>, callback: voidInMapStringIntCallback): void{}
    voidInStringArray(param: string[], callback: voidInStringArrayCallback): void{}
    voidOutMapStringInt(callback: voidOutMapStringIntCallback): void{}
    voidOutStringArray(callback: voidOutStringArrayCallback): void{}
    voidInOutMapStringInt(param: Map<string, number>, callback: voidInOutMapStringIntCallback): void{}
    voidInOutStringArray(param: string[], callback: voidInOutStringArrayCallback): void{}
    voidInInt(param: number, callback: voidInIntCallback): void{}
    voidInString(param: string, callback: voidInStringCallback): void{}
    voidOutInt(callback: voidOutIntCallback): void{}
    voidOutString(callback: voidOutStringCallback): void{}
    voidInOutInt(param: number, callback: voidInOutIntCallback): void{}
    voidInOutString(param: string, callback: voidInOutStringCallback): void{}
    voidParameterTypeBoolean(param: boolean, callback: voidParameterTypeBooleanCallback): void{}
    voidParameterTypeByte(param: number, callback: voidParameterTypeByteCallback): void{}
    voidParameterTypeShort(param: number, callback: voidParameterTypeShortCallback): void{}
    voidParameterTypeInt(param: number, callback: voidParameterTypeIntCallback): void{}
    voidParameterTypeLong(param: number, callback: voidParameterTypeLongCallback): void{}
    voidParameterTypeFloat(param: number, callback: voidParameterTypeFloatCallback): void{}
    voidParameterTypeDouble(param: number, callback: voidParameterTypeDoubleCallback): void{}
    voidParameterTypeString(param: string, callback: voidParameterTypeStringCallback): void{}
    voidParameterTypeSequenceable(param: MySequenceable, callback: voidParameterTypeSequenceableCallback): void{}
    voidParameterTypeInterface(param: IInterfaceDeclare, callback: voidParameterTypeInterfaceCallback): void{}
    voidParameterTypeMapStringString(param: Map<string, string>, callback: voidParameterTypeMapStringStringCallback): void{}
    voidParameterTypeDoubleArray(param: number[], callback: voidParameterTypeDoubleArrayCallback): void{}
    voidOrderOutIn(paramI: number, callback: voidOrderOutInCallback): void{}
    voidOrderInOutIn(paramI: number, paramS: string, callback: voidOrderInOutInCallback): void{}
    voidOrderOutInOut(paramS: string, callback: voidOrderOutInOutCallback): void{}
    voidOrderInInOutOut(paramS: string, paramI: number, callback: voidOrderInInOutOutCallback): void{}

    static readonly COMMAND_ONEWAY_VOID_VOID = 1;
    static readonly COMMAND_VOID_VOID = 2;
    static readonly COMMAND_BOOLEAN_VOID = 3;
    static readonly COMMAND_BYTE_VOID = 4;
    static readonly COMMAND_SHORT_VOID = 5;
    static readonly COMMAND_INT_VOID = 6;
    static readonly COMMAND_LONG_VOID = 7;
    static readonly COMMAND_FLOAT_VOID = 8;
    static readonly COMMAND_DOUBLE_VOID = 9;
    static readonly COMMAND_STRING_VOID = 10;
    static readonly COMMAND_SEQUENCEABLE_VOID = 11;
    static readonly COMMAND_INTERFACE_VOID = 12;
    static readonly COMMAND_MAP_STRING_STRING_VOID = 13;
    static readonly COMMAND_DOUBLE_ARRAY_VOID = 14;
    static readonly COMMAND_VOID_IN_MAP_STRING_INT = 15;
    static readonly COMMAND_VOID_IN_STRING_ARRAY = 16;
    static readonly COMMAND_VOID_OUT_MAP_STRING_INT = 17;
    static readonly COMMAND_VOID_OUT_STRING_ARRAY = 18;
    static readonly COMMAND_VOID_IN_OUT_MAP_STRING_INT = 19;
    static readonly COMMAND_VOID_IN_OUT_STRING_ARRAY = 20;
    static readonly COMMAND_VOID_IN_INT = 21;
    static readonly COMMAND_VOID_IN_STRING = 22;
    static readonly COMMAND_VOID_OUT_INT = 23;
    static readonly COMMAND_VOID_OUT_STRING = 24;
    static readonly COMMAND_VOID_IN_OUT_INT = 25;
    static readonly COMMAND_VOID_IN_OUT_STRING = 26;
    static readonly COMMAND_VOID_PARAMETER_TYPE_BOOLEAN = 27;
    static readonly COMMAND_VOID_PARAMETER_TYPE_BYTE = 28;
    static readonly COMMAND_VOID_PARAMETER_TYPE_SHORT = 29;
    static readonly COMMAND_VOID_PARAMETER_TYPE_INT = 30;
    static readonly COMMAND_VOID_PARAMETER_TYPE_LONG = 31;
    static readonly COMMAND_VOID_PARAMETER_TYPE_FLOAT = 32;
    static readonly COMMAND_VOID_PARAMETER_TYPE_DOUBLE = 33;
    static readonly COMMAND_VOID_PARAMETER_TYPE_STRING = 34;
    static readonly COMMAND_VOID_PARAMETER_TYPE_SEQUENCEABLE = 35;
    static readonly COMMAND_VOID_PARAMETER_TYPE_INTERFACE = 36;
    static readonly COMMAND_VOID_PARAMETER_TYPE_MAP_STRING_STRING = 37;
    static readonly COMMAND_VOID_PARAMETER_TYPE_DOUBLE_ARRAY = 38;
    static readonly COMMAND_VOID_ORDER_OUT_IN = 39;
    static readonly COMMAND_VOID_ORDER_IN_OUT_IN = 40;
    static readonly COMMAND_VOID_ORDER_OUT_IN_OUT = 41;
    static readonly COMMAND_VOID_ORDER_IN_IN_OUT_OUT = 42;
}

