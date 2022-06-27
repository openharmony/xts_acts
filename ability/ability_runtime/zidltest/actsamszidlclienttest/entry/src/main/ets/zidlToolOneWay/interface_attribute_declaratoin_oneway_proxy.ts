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

import {voidVoidFirstCallback} from "./i_interface_attribute_declaratoin_oneway";
import {voidVoidSecondCallback} from "./i_interface_attribute_declaratoin_oneway";
import {voidVoidThirdCallback} from "./i_interface_attribute_declaratoin_oneway";
import IInterfaceAttributeDeclaratoinOneway from "./i_interface_attribute_declaratoin_oneway";
import rpc from "@ohos.rpc";

export default class InterfaceAttributeDeclaratoinOnewayProxy implements IInterfaceAttributeDeclaratoinOneway {
    constructor(proxy) {
        this.proxy = proxy;
    }

    voidVoidFirst(callback: voidVoidFirstCallback): void
    {
        let _option = new rpc.MessageOption(1);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(InterfaceAttributeDeclaratoinOnewayProxy.COMMAND_VOID_VOID_FIRST, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidVoidSecond(callback: voidVoidSecondCallback): void
    {
        let _option = new rpc.MessageOption(1);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(InterfaceAttributeDeclaratoinOnewayProxy.COMMAND_VOID_VOID_SECOND, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    voidVoidThird(callback: voidVoidThirdCallback): void
    {
        let _option = new rpc.MessageOption(1);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        this.proxy.sendRequest(InterfaceAttributeDeclaratoinOnewayProxy.COMMAND_VOID_VOID_THIRD, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    static readonly COMMAND_VOID_VOID_FIRST = 1;
    static readonly COMMAND_VOID_VOID_SECOND = 2;
    static readonly COMMAND_VOID_VOID_THIRD = 3;
    private proxy
}

