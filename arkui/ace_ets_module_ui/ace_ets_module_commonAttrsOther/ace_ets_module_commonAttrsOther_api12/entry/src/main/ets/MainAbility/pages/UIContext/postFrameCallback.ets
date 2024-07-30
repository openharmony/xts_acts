import {
  PresetSplitRatio,
  ExtraRegionPosition,
  ExpandedRegionLayoutOptions,
} from '@ohos.arkui.advanced.FoldSplitContainer';
class MyFrameCallback {
  private tag: string;

  constructor(tag: string) {
    this.tag = tag;
  }

  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
  }
}

@Entry
@Component
struct Index {
  @State status: boolean = true
  @State expandedRegionLayoutOptions: ExpandedRegionLayoutOptions = {
    horizontalSplitRatio: PresetSplitRatio.LAYOUT_3V2,
    verticalSplitRatio: PresetSplitRatio.LAYOUT_1V1,
    isExtraRegionPerpendicular: this.status,
    extraRegionPosition: ExtraRegionPosition.TOP
  };
  @State mText1: string = 'init'
  build() {
    Row() {
      Column() {
        Column({ space: 12 }) {
          Text(this.mText1).id('postFrameCallback')
          Text(this.status + '').id('isExtraRegionPerpendicular')
        }.margin(30)
        Button('点击触发postFrameCallback')
          .onClick(() => {
            // this.getUIContext().postFrameCallback(new MyFrameCallback("normTask"));
            this.mText1 = 'postFrameCallback'
            this.status = false
          }).id('btn1')
      }.width('100%')
    }.height('100%')
  }
}