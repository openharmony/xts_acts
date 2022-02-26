import file from '@system.file';

import {Core, ExpectExtend, InstrumentLog, ReportExtend} from "deccjsunit/index.ets"
import testsuite from "../../test/List.test.ets"

@Entry
@Component
struct Index {

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
    core.subscribeEvent('task', reportExtend)
    const configService = core.getDefaultService('config')

    console.info('parameters---->' + JSON.stringify(globalThis.abilityWant.parameters))
    configService.setConfig(globalThis.abilityWant.parameters)

    testsuite(globalThis.abilityContext)

    core.execute()
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World 111!')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('next page')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
      })
    }
    .width('100%')
    .height('100%')
  }
}