@ObservedV2
class GridItemInfo {
  @Trace public name: string;
  @Trace public url: string;
  constructor(name: string, url: string) {
    this.name = name;
    this.url = url;
  }

}
let count = 0;
@ComponentV2
struct V2Component {
  @Param @Require name: string;
  @Param @Require url: string;
  @Consumer() newId: number = -1;
  @Param @Require color: Color;
  private myId: number = -1;
  @Monitor('name')
  onNameChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      this.newId = this.myId;
    })
  }
  aboutToAppear(): void {
    this.myId = count++;
    this.newId = this.myId;
  }
  build() {
    Stack() {
      Image($r(this.url))
      Text(this.name)
        .backgroundColor(this.color)
        .border({width: 10})
    }
  }
}
@Entry
@ComponentV2
struct RepeatwithAnimateTo {
  @Local itemList: Array<GridItemInfo> = [];
  @Local rotateAngle: number = 0;
  @Local swipeStartIndex: number = -1;
  @Provider() newId: number = -1;
  @Local flag: boolean = true;
  private imagesUrl: Array<string> = [
    'app.media.img1',
    'app.media.img2',
    'app.media.img3',
    'app.media.img4'
  ]
  private GridScroller: Scroller = new Scroller();
  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.itemList.push(new GridItemInfo('img' + i, this.imagesUrl[0]));
    }
  }
  build() {
    Column({space: 10}) {
      Button('stop rotating')
        .height('5%')
        .margin(50)
        .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
        .onAppear(() => {
          this.getUIContext()?.animateTo({
            duration: 1200,
            curve: Curve.Friction,
            delay: 500,
            iterations: -1,
            playMode: PlayMode.Alternate,
            expectedFrameRateRange: {
              min: 10,
              max: 120,
              expected: 60,
            }
          }, () => {
            this.rotateAngle = 90;
          })
        })
        .onClick(() => {
          this.getUIContext()?.animateTo({ duration: 0 }, () => {
            this.rotateAngle = 0;
          })
        })
      Row() {
        Button('sliding')
          .id('sliding')
          .height('3%')
          .onClick(() => {
            this.GridScroller.fling(-3000)
          })
        Button('change')
          .id('change')
          .height('3%')
          .onClick(() => {
            this.GridScroller.scrollToIndex(5)
            this.itemList[5] = new GridItemInfo('img_change5', this.imagesUrl[1])
            this.itemList[6] = new GridItemInfo('img_change6', this.imagesUrl[1])
            this.itemList[7] = new GridItemInfo('img_change7', this.imagesUrl[1])
          })
        Button('add')
          .id('addButton')
          .height('3%')
          .onClick(() => {
            this.itemList.push(new GridItemInfo('img_newPush1', this.imagesUrl[2]));
            this.itemList.push(new GridItemInfo('img_newPush2', this.imagesUrl[2]));
            this.itemList.push(new GridItemInfo('img_newPush3', this.imagesUrl[2]));
          })
        Button('flag')
          .id('flag')
          .height('3%')
          .onClick(() => {
            this.flag = !this.flag;
          })
        Text(this.newId.toString())
          .id('newId')
          .height('3%')
      }

      Grid(this.GridScroller) {
        Repeat<GridItemInfo>(this.itemList)
          .each(() => {
          }
          )
          .virtualScroll({totalCount: this.itemList.length})
          .templateId((): string =>{
            return 'A';
          })
          .template('A', (obj: RepeatItem<GridItemInfo>) => {
            GridItem() {
              if (this.flag) {
                V2Component({name: obj.item.name, url: obj.item.url, color: Color.White})
                  .height('50%')
                  .margin(10)
              } else {
                V2Component({name: obj.item.name, url: obj.item.url, color: Color.Red})
                  .height('50%')
                  .margin(10)
              }
            }
          }, {cachedCount: 3})
      }
      .onScrollIndex((start: number, end: number) => {
        this.swipeStartIndex = start;
      })
      .columnsTemplate('1fr')
      .cachedCount(0)
      .layoutWeight(1)
    }
  }
}
