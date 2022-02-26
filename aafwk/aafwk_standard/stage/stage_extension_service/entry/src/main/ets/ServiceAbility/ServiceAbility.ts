import ServiceExtension from "@ohos.application.ServiceExtension"

export default class MyServiceAbility extends ServiceExtension {

    onCreate(want){
        console.log('MyApplication.MyServiceExtension onCreate' + JSON.stringify(want));
        globalThis.extensionContext = this.context;
    }

    onDestroy(){
        console.log('[MyApplication] MyServiceExtension onDestroy');
    }

    onRequest(want,startId){
        console.log('[MyApplication] MyServiceExtension onRequest' + JSON.stringify(want) + JSON.stringify(startId));
    }

    onConnect(want){
        console.log('[MyApplication] MyServiceExtension onConnect' + JSON.stringify(want));
    }

    onDisconnect(want){
        console.log('[MyApplication] MyServiceExtension onConnect' + JSON.stringify(want));
    }

    onReconnect(want){
        console.log('[MyApplication] MyServiceExtension onConnect' + JSON.stringify(want));
    }
}
