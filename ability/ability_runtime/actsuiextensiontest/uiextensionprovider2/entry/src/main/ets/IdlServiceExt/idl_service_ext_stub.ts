

import {addCallback} from "./i_idl_service_ext";
import IIdlServiceExt from "./i_idl_service_ext";
import rpc from "@ohos.rpc";

export default class IdlServiceExtStub extends rpc.RemoteObject implements IIdlServiceExt {
    constructor(des: string) {
        super(des);
    }
    
    async onRemoteMessageRequest(code: number, data, reply, option): Promise<boolean> {
        console.log("onRemoteMessageRequest called, code = " + code);
        switch(code) {
            case IdlServiceExtStub.COMMAND_ADD: {
                let _num1 = data.readInt();
                let _num2 = data.readInt();
                this.add(_num1, _num2, (errCode, returnValue) => {
                    reply.writeInt(errCode);
                    if (errCode == 0) {
                        reply.writeInt(returnValue);
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
    
    add(num1: number, num2: number, callback: addCallback): void{}

    static readonly COMMAND_ADD = 1;
}

