// @ts-nocheck
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
import file from '@system.file';
import {Core, ExpectExtend, InstrumentLog, ReportExtend} from "deccjsunit/index.ets"
import list from '../test/ListTest'

@Entry
@Component
struct Index {
  @State message: string = 'MainAbility'

  aboutToAppear() {
    console.info("start run testcase!!!!")
    const core = Core.getInstance()
    const expectExtend = new ExpectExtend({
      'id': 'extend'
    })
    core.addService('expect', expectExtend)
    const reportExtend = new ReportExtend(file)

    core.addService('report', reportExtend)
    core.init()
    globalThis.abilityWant.parameters.timeout = 20000;

    core.subscribeEvent('task', reportExtend)
    const configService = core.getDefaultService('config')
    configService.setConfig(globalThis.abilityWant.parameters)
    console.info('parameters---->' + JSON.stringify(globalThis.abilityWant.parameters))
    list(globalThis.abilityContext)
    core.execute()
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}