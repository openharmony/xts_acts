import {
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonItemOptionsArray,
  SegmentButtonItemTuple,
  SegmentButtonItemOptions
} from '@kit.ArkUI';

@Entry
@Component
struct SegmentButtonItemOptionsArray1 {
  @State singleSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '1' }, { text: '2' }, { text: '3' },
      { text: '4' }, { text: '5' }] as SegmentButtonItemTuple,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State capsuleSelectedIndexes: number[] = [0]

  build() {
    Row() {
      Column() {
        Column() {
          SegmentButton({ options: this.singleSelectCapsuleOptions,
            selectedIndexes: $capsuleSelectedIndexes })
          Button("删除第一个按钮")
          .id('SegmentButtonItemOptionsArray101')
            .onClick(() => {
              this.singleSelectCapsuleOptions.buttons.shift()
            })
          Button("删除最后一个按钮")
          .id('SegmentButtonItemOptionsArray102')
            .onClick(() => {
              this.singleSelectCapsuleOptions.buttons.pop()
            })
          Button("末尾增加一个按钮push")
          .id('SegmentButtonItemOptionsArray103')
            .onClick(() => {
              this.singleSelectCapsuleOptions.buttons.push({ text: 'push' })
            })
          Button("开头增加一个按钮unshift")
          .id('SegmentButtonItemOptionsArray104')
            .onClick(() => {
              this.singleSelectCapsuleOptions.buttons.unshift(({ text: 'unshift' }))
            })
          Button("将按钮1、2替换为splice1、splice2")
          .id('SegmentButtonItemOptionsArray105')
            .onClick(() => {
              this.singleSelectCapsuleOptions.buttons.splice(1, 2, new SegmentButtonItemOptions({
                text: 'splice1'
              }), new SegmentButtonItemOptions({ text: 'splice2' }))
            })
          Button("更改所有按钮文字")
          .id('SegmentButtonItemOptionsArray106')
            .onClick(() => {
              this.singleSelectCapsuleOptions.buttons =
                SegmentButtonItemOptionsArray.create([{ text: 'a' }, { text: 'b' },
                  { text: 'c' }, { text: 'd' }, { text: 'e' }])
            })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}