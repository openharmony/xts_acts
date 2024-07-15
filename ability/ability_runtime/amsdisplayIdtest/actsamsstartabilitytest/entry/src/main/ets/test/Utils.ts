/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import {Driver, ON} from '@ohos.UiTest';
import common from '@ohos.app.ability.common';

export async function startAbilityProcess(driver, options, parameters) {
  let bundleName;
  let abilityName;

  try {
    let idx = parameters.nextStep;
    switch (parameters.step[idx]) {
      case "testA":
        bundleName = "com.example.actsspecifytesthap";
        abilityName = "com.example.actsspecifytesthap.MainAbility";
        break;
      default:
        break;
    }
    parameters.nextStep = ++idx;
    AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility({
      bundleName: bundleName,
      abilityName: abilityName,
      parameters: parameters,
    }, options, (error, data) => {
      console.log('startAbilityProcess result: ' + JSON.stringify(error) + ", " + JSON.stringify(data))
    })
    await driver.delayMs(2000);
    let allowed = await driver.findComponent(ON.text("打开"));
    if (allowed) {
      console.log("find button");
      let point = await allowed.getBoundsCenter();
      console.log('point.x : ' + point.x +'point.y : '+ point.y);

      await driver.click(point.x, point.y);
    }
  } catch (err) {
    console.log('ACTS_getDisplayIdTest_0100 err: ' + err)
  }
}