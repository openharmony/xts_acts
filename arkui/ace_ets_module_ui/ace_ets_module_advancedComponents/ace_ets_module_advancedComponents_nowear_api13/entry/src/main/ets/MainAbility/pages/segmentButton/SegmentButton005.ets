//SegmentButtonItemOptions
import {
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonItemOptionsArray,
  SegmentButtonItemTuple,
  SegmentButtonItemOptions
} from '@kit.ArkUI';

@Entry
@Component
struct SegmentButton005 {
  @State singleSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons:
    [new SegmentButtonItemOptions({
      text: 'splice1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
      selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
      accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonItemOptions'
    }),
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonItemOptions'},
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonItemOptions'},
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonItemOptions'}
    ] as SegmentButtonItemTuple,
    multiply: true,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State capsuleSelectedIndexes: number[] = [0]

  build() {
    Row() {
      Column() {
        Column({ space: 10 }) {
          SegmentButton({ options: this.singleSelectCapsuleOptions,
            selectedIndexes: $capsuleSelectedIndexes })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}