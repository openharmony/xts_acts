import ServiceExtensionAbility from "@ohos.application.ServiceExtensionAbility";
import rpc from "@ohos.rpc";
import commonEvent from '@ohos.commonEvent';

class StubTest1 extends rpc.RemoteObject {
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
        console.log(printLogS1 + "onRemoteRequest");
        if (code == 1) {
            console.log(printLogS1 + "onRemoteRequest code 1");
            let op1 = data.readInt();
            let op2 = data.readInt();
            console.log(printLogS1 + "onRemoteRequest op1 = " + op1 + ", op2 = " + op2);
            reply.writeInt(op1 + op2);
        }
        else {
            console.log(printLogS1 + "onRemoteRequest code = " + code);
        }
        return true;
    }
}

var printLogS1 = "Stage:ServiceAbility:";
var listPushS1 = "Stage_ServiceAbility_";
class ExtensionAbility extends ServiceExtensionAbility {
     onCreate(want) {
        console.log(printLogS1 + 'onCreate');

        commonEvent.publish(listPushS1 + "onCreate", (err) => {
            console.info(printLogS1 + listPushS1 + "onCreate");
        });
    }

    onDestroy() {
        console.log(printLogS1 + 'onDestroy');

        commonEvent.publish(listPushS1 + "onDestroy", (err) => {
            console.info(printLogS1 + listPushS1 + "onDestroy");
        });
    }

    onRequest(want, startId) {
        console.log(printLogS1 + 'onRequest');
    }

    onConnect(want) {
        console.log(printLogS1 + 'onConnect');
        return new StubTest1("Test1");
    }

    onDisconnect(want) {
        console.log(printLogS1 + 'onDisconnect');

        this.context
    }

    dump(param) {
        console.info(printLogS1 + "dump = " + JSON.stringify(param))
        var CommonEventPublishData = {
            parameters: {
                dumpParam: param
            }
        }
        commonEvent.publish(listPushS1 + "Dump", CommonEventPublishData, (err) => {
            console.info(printLogS1 + listPushS1 + "Dump");
        });

        return ["ExtensionAbility"]
    }
};

export default ExtensionAbility