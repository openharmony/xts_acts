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
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ offsetY: undefined })
              .key("ArkUX_Stage_DataPanel_TrackShadow_1500")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: this.color20 })
              .key("ArkUX_Stage_DataPanel_TrackShadow_1600")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: this.color21 })
              .key("ArkUX_Stage_DataPanel_TrackShadow_1700")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: this.color22 })
              .key("ArkUX_Stage_DataPanel_TrackShadow_1800")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: [$r("app.color.DataPanel_TrackShadow1"), $r("app.color.DataPanel_TrackShadow2"),
                $r("app.color.DataPanel_TrackShadow3")] })
              .key("ArkUX_Stage_DataPanel_TrackShadow_1900")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: '' })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2000")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: null })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2100")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: undefined })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2200")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: [this.color23, this.color24, this.color25] })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2300")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: [this.color26, this.color27, this.color28] })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2400")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: [this.color29, this.color30, this.color31]})
              .key("ArkUX_Stage_DataPanel_TrackShadow_2500")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: [$r("app.color.DataPanel_TrackShadow4"), $r("app.color.DataPanel_TrackShadow5"),
                $r("app.color.DataPanel_TrackShadow6"), $r("app.color.DataPanel_TrackShadow7"),
                $r("app.color.DataPanel_TrackShadow8"), $r("app.color.DataPanel_TrackShadow9")]})
              .key("ArkUX_Stage_DataPanel_TrackShadow_2600")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: '' })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2700")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: null })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2800")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: undefined })
              .key("ArkUX_Stage_DataPanel_TrackShadow_2900")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: this.colorArray1 })
              .key("ArkUX_Stage_DataPanel_TrackShadow_3000")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: this.colorArray2 })
              .key("ArkUX_Stage_DataPanel_TrackShadow_3100")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: this.colorArray3 })
              .key("ArkUX_Stage_DataPanel_TrackShadow_3200")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: [$r("app.color.DataPanel_TrackShadow10"), $r("app.color.DataPanel_TrackShadow11"),
                $r("app.color.DataPanel_TrackShadow12")]})
              .key("ArkUX_Stage_DataPanel_TrackShadow_3300")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: '' })
              .key("ArkUX_Stage_DataPanel_TrackShadow_3400")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: null })
              .key("ArkUX_Stage_DataPanel_TrackShadow_3500")
          }
          ListItem() {
            DataPanel({ values: [20, 10, 10], max: 80, type: DataPanelType.Circle })
              .width(200)
              .height(200)
              .trackShadow({ colors: undefined })
              .key("ArkUX_Stage_DataPanel_TrackShadow_3600")
          }
        }
      }
    .width('100%')
    }
  .height('100%')
}
}
