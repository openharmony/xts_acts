@ObservedV2
class RepeatreufalseClazz {
  @Trace message: string = '';

  constructor(message: string) {
    this.message = message;
  }
}

@Entry
@ComponentV2
struct RepeatVirtualScroll {
  @Local simpleList: Array<RepeatreufalseClazz> = [];
  @Local selectOptions: SelectOption[] = [];
  @Local selectIdx: number = 0;
  private scroller: Scroller = new Scroller()

  @Monitor("simpleList")
  reloadSelectOptions(): void {
    this.selectOptions = [];
    for (let i = 0; i < this.simpleList.length; ++i) {
      this.selectOptions.push({ value: i.toString() });
    }
    if (this.selectIdx >= this.simpleList.length) {
      this.selectIdx = this.simpleList.length - 1;
    }
  }

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.simpleList.push(new RepeatreufalseClazz(`item_${i}`));
    }
    this.reloadSelectOptions();
  }

  build() {
    Column({ space: 10 }) {
      Button('Click to last')
        .id('reusablefalse')
        .height('5%')
        .onClick(() => {
          this.scroller.scrollToIndex(this.simpleList.length - 1); // Slide to the specified index
        })
      List({ space: 10,scroller: this.scroller  }) {
        Repeat<RepeatreufalseClazz>(this.simpleList)
          .each((obj: RepeatItem<RepeatreufalseClazz>) => {
            ListItem() {
              Text(`[each] index${obj.index}: ${obj.item.message}`)
                .fontSize(25)
            }
          })
          .key((item: RepeatreufalseClazz, index: number) => {
            return item.message;
          })

          // .virtualScroll({reusable: false })
          .templateId(() => "a")
          .template('a', (ri) => {
            Text(`[a] index${ri.index}: ${ri.item.message}`)
              .fontSize(25)
          }, { cachedCount: 3 })
      }
      .cachedCount(2)
      .border({ width: 1 })
      .width('95%')
      .height('40%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}