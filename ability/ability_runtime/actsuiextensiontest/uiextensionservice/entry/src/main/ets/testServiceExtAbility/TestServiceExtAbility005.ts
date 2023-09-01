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
let connectid = -1;
export default class TestServiceExtAbility005 extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`)
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`)
  }

  onConnect(want) {
    Logger.info(`onConnect , want: ${want.abilityName}`)
    let want1 = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "SubServiceExtAbility005"
    };
    let options = {
      onConnect(elementName, remote) {
      },
      onDisconnect(elementName) {
      },
      onFailed(code) {
      }
    }
    // 建立连接后返回的Id需要保存下来，在解绑服务时需要作为参数传入
    connectid = this.context.connectServiceExtensionAbility(want1, options);
    return new ServiceExtStub("add service stub")
  }

  async onDisconnect(want) {
    try {
      this.context.disconnectServiceExtensionAbility(connectid)
    } catch (err) {
      // 处理入参错误异常
      Logger.info( `disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`)
    }
    await this.sleep(200); //
    Logger.info(`onDisconnect, want: ${want.abilityName}`)
  }

  sleep(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  onDestroy() {
    Logger.info(`onDestroy`)
  }
}