import rpc from '@ohos.rpc';
import Logger from '../log/HiAdLog';

const TAG = 'AdsRpcDeathRecipient';

/**
 * 用于监听远程RPC对象的死亡状态
 */
export default class AdsRpcDeathRecipient implements rpc.DeathRecipient {
  /**
   * rpc远程对象来源
   */
  private callingUid: number;

  constructor(callingUid: number) {
    this.callingUid = callingUid;
  }

  onRemoteDied(): void {
    Logger.i(TAG, `remote rpc obj from ${this.callingUid} is died`);
  }
}




