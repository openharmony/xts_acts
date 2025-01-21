@ReusableV2
@ComponentV2
struct ChildReuseV20030 {
  @Local msg: string = 'ArkUI'

  aboutToReuse(): void {
    this.msg = 'aboutToReuse'
  }

  aboutToRecycle(): void {
    this.msg = 'aboutToRecycle'
  }

  build() {
    Column() {
      Text(this.msg)
        .id('tvChildReuseV20030')
        .width('50%')
        .height('10%')
    }
  }
}

@Entry
@ComponentV2
struct ReuseV20030 {
  @Local flag: boolean = true

  build() {
    Column() {
      Button('Change')
        .id('btnReuseV20030Change')
        .width('50%')
        .height('10%')
        .onClick(() => {
          this.flag = !this.flag
        })
      if (this.flag) {
        ChildReuseV20030()
          .reuse({ reuseId: () => 'childR' })
      }
    }
  }
}