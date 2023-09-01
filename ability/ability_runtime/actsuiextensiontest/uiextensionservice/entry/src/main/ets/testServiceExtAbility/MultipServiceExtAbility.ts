import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
import MultipServiceExtStub from '../IdlServiceExt/MultipService/multip_service_ext_stub';
import { multipCallback } from '../IdlServiceExt/MultipService/multip_service_ext';
import Logger from '../util/Logger';

class ServiceExtStub extends MultipServiceExtStub{

  multip(num1: number, num2: number, callback: multipCallback): void{
      let res = num1 * num2
      callback(0,res)
      Logger.info(`add result: ${res}`)
  }
}

export default class MultipServiceExtAbility extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`)
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`)
  }

  onConnect(want) {
    Logger.info(`onConnect , want: ${want.abilityName}`)
    return new ServiceExtStub("multip service stub")
  }

  onDisconnect(want) {
    Logger.info(`onDisconnect, want: ${want.abilityName}`)
  }

  onDestroy() {
    Logger.info(`onDestroy`)
  }
}