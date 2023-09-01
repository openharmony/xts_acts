import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
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

export default class TestServiceExtAbilityUnvisible extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`)
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`)
  }

  onConnect(want) {
    Logger.info(`onConnect , want: ${want.abilityName}`)
    return new ServiceExtStub("add service stub")
  }

  onDisconnect(want) {
    Logger.info(`onDisconnect, want: ${want.abilityName}`)
  }

  onDestroy() {
    Logger.info(`onDestroy`)
  }
}