import { EventPublish } from './EventPublish';

export class FullScreenAdEventPublish {
  private static instance: FullScreenAdEventPublish;

  static getInstance(): FullScreenAdEventPublish {
    if (!this.instance) {
      this.instance = new FullScreenAdEventPublish();
    }
    return this.instance;
  }

  publishEvents(status: string, data?) {
    let options = {
      code: 1, // 公共事件的初始代码
      data: "initial data", // 公共事件的初始数据
      parameters: {
        "reward_ad_status": status,
        "reward_ad_data": data
      },
    }
    EventPublish.publishEvents("com.company.pps.action.PPS_REWARD_STATUS_CHANGED", options);
  }
}