/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import data_preferences from '@ohos.data.preferences';


export default class FirstDialog {
  // static ChooseDialog = async (StepTips: string, name: string) => {
  //   let Test : data_preferences.Preferences | number;
  //   let context : Context | null;
  //   context = globalThis.getContext();
  //   let preferences : ESObject;
  //
  //   let promise = data_preferences.getPreferences(context, 'mystore');
  //   await promise.then((object) => {
  //     preferences = object;
  //   });
  //   promise = preferences.get(name, 0);
  //   await promise.then((data) => {
  //     Test = data;
  //     console.info("Succeeded in getting value of 'startup'. Data: " + data);
  //   });
  //   if (Test != 1) {
  //     AlertDialog.show(
  //       {
  //         title: '操作提示',
  //         message: StepTips,
  //         primaryButton: {
  //           value: '不再提醒', fontColor: Color.Grey,
  //           action: () => {
  //             promise = preferences.put(name, 1);
  //             promise.then(() => {
  //               console.info("Succeeded in putting value of 'test'.");
  //             });
  //             promise = preferences.flush();
  //             promise.then(() => {
  //               console.info("Succeeded in flushing.");
  //             });
  //           }
  //         },
  //         secondaryButton: {
  //           value: '我已知晓',
  //           action: () => {
  //
  //           }
  //         },
  //         cancel: () => {
  //
  //         }
  //       }
  //     )
  //   }
  //   return;
  // }
  static async ChooseDialog(StepTips: string, name: string) {
    let context = globalThis.getContext();
    let preferences = await data_preferences.getPreferences(context, 'mystore');
    let Test = await preferences.get(name, 0);

    console.info("Succeeded in getting value of '" + name + "'. Data: " + Test);

    if (Test !== 1) {
      AlertDialog.show({
        title: '操作提示',
        message: StepTips,
        primaryButton: {
          value: '不再提醒',
          fontColor: Color.Grey,
          action: async () => {
            await preferences.put(name, 1);
            console.info("Succeeded in putting value of '" + name + "' to 1.");
            await preferences.flush();
            console.info("Succeeded in flushing.");
          }
        },
        secondaryButton: {
          value: '我已知晓',
          action: () => {
            // 可以添加一些操作
          }
        },
        cancel: () => {
          // 取消操作
        }
      });
    }
  }
}