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
struct SegmentButton003 {
  @State iconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'},
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'},
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'},
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'}
    ] as SegmentButtonItemTuple,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State singleSelectIconCapsuleSelectedIndexes: number[] = [3]

  build() {
    Row() {
      Column() {
        Column({ space: 25 }) {
          SegmentButton({ options: this.iconCapsuleOptions,
            selectedIndexes: $singleSelectIconCapsuleSelectedIndexes })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}