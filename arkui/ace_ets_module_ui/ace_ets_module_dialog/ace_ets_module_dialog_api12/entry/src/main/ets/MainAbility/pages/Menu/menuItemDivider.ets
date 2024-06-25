/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { LengthUnit } from '@ohos.arkui.node';

@Preview
@Component
export struct MyComponent {
  title: string = 'test';
  func:() => void = () => {}

  @Styles pressedStyle() {
    .backgroundColor(0x238E23)
  }

  @Styles normalStyles() {
    .backgroundColor(0x0000ff)
  }

  build() {
    Text(this.title)
      .key(this.title)
      .fontSize(10)
      .backgroundColor(0x0000ff)
      .fontColor(0xffffff)
      .padding(5)
      .onClick(this.func)
      .stateStyles({ pressed: this.pressedStyle, normal: this.normalStyles})
  }
}

@Extend(Text)
function paramTextStyle() {
  .fontSize(9)
  .width("100%")
}

@Extend(Text)
function componentTextStyle() {
  .fontSize(15)
  .backgroundColor(Color.Orange)
  .margin(3).padding(3)
  .borderWidth(1.0)
}

@Extend(Column) function columnStyle(){
  .borderWidth(1.0)
  .padding(10)
  .width("100")
  .backgroundColor(Color.Pink)
}

@Entry
@Component
struct TestLevel0 {

  scroller: Scroller = new Scroller();
  @State index: number[] = [0];

  //divider测试参数
  @State TestCaseList: (DividerStyleOptions | undefined) [] = [
  //1
    ,
    //2
    undefined,

    //3
    {},

    //4
    {
      strokeWidth: undefined,
      color: undefined,
      startMargin: undefined,
      endMargin: undefined
    },

    //5
    {
      strokeWidth: { value: -10, unit: LengthUnit.VP},
      color: undefined,
      startMargin: undefined,
      endMargin: undefined
    },

    //6
    {
      strokeWidth : { value: -1.5, unit: LengthUnit.VP},
      color: undefined,
      startMargin: undefined,
      endMargin: undefined
    },

    //7
    {
      strokeWidth: { value: 0, unit: LengthUnit.VP},
      color: undefined,
      startMargin: undefined,
      endMargin: undefined
    },

    //8
    {
      strokeWidth: { value: 1, unit: LengthUnit.VP},
      color: Color.Pink,
      startMargin: { value: -10, unit: LengthUnit.VP},
      endMargin: { value: -10, unit: LengthUnit.VP}
    },

    //9
    {
      strokeWidth: {value: 1.5, unit: LengthUnit.VP},
      color: Color.Orange,
      startMargin: { value: -1.5, unit: LengthUnit.VP},
      endMargin: { value: -1.5, unit: LengthUnit.VP}
    },

    //10
    {
      strokeWidth: { value: 10, unit: LengthUnit.VP},
      color: Color.Orange,
      startMargin: { value: 0, unit: LengthUnit.VP},
      endMargin: { value: 0, unit: LengthUnit.VP}
    },

    //11
    {
      strokeWidth: { value: 60, unit: LengthUnit.VP},
      color: "#392F49",
      startMargin: { value: 1, unit: LengthUnit.VP},
      endMargin: { value: 1, unit: LengthUnit.VP}
    },

    //12
    {
      strokeWidth: { value: 3.0, unit: LengthUnit.PX},
      color: "rgba(57, 47, 73, 0.2)",
      startMargin: { value: 1.5, unit: 2},
      endMargin: { value: 1.5, unit: 2},
    },

    //13
    {
      strokeWidth: { value: 3.0, unit: 0},
      color: 0xFF3C4B34,
      startMargin: { value: 10, unit: 0},
      endMargin: { value: 10, unit: 0}
    },

    //14
    {
      strokeWidth: { value: 3.0, unit: 2},
      color: Color.Red,
      startMargin: { value: 60, unit: LengthUnit.VP},
      endMargin: { value: 60, unit: LengthUnit.VP}
    },

    //15
    {
      strokeWidth: {value: 0.2, unit: 3},
      color: $r("app.string.EntryAbility_label"),
      startMargin: { value: 120, unit: 4},
      endMargin: { value: 120, unit: 4}
    },

    //16
    {
      strokeWidth: { value: 3.0, unit: 4},
      color: Color.Green,
      startMargin: { value: 0.3, unit: 3},
      endMargin: {value: 0.3, unit: 3}
    },

    // 17
    {
      strokeWidth: { value: 3.0, unit: 7},
      color: "#392F49",
      startMargin: { value: 1, unit: LengthUnit.VP},
      endMargin: { value: 1, unit: LengthUnit.VP}
    },

    //18
    {
      strokeWidth: { value: 1.5, unit: LengthUnit.VP},
      color:"Color.Pink",  //颜色字符串异常
      startMargin: { value: -1.5, unit: LengthUnit.VP},
      endMargin: { value: -1.5, unit: LengthUnit.VP}
    },

    //19
    {
      strokeWidth: { value: 10, unit: LengthUnit.VP},
      color:"Pink", //颜色字符串异常值
      startMargin: { value: 0, unit: LengthUnit.VP},
      endMargin: { value: 0, unit: LengthUnit.VP}
    },
  ]

