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

import router from '@ohos.router';
import { AttrsManager } from './AttrsManager';


export class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

export default class Utils {

  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  static async pushPage(obj: ESObject) {
    try {
      let pages = router.getState();
      let pageParams: ESObject = router.getParams();
      console.info('get ' + obj.pageName + ' state pages: ' + JSON.stringify(pages));
      if (pageParams && pageParams['view'] && obj.targetView != pageParams['view']['targetView']) {
        console.info('get ' + obj.pageName + ' params: ' + JSON.stringify(pageParams));
        console.info('pageParams.view.targetView: ' + pageParams['view']['targetView']);
        console.info('targetView: ' + obj.targetView);
        await Utils.back();
        pages = router.getState();
      }

      if (!(obj.pageName == pages.name)) {
        console.info('get ' + obj.pageName + ' state pages.name:' + JSON.stringify(pages.name));
        let result = await router.pushUrl({
          url: obj.pageUrl,
          params: {
            view: obj
          }
        });
        await Utils.sleep(2000);
        console.info('push ' + obj.pageName + ' page result:' + JSON.stringify(result));
      }
    } catch (err) {
      console.error('push ' + obj.pageName + ' page error:' + err);
    }
  }

  static async back() {
    if (!('Index' == router.getState().name)) {
      router.back()
    }
    AttrsManager.unRegisterDataChange();
    await Utils.sleep(1000);
    router.clear();
  }

  static getComponentRect(key: string): RectValue {
    let strJson = getInspectorByKey(key);
    console.info('[getInspectorByKey] key is: ' + key);
    return Utils.getComponentRectByObj(JSON.parse(strJson));
  }

  static getComponentRectByObj(obj: ESObject): RectValue {
    console.info('[getInspectorByKey] current component is: ' + obj.$type);
    let rectInfo: ESObject = JSON.parse('[' + obj.$rect + ']');
    let rect_value: RectValue = {
      left: Number(JSON.parse('[' + rectInfo[0] + ']')[0]),
      top: Number(JSON.parse('[' + rectInfo[0] + ']')[1]),
      right: Number(JSON.parse('[' + rectInfo[1] + ']')[0]),
      bottom: Number(JSON.parse('[' + rectInfo[1] + ']')[1])
    };
    console.info(JSON.stringify(rect_value));
    return rect_value;
  }

  static getComponentByKey(componentKey: string): ESObject {
    let strJson = getInspectorByKey(componentKey);
    console.info('[' + componentKey + '] obj is: ' + JSON.stringify(JSON.parse(strJson)));
    return JSON.parse(strJson);
  }

}