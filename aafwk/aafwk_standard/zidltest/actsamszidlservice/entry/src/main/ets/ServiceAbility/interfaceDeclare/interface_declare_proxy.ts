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

import {testInterfaceCallback} from "./i_interface_declare";
import IInterfaceDeclare from "./i_interface_declare";
import rpc from "@ohos.rpc";

export default class InterfaceDeclareProxy implements IInterfaceDeclare {
    constructor(proxy) {
        this.proxy = proxy;
    }

    testInterface(data: number, callback: testInterfaceCallback): void
    {
        let _option = new rpc.MessageOption(rpc.MessageOption.TF_SYNC);
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(data);
        this.proxy.sendRequest(InterfaceDeclareProxy.COMMAND_TEST_INTERFACE, _data, _reply, _option).then(function(result) {
            if (result.errCode === 0) {
                let _errCode = result.reply.readInt();
                callback(_errCode);
            } else {
                console.log("sendRequest failed, errCode: " + result.errCode);
            }
        })
    }

    static readonly COMMAND_TEST_INTERFACE = 1;
    private proxy
}

