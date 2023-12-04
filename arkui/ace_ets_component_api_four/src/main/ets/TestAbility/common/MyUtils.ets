/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
export default class Utils {
  public static instance;

  static sleep(time) {
    return new Promise((resolve, reject) => {
      try {
        setTimeout(() => {
          resolve(0)
        }, time)
      } catch (err) {
        console.error('sleep error:' + err);
        reject()
      }
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getComponentRect(key) {
    let strJson = getInspectorByKey(key);
    let obj = JSON.parse(strJson);
    console.info('[getInspectorByKey] key is: ' + key);
    return Utils.getComponentRectByObj(obj);
  }

  static getComponentRectByObj(obj) {
    console.info('[getInspectorByKey] current component type: ' + obj.$type + 'rectInfo:' + JSON.stringify(obj.$rect));
    let rectStr = obj.$rect.replaceAll('[','').replace(']', ',').replace(']','')
    let rectInfo = rectStr.split(',', 4);

    let rect_value = {
      'left': Math.round(Number(rectInfo[0])),
      'top': Math.round(Number(rectInfo[1])),
      'right': Math.round(Number(rectInfo[2])),
      'bottom': Math.round(Number(rectInfo[3]))
    };
    return rect_value;
  }

  static getComponentByKey(componentKey) {
    let strJson = getInspectorByKey(componentKey);
    console.info('component Json is:' + strJson);
    let obj = JSON.parse(strJson);
    console.info('[' + componentKey + '] obj is: ' + JSON.stringify(obj));
    return obj;
  }

  static sendEvent(message, eventId) {
    var eventData = {
      data: {
        "msg": message
      }
    }
    let event = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

}