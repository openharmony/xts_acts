import { Text, Component, Button, ClickEvent, Entry } from "@ohos.arkui.component"  // TextAttribute should be insert by ui-plugins
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import formProvider from "@ohos.app.form.formProvider"

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

@Entry
@Component
struct XtsFormProvider {
  aboutToAppear() {
    hilog.info(domain, tag, 'XtsFormProvider enter');

    let formId: string = '3610022740'; //用hap包装好的应用的卡片id
    try {
      formProvider.setFormNextRefreshTime(formId, 2, (error: BusinessError) => {
        if (error?.code) {
          hilog.info(domain, tag, `XtsFormProvider callback error, code:${error?.code}`);
          // return;
        }
        hilog.info(domain, tag, 'XtsFormProvider setFormNextRefreshTime callback success');
      });
      hilog.info(domain, tag, 'XtsFormProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.info(domain, tag, 'XtsFormProvider catch error');
    }

    let formId2: string = '21347330770'; //用hap包装好的应用的卡片id
    try {
      formProvider.setFormNextRefreshTime(formId2, 3).then(() => {
        hilog.info(domain, tag, `XtsFormProvider setFormNextRefreshTime success`);
      }).catch((error) => {
        hilog.info(domain, tag, `XtsFormProvider promise error, code:`);
      });
      hilog.info(domain, tag, 'XtsFormProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.info(domain, tag, `XtsFormProvider catch error, code: `);
    }
  }

  build() {
    Text("XTS FormProvider").fontSize(20)
  }
}
