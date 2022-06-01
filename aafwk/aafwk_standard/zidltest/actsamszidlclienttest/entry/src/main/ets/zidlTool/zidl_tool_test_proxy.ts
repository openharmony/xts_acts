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

export default class ZidlToolTestProxy implements IZidlToolTest {
    constructor(proxy) {
        this.proxy = proxy;
    }

    onewayVoidVoid(callback: onewayVoidVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_ASYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_ONEWAY_VOID_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidVoid(callback: voidVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    booleanVoid(callback: booleanVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_BOOLEAN_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readInt() == 1 ? true : false;
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    byteVoid(callback: byteVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_BYTE_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readInt();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    shortVoid(callback: shortVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_SHORT_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readInt();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    intVoid(callback: intVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_INT_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readInt();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    longVoid(callback: longVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_LONG_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readLong();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    floatVoid(callback: floatVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_FLOAT_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readFloat();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    doubleVoid(callback: doubleVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_DOUBLE_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readDouble();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    stringVoid(callback: stringVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_STRING_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readString();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    sequenceableVoid(callback: sequenceableVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_SEQUENCEABLE_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = new MySequenceable();
                result.reply.readSequenceable(_returnValue);
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    interfaceVoid(callback: interfaceVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_INTERFACE_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readRemoteObject();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    mapStringStringVoid(callback: mapStringStringVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_MAP_STRING_STRING_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = new Map();
                let _returnValueSize = result.reply.readInt();
                for (let i = 0; i < _returnValueSize; ++i) {
                    let key = result.reply.readString();
                    let value = result.reply.readString();
                    _returnValue.set(key, value);
                }
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    doubleArrayVoid(callback: doubleArrayVoidCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_DOUBLE_ARRAY_VOID, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _returnValue = undefined;
                    callback(_errCode, _returnValue);
                    return;
                }
                let _returnValue = result.reply.readDoubleArray();
                callback(_errCode, _returnValue);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInMapStringInt(param: Map<string, number>, callback: voidInMapStringIntCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param.size);
        for (let [key, value] of param) {
            _data.writeString(key);
            _data.writeInt(value);
        }
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_MAP_STRING_INT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInStringArray(param: string[], callback: voidInStringArrayCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeStringArray(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_STRING_ARRAY, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOutMapStringInt(callback: voidOutMapStringIntCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_OUT_MAP_STRING_INT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = new Map();
                let _paramSize = result.reply.readInt();
                for (let i = 0; i < _paramSize; ++i) {
                    let key = result.reply.readString();
                    let value = result.reply.readInt();
                    _param.set(key, value);
                }
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOutStringArray(callback: voidOutStringArrayCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_OUT_STRING_ARRAY, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = result.reply.readStringArray();
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInOutMapStringInt(param: Map<string, number>, callback: voidInOutMapStringIntCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param.size);
        for (let [key, value] of param) {
            _data.writeString(key);
            _data.writeInt(value);
        }
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_OUT_MAP_STRING_INT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = new Map();
                let _paramSize = result.reply.readInt();
                for (let i = 0; i < _paramSize; ++i) {
                    let key = result.reply.readString();
                    let value = result.reply.readInt();
                    _param.set(key, value);
                }
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInOutStringArray(param: string[], callback: voidInOutStringArrayCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeStringArray(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_OUT_STRING_ARRAY, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = result.reply.readStringArray();
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInInt(param: number, callback: voidInIntCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_INT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInString(param: string, callback: voidInStringCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeString(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_STRING, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOutInt(callback: voidOutIntCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_OUT_INT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = result.reply.readInt();
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOutString(callback: voidOutStringCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_OUT_STRING, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = result.reply.readString();
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInOutInt(param: number, callback: voidInOutIntCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_OUT_INT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = result.reply.readInt();
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidInOutString(param: string, callback: voidInOutStringCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeString(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_IN_OUT_STRING, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _param = undefined;
                    callback(_errCode,_param);
                    return;
                }
                let _param = result.reply.readString();
                callback(_errCode,_param);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeBoolean(param: boolean, callback: voidParameterTypeBooleanCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param ? 1 : 0);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_BOOLEAN, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeByte(param: number, callback: voidParameterTypeByteCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_BYTE, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeShort(param: number, callback: voidParameterTypeShortCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_SHORT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeInt(param: number, callback: voidParameterTypeIntCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_INT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeLong(param: number, callback: voidParameterTypeLongCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeLong(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_LONG, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeFloat(param: number, callback: voidParameterTypeFloatCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeFloat(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_FLOAT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeDouble(param: number, callback: voidParameterTypeDoubleCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeDouble(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_DOUBLE, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeString(param: string, callback: voidParameterTypeStringCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeString(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_STRING, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeSequenceable(param: MySequenceable, callback: voidParameterTypeSequenceableCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeSequenceable(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_SEQUENCEABLE, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeInterface(param: IInterfaceDeclare, callback: voidParameterTypeInterfaceCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeRemoteObject(param as InterfaceDeclareStub);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_INTERFACE, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeMapStringString(param: Map<string, string>, callback: voidParameterTypeMapStringStringCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(param.size);
        for (let [key, value] of param) {
            _data.writeString(key);
            _data.writeString(value);
        }
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_MAP_STRING_STRING, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidParameterTypeDoubleArray(param: number[], callback: voidParameterTypeDoubleArrayCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeDoubleArray(param);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_PARAMETER_TYPE_DOUBLE_ARRAY, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOrderOutIn(paramI: number, callback: voidOrderOutInCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(paramI);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_ORDER_OUT_IN, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _paramS = undefined;
                    callback(_errCode,_paramS);
                    return;
                }
                let _paramS = result.reply.readString();
                callback(_errCode,_paramS);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOrderInOutIn(paramI: number, paramS: string, callback: voidOrderInOutInCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(paramI);
        _data.writeString(paramS);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_ORDER_IN_OUT_IN, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _paramI = undefined;
                    callback(_errCode,_paramI);
                    return;
                }
                let _paramI = result.reply.readInt();
                callback(_errCode,_paramI);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOrderOutInOut(paramS: string, callback: voidOrderOutInOutCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeString(paramS);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_ORDER_OUT_IN_OUT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _paramI = undefined;
                    let _paramS = undefined;
                    callback(_errCode,_paramI, _paramS);
                    return;
                }
                let _paramI = result.reply.readInt();
                let _paramS = result.reply.readString();
                callback(_errCode,_paramI, _paramS);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidOrderInInOutOut(paramS: string, paramI: number, callback: voidOrderInInOutOutCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeString(paramS);
        _data.writeInt(paramI);
        this.proxy.sendRequest(ZidlToolTestProxy.COMMAND_VOID_ORDER_IN_IN_OUT_OUT, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                if (_errCode != 0) {
                    let _paramI = undefined;
                    let _paramS2 = undefined;
                    callback(_errCode,_paramI, _paramS2);
                    return;
                }
                let _paramI = result.reply.readInt();
                let _paramS2 = result.reply.readString();
                callback(_errCode,_paramI, _paramS2);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

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
    private proxy
}

