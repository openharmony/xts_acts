
@Entry
@Component
struct ListMainChildren1 {
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(20)
  @State listChildrenSize1: ChildrenMainSize = new ChildrenMainSize(10)
  @State message: number = 0
  @State message1: number = 0
  private arr: ArrObject[] = [
    {
      style: ListItemGroupStyle.CARD,
      itemStyles: [ListItemStyle.CARD, ListItemStyle.CARD, ListItemStyle.CARD]
    },
    {
      style: ListItemGroupStyle.CARD,
      itemStyles: [ListItemStyle.CARD, ListItemStyle.CARD, ListItemStyle.NONE]
    },
    {
      style: ListItemGroupStyle.CARD,
      itemStyles: [ListItemStyle.CARD, ListItemStyle.NONE, ListItemStyle.CARD]
    }
  ]
  build() {
    Column() {
      List({ space: "4vp", initialIndex: 0 }) {
        ForEach(this.arr, (item: ArrObject, index?: number) => {
          ListItemGroup({ style: item.style }) {
            ForEach(item.itemStyles, (itemStyle: number, itemIndex?: number) => {
              ListItem({ style: itemStyle }) {
                if (index != undefined && itemIndex != undefined) {
                  Text("第" + (index + 1) + "个Group中第" + (itemIndex + 1) + "个item")
                    .width("100%")
                    .textAlign(TextAlign.Center)
                }
              }
            }, (item: string) => item)
          }
          .childrenMainSize(this.listChildrenSize1)
        })
      }.childrenMainSize(this.listChildrenSize)
      .width('100%')
      .multiSelectable(true)
      .backgroundColor(0xDCDCDC)

      Row() {
        Button('ListChild:' + this.message)
          .id('ListMainChildren_1')
          .onClick(() => {
          this.message = this.listChildrenSize.childDefaultSize
        }).height('50%').width('30%')
        Button('ListItemGroupChild:' + this.message1)
          .id('ListMainChildren_2')
          .onClick(() => {
          this.message1 = this.listChildrenSize1.childDefaultSize
        }).height('50%').width('30%')
      }.height('20%')
    }
    .width('100%')
    .padding({ top: 5 })
  }
}

interface ArrObject {
  style: number;
  itemStyles: number[];
}