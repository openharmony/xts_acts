import { Text, Component, Button, ClickEvent, Entry, FormLink } from "@ohos.arkui.component"  // TextAttribute should be insert by ui-plugins
import hilog from '@ohos.hilog'
import CommonEventManager from '@ohos.commonEventManager';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

@Entry
@Component
struct XtsFormLink {
  aboutToAppear() {
    hilog.info(domain, tag, 'XtsFormLink enter');
  }

  build() {
    FormLink({
      action: 'message',
      abilityName: 'EntryFormAbility',
    }) {
      Text("XTS FormLink").fontSize(20)
        .onAppear(() => {
          CommonEventManager.publish("XTS_FormLinkTest_commonEvent", () => {
            hilog.info(domain, tag, '%{public}s', 'FormLinkTest001 commonEvent publish');})
        })
    }
  }
}
