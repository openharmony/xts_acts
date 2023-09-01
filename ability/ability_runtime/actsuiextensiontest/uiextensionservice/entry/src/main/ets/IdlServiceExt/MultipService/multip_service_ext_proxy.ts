

import {multipCallback} from "./multip_service_ext";
import MultipServiceExt from "./multip_service_ext";
import rpc from "@ohos.rpc";

export default class MultipServiceExtProxy implements MultipServiceExt {
    constructor(proxy) {
        this.proxy = proxy;
    }

    multip(num1: number, num2: number, callback: multipCallback): void
    {
        let _option = new rpc.MessageOption();
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(num1);
        _data.writeInt(num2);
        this.proxy.sendMessageRequest(MultipServiceExtProxy.COMMAND_MULTIP, _data, _reply, _option).then(function(result) {
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
                console.log("sendMessageRequest failed, errCode: " + result.errCode);
            }
        })
    }

    static readonly COMMAND_MULTIP = 1;
    private proxy
}

