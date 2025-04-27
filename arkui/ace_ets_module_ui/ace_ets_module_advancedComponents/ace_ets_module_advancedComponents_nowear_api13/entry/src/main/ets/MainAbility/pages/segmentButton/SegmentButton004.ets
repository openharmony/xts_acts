// SegmentButtonIconTextItem
// xxx.ets
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonItemTuple,
  SegmentButtonOptions,
  SegmentButtonTextItem,
  SegmentButtonItemOptions
} from '@kit.ArkUI';

@Entry
@Component
struct SegmentButton004 {
  @State iconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonIconTextItem'},
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonIconTextItem'},
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonIconTextItem'},
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonIconTextItem'}
    ] as SegmentButtonItemTuple,
    multiply: true
  })
  @State multiplySelectIconTextCapsuleSelectedIndexes: number[] = [1, 2]

  build() {
    Row() {
      Column() {
        Column({ space: 25 }) {
          SegmentButton({ options: this.iconTextCapsuleOptions,
            selectedIndexes: $multiplySelectIconTextCapsuleSelectedIndexes })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}