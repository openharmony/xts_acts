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

export default class InterfaceDeclareStub extends rpc.RemoteObject implements IInterfaceDeclare {
    constructor(des: string) {
        super(des);
    }
    
    onRemoteRequest(code: number, data, reply, option): boolean {
        console.log("onRemoteRequest called, code = " + code);
        switch(code) {
            case InterfaceDeclareStub.COMMAND_TEST_INTERFACE: {
                let _data = data.readInt();
                this.testInterface(_data, (errCode) => {
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
    
    testInterface(data: number, callback: testInterfaceCallback): void{}

    static readonly COMMAND_TEST_INTERFACE = 1;
}

