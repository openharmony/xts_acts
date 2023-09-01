import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
import commonEventManager from '@ohos.commonEventManager'
import IdlServiceExtStub from '../IdlServiceExt/idl_service_ext_stub';
import { addCallback } from '../IdlServiceExt/i_idl_service_ext';
import Logger from '../util/Logger';

class ServiceExtStub extends IdlServiceExtStub{

  add(num1: number, num2: number, callback: addCallback): void{
      let res = num1 + num2
      callback(0,res)
      Logger.info(`add result: ${res}`)
  }
}

let testServiceDestroyEvent = 'testServiceDestroyEvent';

export default class TestServiceExtAbilityEvent extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`)
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`)
  }

  onConnect(want) {
    Logger.info(`TestServiceExtAbilityEvent___onConnect , want: ${want.abilityName}`)
    return new ServiceExtStub("add service stub")
  }

  onDisconnect(want) {
    commonEventManager.publish(testServiceDestroyEvent, (err) => { });
    Logger.info(`TestServiceExtAbilityEvent___onDisconnect, want: ${want.abilityName}`)
  }

  onDestroy() {
    Logger.info(`TestServiceExtAbilityEvent___onDestroy`)
    commonEventManager.publish(testServiceDestroyEvent, (err) => { });
  }
}