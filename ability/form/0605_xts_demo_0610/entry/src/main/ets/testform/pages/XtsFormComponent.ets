import { memo, __memo_context_type, __memo_id_type } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import { Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView, Entry } from "@ohos.arkui.component"  // TextAttribute should be insert by ui-plugins
import { State, StateDecoratedVariable, MutableState, stateOf, observableProxy } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { FormComponent } from "@ohos.arkui.component"

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

@Entry
@Component
struct XtsFormComponent {
  aboutToAppear() {
    hilog.info(domain, tag, 'XtsFormComponent enter');
  }
  @State formId: string = '0';

  build() {
    Column() {
      Text("XTS FormComponent")
        .fontSize(20)
      FormComponent({
        id:this.formId,
        name:"widget",
        bundle:"com.example.myapplication",
        ability:"EntryFormAbility",
        module:"entry",
        // dimension:FormDimension.Dimension_2_2,
        temporary:false
      })
        .allowUpdate(true)
        .size({width:360,height:360})
        // .visibility(Visibility.Visible)
        // .onError(()=>{
        //   hilog.info(domain, tag, 'XtsFormComponent onError');
        // })
    }
    .width('100%')
    .height('100%')
  }
}
