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

export default class InterfaceAttributeDeclaratoinOnewayStub extends rpc.RemoteObject implements IInterfaceAttributeDeclaratoinOneway {
    constructor(des: string) {
        super(des);
    }
    
    onRemoteRequest(code: number, data, reply, option): boolean {
        console.log("onRemoteRequest called, code = " + code);
        switch(code) {
            case InterfaceAttributeDeclaratoinOnewayStub.COMMAND_VOID_VOID_FIRST: {
                this.voidVoidFirst((errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case InterfaceAttributeDeclaratoinOnewayStub.COMMAND_VOID_VOID_SECOND: {
                this.voidVoidSecond((errCode) => {
                    reply.writeInt(errCode);
                });
                return true;
            }
            case InterfaceAttributeDeclaratoinOnewayStub.COMMAND_VOID_VOID_THIRD: {
                this.voidVoidThird((errCode) => {
                    reply.writeInt(errCode);
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
    
    voidVoidFirst(callback: voidVoidFirstCallback): void{}
    voidVoidSecond(callback: voidVoidSecondCallback): void{}
    voidVoidThird(callback: voidVoidThirdCallback): void{}

    static readonly COMMAND_VOID_VOID_FIRST = 1;
    static readonly COMMAND_VOID_VOID_SECOND = 2;
    static readonly COMMAND_VOID_VOID_THIRD = 3;
}

