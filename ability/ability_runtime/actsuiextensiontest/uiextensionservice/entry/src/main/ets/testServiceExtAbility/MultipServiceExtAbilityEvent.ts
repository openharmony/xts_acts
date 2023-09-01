import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
import commonEventManager from '@ohos.commonEventManager'
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
let multiServiceDestroyEvent = 'multiServiceDestroyEvent';
export default class MultipServiceExtAbilityEvent extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`)
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`)
  }

  onConnect(want) {
    Logger.info(`MultipServiceExtAbilityEvent___onConnect , want: ${want.abilityName}`)
    return new ServiceExtStub("multip service stub")
  }

  onDisconnect(want) {
    commonEventManager.publish(multiServiceDestroyEvent, (err) => { });
    Logger.info(`MultipServiceExtAbilityEvent___onDisconnect, want: ${want.abilityName}`)
  }

  onDestroy() {
    commonEventManager.publish(multiServiceDestroyEvent, (err) => { });
    Logger.info(`MultipServiceExtAbilityEvent___onDestroy`)
  }
}