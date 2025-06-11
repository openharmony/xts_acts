import { Text, Component, Button, ClickEvent, Entry } from "@ohos.arkui.component"  // TextAttribute should be insert by ui-plugins
import hilog from '@ohos.hilog'
import formInfo from "@ohos.app.form.formInfo";

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

@Entry
@Component
struct XtsFormInfo {
  aboutToAppear() {
    hilog.info(domain, tag, 'XtsFormInfo enter');
  }

  build() {
    Text("XTS FormInfo").fontSize(20)
    Button('123').onClick((event: ClickEvent) => {
      hilog.info(domain, tag, 'XtsFormInfo Button 123');
      let runningFormInfoFo: formInfo.RunningFormInfo = {
        formId: 'formId',
        bundleName: 'bundleName',
        hostBundleName: 'hostBundleName',
        formLocation: formInfo.FormLocation.DESKTOP,
        visibilityType: formInfo.VisibilityType.FORM_VISIBLE,
        moduleName: 'moduleName',
        abilityName: 'abilityName',
        formName: 'formName',
        dimension: 123,
        formUsageState: formInfo.FormUsageState.UNUSED,
        formDescription: 'formDescription',
        extraData: {},
      }
      hilog.info(domain, tag, 'XtsFormInfo Button 123456');
    })
  }
}
