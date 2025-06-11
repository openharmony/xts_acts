import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView, NavDestination } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, StateDecoratedVariable, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

import { FormLink } from "@ohos.arkui.component"
import formProvider from "@ohos.app.form.formProvider"
import formInfo from "@ohos.app.form.formInfo"
// import { Router } from '@ohos.arkui.UIContext'
import formError from "@ohos.application.formError"
import batteryInfo from "@ohos.batteryInfo"

export interface params {
  message : string,
};

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag 1'; //日志标识字符串,作为tag标识当前runner类下的测试行为

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  @State isFormLinkPage: boolean = false;
  message: string = 'var';

  aboutToAppear() {
    hilog.info(domain, tag, `Index enter`);

    // let errorCode: formInfo.PublishFormErrorCode;
    // errorCode = formInfo.PublishFormErrorCode.SUCCESS;
    // errorCode = formInfo.PublishFormErrorCode.NO_SPACE;
    // errorCode = formInfo.PublishFormErrorCode.PARAM_ERROR;
    // errorCode = formInfo.PublishFormErrorCode.INTERNAL_ERROR;
    try {
      hilog.info(domain, tag, `Index enter1 ${formInfo.PublishFormErrorCode.SUCCESS === 0}`);
    } catch (err: Error) {
      hilog.info(domain, tag, `Index enter1 ${err.message}`);
    }
    try {
      hilog.info(domain, tag, `Index enter2 ${batteryInfo.BatteryCapacityLevel.LEVEL_FULL}`);
    } catch (err: Error) {
      hilog.info(domain, tag, `Index enter2 ${err.message}`);
    }
    try {
      hilog.info(domain, tag, `Index enter3 ${formError.FormError.ERR_COMMON}`);
    } catch (err: Error) {
      hilog.info(domain, tag, `Index enter3 ${err.message}`);
    }

    // let abc = 0;
    // hilog.info(domain, tag, `Index enter ${formError.FormError.ERR_COMMON}`);
  }

  changeValue() {
    this.stateVar+='~'

    // 使用callback异步回调
    hilog.info(0x0000, 'testTag', 'formProvider enter');

    // ------------
    let formId: string = '687758912'; //用hap包装好的应用的卡片id
    try {
      // formProvider.setFormNextRefreshTime(formId, 5);

      formProvider.setFormNextRefreshTime(formId, 5, (error: BusinessError) => {
        if (error?.code) {
          hilog.info(0x0000, 'testTag', `formProvider callback error, code:${error?.code}`);
          // return;
        }
        hilog.info(0x0000, 'testTag', 'formProvider setFormNextRefreshTime callback success');
      });
      hilog.info(0x0000, 'testTag', 'formProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.info(0x0000, 'testTag', 'formProvider setFormNextRefreshTime catch error');
    }

    let formId2: string = '1962682377'; //用hap包装好的应用的卡片id
    try {
      await formProvider.setFormNextRefreshTime(formId2, 9);
      hilog.info(0x0000, 'testTag', `formProvider setFormNextRefreshTime success`);

      // .then(() => {
      //   hilog.info(0x0000, 'testTag', `formProvider setFormNextRefreshTime success`);
      // }).catch(
      //   () => {
      //     hilog.info(0x0000, 'testTag', `promise error, code:`);
      //   } // 这种写法1.1没问题，在1.2会报错，当catch里有匿名函数报错，catch里无内容只是一个()则不报错
      // );  // 所以对于promise返回值的接口，用await来验证
    } catch (error) {
      hilog.info(0x0000, 'testTag', `formProvider setFormNextRefreshTime catch error, code:`);
      //TypeError: Property 'code' does not exist on type 'Object' [Index.ets:84:64]
    }
    hilog.info(0x0000, 'testTag', 'test into index build...');
  }
  build() {
    if (this.isFormLinkPage) {
      FormLink({
        action: 'message',
        abilityName: "EntryAbility",
        // params: {
        //   message: this.MESSAGE,
        // },
      }) {
        Column(undefined) {
          Button("Jump back").backgroundColor("#ff2fa6c8")
            .onClick((e: ClickEvent) => {
              hilog.info(0x0000, 'testTag', 'On Click Jump back');
              this.isFormLinkPage = false;
            })
        }
        .onAppear(() => {
          hilog.info(domain, tag, '%{public}s', 'FormLinkTest001 start 002999');
        })
      }
    } else {
      Column(undefined) {
        Text("Hellooooooooooooooooooo World").fontSize(20)

        Column(undefined) {
          Button("Jump to test formLink-StsSetAction").backgroundColor("#ff653dd2")
            .onClick((e: ClickEvent) => {
              hilog.info(0x0000, 'testTag', 'On Click Jump to test formLink');
              this.isFormLinkPage = true;
            })

          Button("click to test formProvider.setFormNextRefreshTime")
            .backgroundColor("#FFFF00FF")
            .onClick((e: ClickEvent) => {
              hilog.info(0x0000, 'testTag', 'On Click to test');
              this.changeValue()
            })

          // "testform/pages/XtsFormLink",
          // "testform/pages/XtsFormComponent",
          // "testform/pages/XtsFormProvider"
          Button("router.push").backgroundColor("#ff35e288")
            .onClick((e: ClickEvent) => {
              hilog.info(0x0000, 'testTag', 'onClick router.push');
              let aRouter = this.getUIContext().getRouter();
              try {
                aRouter.pushUrl({url: 'testform/pages/XtsFormLink'})
              } catch (e: Error) {
                hilog.info(0x0000, 'testTag', 'pushUrl error:' + e.message);
              }
            })

          Text(this.stateVar).fontSize(20)
          Child({ stateVar: this.stateVar } as __Options_Child)
        }
      }
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
