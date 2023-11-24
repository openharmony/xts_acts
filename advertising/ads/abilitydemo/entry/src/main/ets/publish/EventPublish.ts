import commonEvent from '@ohos.commonEventManager';
import Logger from '../log/HiAdLog';

const TAG = 'EventPublish';

export class EventPublish {
  static publishEvents(event: string, options) {
    // 发布公共事件
    commonEvent.publish(event, options, (err) => {
      if (err) {
        Logger.e(TAG, `PublishCallBack err=${JSON.stringify(err)}`);
      } else {
        Logger.i(TAG, `Publish success, event: ${JSON.stringify(options)}`);
      }
    })
  }
}