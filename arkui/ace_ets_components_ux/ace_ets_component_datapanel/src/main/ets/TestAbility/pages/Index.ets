/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 //@ts-nocheck
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'
@Entry
@Component
struct DatapanelTest {

  aboutToAppear(){
    var abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    var abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  public color1: Color[] = ["#FFFF0000", "#FF00FF00", "#FF0000FF", "#FF000000"];
  public color2: Color[] = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(0,0,0)']
  public color3: Color[] = [Color.Red, Color.Green, Color.Blue, Color.Black]
  public color4: Color[] = ["#FFFF0000", "#FF00FF00", "#FF0000FF", "#FF000000"]
  public color5: Color[] = ["#FF000000", "#FFFF0000", "#FF00FF00"]
  public color6: LinearGradient = new LinearGradient([{ color: "#FFA500", offset: 0 }, {
    color: "#FFFFFF00", offset: 1 }])
  public color7: LinearGradient = new LinearGradient([{ color: "#FFC0CB", offset: 0 }, {
    color: "#FF00FF00", offset: 1 }])
  public color8: LinearGradient = new LinearGradient([{ color: "#FF0000FF", offset: 0 }, {
    color: "#FFFF0000", offset: 1 }])
  public color9: LinearGradient = new LinearGradient([{ color: 'rgb(255,165,0)', offset: 0 }, {
    color: 'rgb(255,255,0)', offset: 1 }])
  public color10: LinearGradient = new LinearGradient([{ color: 'rgb(255,192,203)', offset: 0 }, {
    color: 'rgb(0,128,0)', offset: 1 }])
  public color11: LinearGradient = new LinearGradient([{ color: 'rgb(0,0,255)', offset: 0 }, {
    color: 'rgb(255,0,0)', offset: 1 }])
  public color12: LinearGradient = new LinearGradient([{ color: Color.Orange, offset: 0 }, {
    color: Color.Yellow, offset: 1 }])
  public color13: LinearGradient = new LinearGradient([{ color: Color.Pink, offset: 0 }, {
    color: Color.Green, offset: 1 }])
  public color14: LinearGradient = new LinearGradient([{ color: Color.Blue, offset: 0 }, {
    color: Color.Red, offset: 1 }])
  public color15: Color[] = ["#01FFA500", "#4CFFFF00", "#9AFFC0CB", "#FF00FF00"]
  public color16: Color[] = ['rgba(255,165,0,0)', 'rgba(255,255,0,0)', 'rgba(255,192,203,0)', 'rgba(0,128,0,0)']
  public color17: Color[] = [Color.Orange, Color.Yellow, Color.Pink, Color.Green]
  public color18: Color[] = ["#01FFA500", "#4C800080", "#9AFFFF00", "#FF00FF00"]
  public color19: LinearGradient = new LinearGradient([{ color: "#01FFA500", offset: 0 }, {
    color: "#01FFFF00", offset: 1 }])
  public color39: LinearGradient = new LinearGradient([{ color: "#01FFC0CB", offset: 0 }, {
    color: "#0100FF00", offset: 1 }])
  public color20: Color[] = ["#FFFF0000", "#FFFFFF00", "#FF00FF00"]
  public color21: Color[] = ['rgb(255,0,0)', 'rgb(255,255,0)', 'rgb(0,255,0)']
  public color22: Color[] = [Color.Red, Color.Yellow, Color.Green]
  public color23: LinearGradient = new LinearGradient([{ color: "#FFA500", offset: 0 }, {
    color: "#FFFFFF00", offset: 1 }])
  public color24: LinearGradient = new LinearGradient([{ color: "#FFC0CB", offset: 0 }, {
    color: "#FF00FF00", offset: 1 }])
  public color25: LinearGradient = new LinearGradient([{ color: "#FF0000FF", offset: 0 }, {
    color: "#FFFF0000", offset: 1 }])
  public color26: LinearGradient = new LinearGradient([{ color: 'rgb(255,165,0)', offset: 0 }, {
    color: 'rgb(255,255,0)', offset: 1 }])
  public color27: LinearGradient = new LinearGradient([{ color: 'rgb(255,192,203)', offset: 0 }, {
    color: 'rgb(0,128,0)', offset: 1 }])
  public color28: LinearGradient = new LinearGradient([{ color: 'rgb(0,0,255)', offset: 0 }, {
    color: 'rgb(255,0,0)', offset: 1 }])
  public color29: LinearGradient = new LinearGradient([{ color: Color.Orange, offset: 0 }, {
    color: Color.Yellow, offset: 1 }])
  public color30: LinearGradient = new LinearGradient([{ color: Color.Pink, offset: 0 }, {
    color: Color.Green, offset: 1 }])
  public color31: LinearGradient = new LinearGradient([{ color: Color.Blue, offset: 0 }, {
    color: Color.Red, offset: 1 }])
  public color32: Color = "#FF0000FF"
  public color33: LinearGradient = new LinearGradient([{ color: "#FFA500", offset: 0 }, {
    color: "#FFC0CB", offset: 1 }])
  public color34: Color = 'rgb(255,0,0)'
  public color35: LinearGradient = new LinearGradient([{ color: 'rgb(255,165,0)', offset: 0 }, {
    color: 'rgb(255,192,203)', offset: 1 }])
  public color36: Color = Color.Red
  public color37: LinearGradient = new LinearGradient([{ color: Color.Orange, offset: 0 }, {
    color: Color.Pink, offset: 1 }])
  public colorArray1: Array<LinearGradient | ResourceColor> = [ "#FF0000FF", this.color33 ]
  public colorArray2: Array<LinearGradient | ResourceColor> = [ 'rgb(255,0,0)', this.color35 ]
  public colorArray3: Array<LinearGradient | ResourceColor> = [ Color.Red, this.color35 ]
  public colorArray4: Array<LinearGradient | ResourceColor> = [ $r("app.color.DataPanel_TrackBackgroundColor")]

  build() {
    Row() {
      Column() {
        List({ space: 0, initialIndex: 0 }) {
          ListItem() {
            DataPanel({ values: [20, 10, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color1)
              .key("ArkUX_Stage_DataPanel_ValueColors_0100")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color2)
              .key("ArkUX_Stage_DataPanel_ValueColors_0200")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color3)
              .key("ArkUX_Stage_DataPanel_ValueColors_0300")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([$r("app.color.DataPanel_ValueColors1"), $r("app.color.DataPanel_ValueColors2"),
                $r("app.color.DataPanel_ValueColors3"), $r("app.color.DataPanel_ValueColors4")])
              .key("ArkUX_Stage_DataPanel_ValueColors_0400")
          }
          ListItem() {
            DataPanel({ values: [10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color4)
              .key("ArkUX_Stage_DataPanel_ValueColors_0500")
          }
          ListItem() {
            DataPanel({ values: [10, 10, 10, 10, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color5)
              .key("ArkUX_Stage_DataPanel_ValueColors_0600")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(0,0,0)'])
              .valueColors([Color.Red, Color.Green, Color.Blue, Color.Black])
              .key("ArkUX_Stage_DataPanel_ValueColors_0700")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(["#FFFF0000", "#FF00FF00", "#FF0000FF", "#FF000000"])
              .backgroundColor(Color.Pink)
              .width(80)
              .padding(10)
              .margin(20)
              .key("ArkUX_Stage_DataPanel_ValueColors_0800")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors('rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(0,0,0)')
              .valueColors(undefined)
              .key("ArkUX_Stage_DataPanel_ValueColors_0900")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([this.color6, this.color7, this.color8])
              .key("ArkUX_Stage_DataPanel_ValueColors_1000")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([this.color9, this.color10, this.color11])
              .key("ArkUX_Stage_DataPanel_ValueColors_1100")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([this.color12, this.color13, this.color14])
              .key("ArkUX_Stage_DataPanel_ValueColors_1200")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([$r("app.color.DataPanel_ValueColors5"), $r("app.color.DataPanel_ValueColors6"),
                $r("app.color.DataPanel_ValueColors7"), $r("app.color.DataPanel_ValueColors8"),
                $r("app.color.DataPanel_ValueColors9"), $r("app.color.DataPanel_ValueColors10")])
              .key("ArkUX_Stage_DataPanel_ValueColors_1300")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([this.color26, this.color27, this.color28])
              .valueColors([this.color29, this.color30, this.color31])
              .key("ArkUX_Stage_DataPanel_ValueColors_1400")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([this.color23, this.color24, this.color25])
              .backgroundColor(Color.Green)
              .padding(10)
              .margin(20)
              .key("ArkUX_Stage_DataPanel_ValueColors_1500")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(([{ color: 'rgb(255,165,0)', offset: 0 }, { color: 'rgb(255,255,0)', offset: 1 }],
                [{ color: 'rgb(255,192,203)', offset: 0 }, { color: 'rgb(0,128,0)', offset: 1 }],
                [{ color: 'rgb(0,0,255)', offset: 0 },{ color: 'rgb(255,0,0)', offset: 1 }]))
              .valueColors(undefined)
              .key("ArkUX_Stage_DataPanel_ValueColors_1600")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color15)
              .key("ArkUX_Stage_DataPanel_ValueColors_1700")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color16)
              .key("ArkUX_Stage_DataPanel_ValueColors_1800")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(this.color17)
              .key("ArkUX_Stage_DataPanel_ValueColors_1900")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors([$r("app.color.DataPanel_ValueColors11"), $r("app.color.DataPanel_ValueColors12"),
                $r("app.color.DataPanel_ValueColors13"), $r("app.color.DataPanel_ValueColors14")])
              .key("ArkUX_Stage_DataPanel_ValueColors_2000")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(['rgba(255,165,0,0)', 'rgba(255,255,0,0)', 'rgba(255,192,203,0)', 'rgba(0,128,0,0)'])
              .valueColors([Color.Orange, Color.Yellow, Color.Pink, Color.Green])
              .key("ArkUX_Stage_DataPanel_ValueColors_2100")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(["#01FFA500", "#4CFFFF00", "#9AFFC0CB", "#FF00FF00"])
              .backgroundColor(Color.Green)
              .padding(10)
              .margin(20)
              .key("ArkUX_Stage_DataPanel_ValueColors_2200")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors('')
              .key("ArkUX_Stage_DataPanel_ValueColors_2300")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .valueColors(null)
              .key("ArkUX_Stage_DataPanel_ValueColors_2400")
          }
        }
      }
    .width('100%')
    }
  .height('100%')
}
}
