import ServiceExtensionAbility from "@ohos.application.ServiceExtensionAbility";
import rpc from "@ohos.rpc";
import commonEvent from '@ohos.commonEvent';

class StubTest2 extends rpc.RemoteObject {
    constructor(des) {
        if (typeof des === 'string') {
            super(des);
        }
        else {
            return null;
        }
    }
    queryLocalInterface(descriptor) {
        return null;
    }
    getInterfaceDescriptor() {
        return "";
    }
    sendRequest(code, data, reply, options) {
        return null;
    }
    getCallingPid() {
        return 0;
    }
    getCallingUid() {
        return 0;
    }
    attachLocalInterface(localInterface, descriptor) { }
    onRemoteRequest(code, data, reply, options) {
        console.log(printLogS2 + "onRemoteRequest");
        if (code == 1) {
            console.log(printLogS2 + "onRemoteRequest code 1");
            let op1 = data.readInt();
            let op2 = data.readInt();
            console.log(printLogS2 + "onRemoteRequest op1 = " + op1 + ", op2 = " + op2);
            reply.writeInt(op1 + op2);
        }
        else {
            console.log(printLogS2 + "onRemoteRequest code = " + code);
        }
        return true;
    }
}

var printLogS2 = "Stage:ServiceAbility2:";
var listPushS2 = "Stage_ServiceAbility2_";
class ExtensionAbility2 extends ServiceExtensionAbility {
     onCreate(want) {
        console.log(printLogS2 + 'onCreate');

        commonEvent.publish(listPushS2 + "onCreate", (err) => {
            console.info(printLogS2 + listPushS2 + "onCreate");
        });
    }

    onDestroy() {
        console.log(printLogS2 + 'onDestroy');

        commonEvent.publish(listPushS2 + "onDestroy", (err) => {
            console.info(printLogS2 + listPushS2 + "onDestroy");
        });
    }

    onRequest(want, startId) {
        console.log(printLogS2 + 'onRequest');
    }

    onConnect(want) {
        console.log(printLogS2 + 'onConnect');
        return new StubTest2("Test1");
    }

    onDisconnect(want) {
        console.log(printLogS2 + 'onDisconnect');
    }
};

export default ExtensionAbility2