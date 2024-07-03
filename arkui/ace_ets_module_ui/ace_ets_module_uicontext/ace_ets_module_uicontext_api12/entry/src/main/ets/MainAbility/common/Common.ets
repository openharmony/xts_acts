/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import RectValue from './Rect';

export default class CommonFunc {
  public static rectLeft: number;
  public static rectTop: number;
  public static rectRight: number;
  public static rectBottom: number;
  public static rectValue: RectValue;

  static sleep(time: number){
    return new Promise((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve('ok')
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getComponentRect(key: string){
    let strJson: string = getInspectorByKey(key);
    console.info('[getInspectorByKey] current component obj is: ' + JSON.stringify(JSON.parse(strJson)));
    console.info('[getInspectorByKey] rectInfo is: ' + JSON.parse('[' + JSON.parse(strJson).$rect + ']'));
    CommonFunc.rectLeft = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0]
    CommonFunc.rectTop = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1]
    CommonFunc.rectRight = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0]
    CommonFunc.rectBottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1]
    return CommonFunc.rectValue = {
      left: CommonFunc.rectLeft, top: CommonFunc.rectTop, right: CommonFunc.rectRight, bottom: CommonFunc.rectBottom
    }
  }

  static getComponentRectOnScreen(key: string) :RectValue{
    let strJson = getInspectorByKey(key);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
    console.info("[getInspectorByKey] rectInfo is: " + JSON.parse('[' + JSON.parse(strJson).$rect + ']'));
    console.info("windowRect Left: " + globalThis.winLeft + ',' + "windowRect Top: " + globalThis.winTop );
    CommonFunc.rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0] + globalThis.winLeft;
    CommonFunc.rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1] + globalThis.winTop;
    CommonFunc.rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0] + globalThis.winLeft;
    CommonFunc.rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1] + globalThis.winTop;
    return CommonFunc.rect_value = {
      left: CommonFunc.rect_left, top: CommonFunc.rect_top, right: CommonFunc.rect_right, bottom: CommonFunc.rect_bottom
    }
  }
}




