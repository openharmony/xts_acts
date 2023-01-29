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
import file from '@system.file';
import { Core, ExpectExtend, InstrumentLog, ReportExtend } from "deccjsunit/index"
import testsuite from "../../../test/List.test.ets"
import featureAbility from "@ohos.ability.featureAbility"
import { UiDriver, BY } from '@ohos.uitest'

var mXComponentController: XComponentController = new XComponentController()
var surfaceId: any

@Entry
@Component
struct Index {
  aboutToAppear() {
    console.info("start run testcase!!!!");
}
  build() {
    Flex() {
      XComponent({
        id: 'xcomponent',
        type: 'surface',
        libraryname: '',
        controller: mXComponentController
      })
        .onLoad(() => {
          console.info('CameraModuleTest: OnLoad() is called!')
          mXComponentController.setXComponentSurfaceSize({ surfaceWidth: 1920, surfaceHeight: 1080 });
          surfaceId = mXComponentController.getXComponentSurfaceId()
          globalThis.value = surfaceId
          console.info('CameraModuleTest: XComponent onLoad surfaceId: ' + globalThis.value)
          const core = Core.getInstance()
          const expectExtend = new ExpectExtend({
            'id': 'extend'
          })
          core.addService('expect', expectExtend)
          const reportExtend = new ReportExtend(file)

          core.addService('report', reportExtend)
          core.init()
          core.subscribeEvent('task', reportExtend)
          const configService = core.getDefaultService('config')
          globalThis.abilityWant.parameters.timeout = 70000;
          configService.setConfig(globalThis.abilityWant.parameters)
          console.info('testsuite()---->')
          testsuite()
          core.execute()
          console.info('core.execute()---->')
        })
        .width('1920px')
        .height('1080px')
    }
  }
}