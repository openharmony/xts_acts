

import {subCallback} from "./sub_service_ext";
import SubServiceExt from "./sub_service_ext";
import rpc from "@ohos.rpc";

export default class SubServiceExtStub extends rpc.RemoteObject implements SubServiceExt {
    constructor(des: string) {
        super(des);
    }
    
    async onRemoteMessageRequest(code: number, data, reply, option): Promise<boolean> {
        console.log("onRemoteMessageRequest called, code = " + code);
        switch(code) {
            case SubServiceExtStub.COMMAND_SUB: {
                let _num1 = data.readInt();
                let _num2 = data.readInt();
                this.sub(_num1, _num2, (errCode, returnValue) => {
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
    
    sub(num1: number, num2: number, callback: subCallback): void{}

    static readonly COMMAND_SUB = 1;
}

