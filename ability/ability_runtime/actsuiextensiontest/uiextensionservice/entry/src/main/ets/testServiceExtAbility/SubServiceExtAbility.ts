import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
import SubServiceExtStub from '../IdlServiceExt/SubService/sub_service_ext_stub';
import { subCallback } from '../IdlServiceExt/SubService/sub_service_ext';
import Logger from '../util/Logger';

class ServiceExtStub extends SubServiceExtStub{

  sub(num1: number, num2: number, callback: subCallback): void{
      let res = num1 - num2
      callback(0,res)
      Logger.info(`sub result: ${res}`)
  }
}

export default class SubServiceExtAbility extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`)
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`)
  }

  onConnect(want) {
    Logger.info(`onConnect , want: ${want.abilityName}`)
    return new ServiceExtStub("sub service stub")
  }

  onDisconnect(want) {
    Logger.info(`onDisconnect, want: ${want.abilityName}`)
  }

  onDestroy() {
    Logger.info(`onDestroy`)
  }
}