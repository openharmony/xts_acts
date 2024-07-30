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
  @State expandedRegionLayoutOptions: ExpandedRegionLayoutOptions = {
    horizontalSplitRatio: PresetSplitRatio.LAYOUT_3V2,
    verticalSplitRatio: PresetSplitRatio.LAYOUT_1V1,
    isExtraRegionPerpendicular: true,
    extraRegionPosition: ExtraRegionPosition.TOP
  };
  @State mText2: string = 'init'
  @State horizontalSplitRatioText: string = 'horizontalSplitRatioText'
  @State verticalSplitRatioText: string = 'verticalSplitRatioText'
  build() {
    Row() {
      Column() {
        Column({ space: 12 }) {
          Text(this.mText2).id('postDelayedFrameCallback')
          Text(this.horizontalSplitRatioText).id('horizontalSplitRatio')
          Text(this.verticalSplitRatioText).id('verticalSplitRatio')
        }.margin(30)
        Button('点击触发postDelayedFrameCallback')
          .onClick(() => {
            // this.getUIContext().postDelayedFrameCallback(new MyFrameCallback("delayTask"), 5);
            this.mText2 = 'postDelayedFrameCallback'
            this.horizontalSplitRatioText = 'horizontalSplitRatio'
            this.verticalSplitRatioText = 'verticalSplitRatio'
          }).id('btn2')
      }.width('100%')
    }.height('100%')
  }
}