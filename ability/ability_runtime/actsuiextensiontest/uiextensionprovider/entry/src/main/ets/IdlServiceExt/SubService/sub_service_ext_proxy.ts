

import {subCallback} from "./sub_service_ext";
import SubServiceExt from "./sub_service_ext";
import rpc from "@ohos.rpc";

export default class SubServiceExtProxy implements SubServiceExt {
    constructor(proxy) {
        this.proxy = proxy;
    }

    sub(num1: number, num2: number, callback: subCallback): void
    {
        let _option = new rpc.MessageOption();
        let _data = new rpc.MessageParcel();
        let _reply = new rpc.MessageParcel();
        _data.writeInt(num1);
        _data.writeInt(num2);
        this.proxy.sendMessageRequest(SubServiceExtProxy.COMMAND_SUB, _data, _reply, _option).then(function(result) {
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

    static readonly COMMAND_SUB = 1;
    private proxy
}

