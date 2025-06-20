import { memo} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import displaySync from '@ohos.graphics.displaySync'
import hilog from '@ohos.hilog'

@Entry
@Component
struct MyStateSample {
  ds: displaySync.DisplaySync = displaySync.create();
  @State timestamp: Double = 0;
  @State targetTimestamp: Double = 0;
  build() {
    Column(undefined) {
      Text(String(this.timestamp)).id('timestamp');
      Text(String(this.targetTimestamp)).id('targetTimestamp');
      Button('start').backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'Start');
          this.ds.on("frame", (info: displaySync.IntervalInfo) => {
            this.timestamp = info.timestamp;
            this.targetTimestamp = info.targetTimestamp;
          })
          this.ds.start();
        }).id('start')
      Button('stop').backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'Stop');
          this.ds.off("frame")
          this.ds.stop();
        }).id('stop')
    }
  }
}
