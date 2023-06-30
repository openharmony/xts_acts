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
struct textTest {
  aboutToAppear(){
    var abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    var abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  @State overMessage: string = 'This is the setting of textOverflow to Clip text content This is the setting of textO' +
    'verflow to None text content. This is the setting of textOverflow to Clip text content This is the setting of '
  @State message: string = "hello text"
  @State handlePopup: boolean = false

  build() {
    Column() {
      List({ space: 0, initialIndex: 0 }) {
        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0100')
            .height(20)

        }
        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0200')
            .height(20)
            .textShadow({ radius: 1 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0300')
            .height(20)
            .textShadow({ radius: 0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0400')
            .height(20)
            .textShadow({ radius: 20 })

        }
        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0500')
            .height(20)
            .textShadow({ radius: $r("app.float.textShadowRadius") })

        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0600')
            .height(20)
            .textShadow({ radius: -1 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0700')
            .height(20)
            .textShadow({ radius: 1, color: "#0000FF" })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0800')
            .height(20)
            .textShadow({ radius: 1, color: 0xff0000 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_0900')
            .height(20)
            .textShadow({ radius: 1, color: Color.Red })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1000')
            .height(20)
            .textShadow({ radius: 1, color: $r("app.color.textShadow_Color") })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1100')
            .height(20)
            .textShadow({ radius: 1, color: null })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1200')
            .height(20)
            .textShadow({ radius: 1, offsetX: 5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1300')
            .height(20)
            .textShadow({ radius: 1, offsetX: -5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1400')
            .height(20)
            .textShadow({ radius: 1, offsetY: 5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1500')
            .height(20)
            .textShadow({ radius: 1, offsetY: -5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1600')
            .height(20)
            .textShadow({ radius: 1, offsetX: 5.0, offsetY: 5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1700')
            .height(20)
            .textShadow({ radius: 1, offsetX: 5.0, offsetY: -5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1800')
            .height(20)
            .textShadow({ radius: 1, offsetX: -5.0, offsetY: 5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_1900')
            .height(20)
            .textShadow({ radius: 1, offsetX: -5.0, offsetY: -5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_2000')
            .height(20)
            .textShadow({ radius: 1, color: "#0000FF", offsetX: 5.0, offsetY: -5.0 })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_2100')
            .height(20)
            .textShadow(null)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_2200')
            .height(20)
            .textShadow({
              radius: 1, color: Color.Red, offsetX: $r("app.float.textShadowOffset"),
              offsetY: $r("app.float.textShadowOffset")
            })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_2300')
            .height(20)
            .textShadow({ radius: 1, color: Color.Red, offsetX: " ", offsetY: " " })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextShadow_2400')
            .height(20)
            .textShadow({ radius: 1, color: Color.Red, offsetX: 1.0, offsetY: 1.0 })
            .textShadow({ radius: 1, color: null, offsetX: null, offsetY: null })
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_TextOverflow_0100')
            .height(20)
            .maxLines(1)
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_TextOverflow_0200')
            .height(20)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Clip })
        }

        ListItem() {
          Text('a b v c c a ad')
            .key('ArkUX_Stage_Text_TextOverflow_0300')
            .height(20)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Clip })
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_TextOverflow_0400')
            .height(20)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }

        ListItem() {
          Text('gao is a bbb')
            .key('ArkUX_Stage_Text_TextOverflow_0500')
            .height(20)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_TextOverflow_0600')
            .height(20)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.None })
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_TextOverflow_0700')
            .height(20)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Marquee })
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_TextOverflow_0800')
            .height(20)
            .maxLines(1)
            .textOverflow(null)
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_TextOverflow_0900')
            .height(20)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Clip })
            .textAlign(TextAlign.JUSTIFY)
            .fontSize(15)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextAlign_0100')
            .height(20)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextAlign_0200')
            .height(20)
            .textAlign(TextAlign.Start)
            .textOverflow({ overflow: TextOverflow.MARQUEE })
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextAlign_0300')
            .height(20)
            .textAlign(TextAlign.Center)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextAlign_0400')
            .height(20)
            .textAlign(TextAlign.End)
        }
        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextAlign_0500')
            .height(20)
            .textAlign(TextAlign.Justify)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextAlign_0600')
            .height(20)
            .textAlign(null)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_TextAlign_0700')
            .height(20)
            .maxLines(1)
            .textAlign(TextAlign.End)
            .textOverflow({ overflow: TextOverflow.Clip })
        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_heightAdaptivePolicy_0100')
            .height(20)
            .minFontSize(10)
            .maxFontSize(20)
            .maxLines(1)
            .heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST)

        }

        ListItem() {
          Text(this.overMessage)
            .key('ArkUX_Stage_Text_heightAdaptivePolicy_0200')
            .height(20)
            .minFontSize(10)
            .maxFontSize(20)
            .maxLines(1)
            .heightAdaptivePolicy(TextHeightAdaptivePolicy.MAX_LINES_FIRST)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_heightAdaptivePolicy_0300')
            .height(20)
            .minFontSize(10)
            .maxFontSize(20)
            .maxLines(1)
            .heightAdaptivePolicy(TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_heightAdaptivePolicy_0400')
            .height(20)
            .minFontSize(10)
            .maxFontSize(20)
            .maxLines(1)
            .heightAdaptivePolicy(TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST)
            .heightAdaptivePolicy(null)
        }

        ListItem() {
          Text(this.message)
            .key('ArkUX_Stage_Text_heightAdaptivePolicy_0500')
            .height(20)
            .minFontSize(10)
            .maxFontSize(20)
            .maxLines(1)
            .heightAdaptivePolicy(TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST)
            .heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST)
        }

        ListItem() {
          Text(this.message)
            .height(20)
            .bindPopup(this.handlePopup, {
              message: 'This is a popup with PopupOptions',
              placementOnTop: true,
              showInSubWindow: false,
              messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
              targetSpace: 50,
              onStateChange: (e) => {
                console.info(JSON.stringify(e.isVisible))
                if (!e.isVisible) {
                  this.handlePopup = false
                }
              }
            })
        }
      }
    }
  }
}