  @State select: boolean = true
  private iconStr: ResourceStr = $r("app.media.app_icon")
  private iconStr2: ResourceStr = $r("app.media.app_icon")

  //正常数量的item和ItemGroup
  @Builder
  SubSubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C"})
      MenuItem({ content:"粘贴", labelInfo: "Ctrl+V"})
    }
  }

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制".repeat(5), labelInfo: "Ctrl+C"}) //验证embedded类型, 子菜单内容比一级菜单宽的情况
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V"})
      MenuItemGroup({ header: '小标题'}) {
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项1",
          endIcon: this.iconStr2,
          builder:() => this.SubMenu()
        })
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content: "菜单选项2",
          endIcon: this.iconStr2,
          builder: this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: "三级菜单",
        endIcon: this.iconStr2,
        builder:(): void => this.SubSubMenu()
      })
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.app_icon"), content: "菜单选项"})
        .selectIcon(true)
        .selected(this.select)
        .onChange(()=>{
          this.select != this.select
        })
      MenuItem({ startIcon: $r("app.media.app_icon"), content: "菜单选项"})
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
        endIcon: this.iconStr2,
        builder:():void => this.SubMenu()
      })

      MenuItemGroup({ header: '小标题'}) {
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项1",
          endIcon: this.iconStr2,
          builder: ()=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content: "菜单选项2",
          endIcon: this.iconStr2,
          builder: this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项"
      })
    }
    .backgroundColor(Color.Gray)
    .menuItemDivider(this.TestCaseList[this.index[0]])
    .menuItemGroupDivider(this.TestCaseList[this.index[0]])
  }
  //空Item和ItemGroup
  @Builder
  BlankMenu() {
    Menu() {
    }
    .width(240)
    .height(60)
    .borderWidth(1.0)
    .menuItemDivider({
      strokeWidth: { value: 1.5, unit: LengthUnit.VP},
      color: Color.Pink,
      startMargin: { value: 2, unit: LengthUnit.VP},
      endMargin: { value: 2, unit: LengthUnit.VP}
    },)
  }
  //一个Item和ItemGroup
  @Builder
  OneItemMenu() {
    Menu() {
      MenuItemGroup({ header: '头标', footer: '鼠标'}) {
        MenuItem({
          startIcon:this.iconStr,
          content:'菜单选项1',
          endIcon: this.iconStr2,
        })
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content:'菜单选项2',
          endIcon:this.iconStr2,
        })
      }
      MenuItem({ startIcon: $r("app.media.app_icon"), content: "菜单选项"})
    }
    .backgroundColor(Color.Gray)
    .menuItemDivider({
      strokeWidth: {value: 1.5, unit: LengthUnit.VP},
      color: Color.Pink,
      startMargin: { value:2, unit: LengthUnit.VP},
      endMargin: { value:2, unit: LengthUnit.VP}
    },)
    .menuItemGroupDivider({
      strokeWidth: { value: 1.5, unit: LengthUnit.VP},
      color: Color.Orange,
      startMargin: { value:2, unit: LengthUnit.VP},
      endMargin: { value:2, unit: LengthUnit.VP}
    },)
  }
  //超多Item和ItemGroup
  @State itemIndex: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  @Builder
  MuchItemsMenu(){
    Menu(){
      ForEach(this.itemIndex, (item: number)=> {
        MenuItem({ startIcon: $r("app.media.app_icon"), content: '菜单选项' + item.toString()})
      })
      ForEach(this.itemIndex, (item: number) => {
        MenuItemGroup({ header: '头标' + item.toString(), footer: '尾标' + item.toString()}) {
          MenuItem({
            startIcon: this.iconStr,
            content: "菜单选项1",
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: $r("app.media.app_icon"),
            content: "菜单选项2",
            endIcon: this.iconStr2,
          })
        }
      })
    }
    .backgroundColor(Color.Gray)
    .menuItemDivider({
      strokeWidth: {value: 1.5, unit: LengthUnit.VP},
      color: Color.Pink,
      startMargin: { value: 2, unit: LengthUnit.VP},
      endMargin: { value: 2, unit: LengthUnit.VP}
    },)
    .menuItemGroupDivider({
      strokeWidth: {value: 1.5, unit: LengthUnit.VP},
      color: Color.Orange,
      startMargin: { value: 2, unit: LengthUnit.VP},
      endMargin: { value: 2, unit: LengthUnit.VP}
    },)
  }
  //Menu设置padding:Item和ItemGroup
  @Builder
  ItemMenu_Padding() {
    Menu() {
      MenuItemGroup({ header: '头标', footer: '鼠标'}) {
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项1",
          endIcon: this.iconStr2,
        })
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content: "菜单选项2",
          endIcon: this.iconStr2,
        })
      }
      MenuItem({ startIcon: $r("app.media.app_icon"), content:'菜单选项'})
    }
    .backgroundColor(Color.Gray)
    .borderWidth(1.0)
    .padding(10)
    .menuItemDivider({
      strokeWidth: { value: 1.5, unit: LengthUnit.VP},
      color: Color.Pink,
      startMargin: { value: 2, unit: LengthUnit.VP},
      endMargin: { value:2, unit: LengthUnit.VP}
    },)
    .menuItemGroupDivider({
      strokeWidth: { value: 1.5, unit: LengthUnit.VP},
      color: Color.Pink,
      startMargin: { value: 2, unit: LengthUnit.VP},
      endMargin: { value:2, unit: LengthUnit.VP}
    },)
  }

  build() {
    Scroll(this.scroller) {
      Column({space : 5}) {
        Text('验证Menu分割线')
          .paramTextStyle()
        Column() {
          Text(`不设置Menu的menuItemDivider | menuItemGroupDivider`)
            .paramTextStyle()
          Text(`bindMenu: unset_divider`)
            .componentTextStyle()
            .bindMenu(this.SubMenu())
          Text(`bindContextMenu: unset_divider`)
            .componentTextStyle()
            .bindContextMenu(this.SubMenu(), ResponseType.LongPress)

          Text(`设置Menu的menuItemDivider | menuItemGroupDivider`)
            .paramTextStyle()
          Row({space:2}) {
            Text(`${this.index[0] + 1}` + " / ")
              .fontSize(9)
            Text(`${this.TestCaseList.length}`)
              .key('paramSets_key_0')
              .fontSize(9)
            MyComponent({ title: 'Test0+', func: () =>{
              this.index[0]++
              if (this.index[0] == this.TestCaseList.length) {
                this.index[0] = 0
              }
            }})
            MyComponent({ title: 'Test0-', func: () =>{
              this.index[0]--
              if (this.index[0] <= -1) {
                this.index[0] = this.TestCaseList.length - 1
              }
            }})
          }
          Text(`bindMenu: set_divider`)
            .componentTextStyle()
            .bindMenu(this.MyMenu())
          Text(`bindContextMenu: set_divider`)
            .componentTextStyle()
            .bindContextMenu(this.MyMenu(),ResponseType.LongPress)

          Text(`空Menu的menuItemDivider | menuItemGroupDivider`)
            .paramTextStyle()
          Text(`blankMenu: set_divider`)
            .componentTextStyle()
            .bindMenu(this.BlankMenu())
          Text(`一个Item的Menu的menuItemDivider | menuItemGroupDivider`)
            .paramTextStyle()
          Text(`OneItemMenu: set_divider`)
            .componentTextStyle()
            .bindMenu(this.OneItemMenu())
          Text(`超多Item的Menu的menuItemDivider | menuItemGroupDivider`)
            .paramTextStyle()
          Text(`MuchItemMenu: set_divider`)
            .componentTextStyle()
            .bindMenu(this.MuchItemsMenu())
          Text(`设padding的Menu的menuItemDivider | menuItemGroupDivider`)
            .paramTextStyle()
          Text(`ItemMenu_setPadding: set_divider`)
            .componentTextStyle()
            .bindMenu(this.ItemMenu_Padding())
        }
        .columnStyle()
      }
      .width('100%')
    }
    .padding(12)
    .align(Alignment.TopStart)
    .width("100%").height("100%")
  }
}