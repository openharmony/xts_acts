// xxx.ets
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonItemTuple,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@kit.ArkUI';

@Entry
@Component
struct SegmentButtonTextItem001 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons:
    [{ text: '页签按钮1' },
      { text: '页签按钮2'},
      { text: '页签按钮3'}] as ItemRestriction<SegmentButtonTextItem>,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })

  @State tabSelectedIndexes: number[] = [1]

  build() {
    Row() {
      Column() {
        Column({ space: 25 }) {
          SegmentButton({ options: this.tabOptions,
            selectedIndexes: $tabSelectedIndexes })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}