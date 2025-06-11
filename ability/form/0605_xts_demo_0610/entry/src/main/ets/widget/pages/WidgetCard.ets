
import { memo, __memo_context_type, __memo_id_type } from "@ohos.arkui.stateManagement"
import { Component, Row, Column, Text, Entry, FormLink } from "@ohos.arkui.component"
import hilog from '@ohos.hilog'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

@Entry
@Component
struct WidgetCard {
  aboutToAppear() {
    hilog.info(domain, tag, 'WidgetCard enter');
  }

  build() {
    Text("Hello World").fontSize(20)
  }
}