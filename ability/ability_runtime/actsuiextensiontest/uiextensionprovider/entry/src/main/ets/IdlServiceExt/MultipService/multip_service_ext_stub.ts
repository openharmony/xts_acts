

import {multipCallback} from "./multip_service_ext";
import MultipServiceExt from "./multip_service_ext";
import rpc from "@ohos.rpc";

export default class MultipServiceExtStub extends rpc.RemoteObject implements MultipServiceExt {
    constructor(des: string) {
        super(des);
    }
    
    async onRemoteMessageRequest(code: number, data, reply, option): Promise<boolean> {
        console.log("onRemoteMessageRequest called, code = " + code);
        switch(code) {
            case MultipServiceExtStub.COMMAND_MULTIP: {
                let _num1 = data.readInt();
                let _num2 = data.readInt();
                this.multip(_num1, _num2, (errCode, returnValue) => {
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
    
    multip(num1: number, num2: number, callback: multipCallback): void{}

    static readonly COMMAND_MULTIP = 1;
}

