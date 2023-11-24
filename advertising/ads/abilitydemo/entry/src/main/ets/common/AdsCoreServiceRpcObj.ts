import rpc from '@ohos.rpc';
import Logger from '../log/HiAdLog';

const TAG = 'AdsCoreSEARpcObj';
const REQUEST_CODE: number = 1; // 请求单广告位广告

/**
 * AdsCoreService返回给调用方的rpc对象，用于调用方向service发送数据
 */
export default class AdsCoreServiceRpcObj extends rpc.RemoteObject {
  constructor(des) {
    super(des);
  }

  // 接收客户端传递过来的消息处理，以及将处理的结果返回给客户端
  onRemoteMessageRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
    if (code === REQUEST_CODE) {
      let callingUid = data.readInt();
      Logger.i(TAG, `ad request adrequest callinguid is : ${callingUid}`);
      let remoteObject: rpc.IRemoteObject = data.readRemoteObject();
      Logger.i(TAG, `ad request remoteObject is : ${remoteObject}`);
      let adrequest: string = data.readString();
      Logger.i(TAG, `ad request adrequest is : ${adrequest}`);
      let adoptions: string = data.readString();
      Logger.i(TAG, `ad request adoptions is : ${adoptions}`);
      let collect: string = data.readString();
      Logger.i(TAG, `ad request collect is : ${collect}`);
      let data1: rpc.MessageSequence = rpc.MessageSequence.create();
      let reply1: rpc.MessageSequence = rpc.MessageSequence.create();
      // 返回单广告位广告码
      let code1: number = 1;
      // 构造返回给客户端的广告数据
      let ad = [{
        adType: 7, // 轮播改成8
        rewardVerifyConfig: {
          "key1": "value1",
          "key2": "value2",
          "key3": "value3"
        },
        uniqueId: '45678',
        rewarded: true,
        shown: true,
        clicked: false
      },
        {
          adType: 7,
          rewardVerifyConfig: {
            "key1": "value1",
            "key2": "value2",
            "key3": "value3"
          },
          uniqueId: '45678',
          rewarded: true,
          shown: true,
          clicked: false
        }];
      data1.writeInt(200); // 返回200表示广告请求正常
      data1.writeString(JSON.stringify(ad));
      reply.writeInt(100);
      Logger.i(TAG, `sendMessageRequest`);
      remoteObject.sendMessageRequest(code1, data1, reply1, new rpc.MessageOption());
    }
    return true;
  }
}