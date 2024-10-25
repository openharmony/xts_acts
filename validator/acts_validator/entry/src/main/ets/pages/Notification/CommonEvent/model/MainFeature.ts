/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import commonEventManager from '@ohos.commonEventManager';
import HashMap from '@ohos.util.HashMap';
import consts from './Consts';
import surveillanceEventsManager from './SurveillanceEventsManager';

export default class MainFeature {
  private onceEvents: Array<string> = [];
  private currentValidEvents: Array<string> = surveillanceEventsManager.surveillanceEvents;
  private settingSubscriber = null
  // this subscriber subscribe self defined sticky events
  private eventsState: HashMap<string, number> = new HashMap();

  constructor() {
    this.refreshCurrentState();
  }

  async init(): Promise<void> {
    if (this.settingSubscriber == null) {
      let settingSubscriberInfo = {
        events: [
          consts.COMMON_EVENT_SETTING_UPDATE
        ]
      };
      commonEventManager.createSubscriber(settingSubscriberInfo).then((subscriber) => {
        this.settingSubscriber = subscriber;
        commonEventManager.subscribe(subscriber, (error, event) => {
          this.clearEvents();
          surveillanceEventsManager.surveillanceEvents.forEach((element: string) => {
            this.eventsState.set(element, event.parameters[element]);
          });
          this.refreshEvents();
        })
      })
    }
  }

  refreshCurrentState(): void {
    this.clearEvents();
    let eventStates = surveillanceEventsManager.getSurveillanceEventStates();
    surveillanceEventsManager.surveillanceEvents.forEach((element: string) => {
      this.eventsState.set(element, eventStates[`${element}`]);
    });
    this.refreshEvents();
  }

  refreshEvents(): void {
    this.eventsState.forEach((value, key) => {
      switch (value) {
        case consts.ENABLE_STATE_ALWAYS:
          this.currentValidEvents.push(key);
          break;
      }
    });
  }

  clearEvents(): void {
    this.eventsState.clear();
    this.currentValidEvents = [];
    this.onceEvents = [];
  }

  reset(): void {
    commonEventManager.unsubscribe(this.settingSubscriber, () => {
      this.settingSubscriber = null;
    });
  }

  getOnceEvents(): Array<string> {
    return this.onceEvents;
  }

  getCurrentValidEvents(): Array<string> {
    return this.currentValidEvents;
  }
}