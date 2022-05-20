/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

// @ts-nocheck
import featureAbility from "@ohos.ability.featureAbility";
import file from '@system.file';
import { Core, ExpectExtend, ReportExtend } from "deccjsunit/index.ets";
import testsuite from "../test/List.test.ets";

@Entry
@Component
struct Index {

  aboutToAppear() {

    console.info("[FormComponent] start run testcase!!!!");

    featureAbility.getWant()
      .then((want: any) => {
        console.info('[FormComponent] Operation successful. Data: ' + JSON.stringify(want));
        const core = Core.getInstance();
        const expectExtend = new ExpectExtend({
          'id': 'extend'
        });
        core.addService('expect', expectExtend);
        const reportExtend = new ReportExtend(file);
        core.addService('report', reportExtend);
        core.init();
        core.subscribeEvent('task', reportExtend);
        const configService = core.getDefaultService('config');
        want.parameters['timeout'] = 10000;
        console.info('[FormComponent] parameters---->' + JSON.stringify(want.parameters));
        configService.setConfig(want.parameters);
        testsuite();
        core.execute();
      })
      .catch((error: any) => {
        console.error('[FormComponent] Operation failed. Cause: ' + JSON.stringify(error));
      })
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Text('Fms Stress Test')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
      .height('100%')
  }
}

