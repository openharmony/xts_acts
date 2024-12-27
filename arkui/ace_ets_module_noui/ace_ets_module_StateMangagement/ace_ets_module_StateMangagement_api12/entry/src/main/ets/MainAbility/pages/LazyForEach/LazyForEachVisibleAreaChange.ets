import { BuilderNode, FrameNode, NodeController, UIContext } from '@kit.ArkUI';

class MyDataSource implements IDataSource {
  private dataArray: string[] = []
  private listeners: DataChangeListener[] = []

  pushData(data: string): void {
    this.dataArray.push(data)
  }

  totalCount(): number {
    return this.dataArray.length;
  }

  getData(index: number): string {
    return this.dataArray[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }
}

class MyController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let webviewBuilderNode = new BuilderNode(uiContext)
    webviewBuilderNode.build(wrapBuilder<[Param]>(builderNode), null)
    return webviewBuilderNode.getFrameNode()
  }
}

AppStorage.setOrCreate('visibleAreaChangeCount', 0)

@Builder
function builderNode(param: Param) {
  ANode()
}

@Component
struct ANode {
  @StorageLink('visibleAreaChangeCount') visibleAreaChangeCount: number = 0

  build() {
    Column() {
      Text('啊啊啊啊啊啊啊啊')
    }.height(200)
    .onVisibleAreaChange([0.5], (isVisible: boolean, currentRatio: number) => {
      console.info('Node展示状态:', isVisible, '当前比率:', currentRatio)
      this.visibleAreaChangeCount++
    })
  }
}

class Param {
}

@Entry
@Component
struct LazyForEachVisibleAreaChangeDemo {
  private dataSource: MyDataSource = new MyDataSource()
  private scroller: ListScroller = new ListScroller()
  @StorageLink('visibleAreaChangeCount') visibleAreaChangeCount: number = 0

  aboutToAppear(): void {
    for (let index = 0; index < 30; index++) {
      this.dataSource.pushData(`标题${index}`)
    }
  }

  build() {
    Column() {
      Button('scrollTo (0,800)')
        .id('scroll_to_800')
        .height('10%')
        .onClick(() => {
          this.scroller.scrollTo({ xOffset: 0, yOffset: 800 })
        })

      Button('scrollTo (0,1800)')
        .id('scroll_to_1800')
        .height('10%')
        .onClick(() => {
          this.scroller.scrollTo({ xOffset: 0, yOffset: 1800 })
        })

      Text(this.visibleAreaChangeCount.toString()).id('text_visible_area_change_count')

      List({ scroller: this.scroller }) {
        LazyForEach(this.dataSource, (item: string, idex: number) => {
          ListItem() {
            if (item == '标题11') {
              NodeContainer(new MyController())
            } else {
              Row() {
                Text(item)
                  .height(100)
                  .width('100%')
                  .textAlign(TextAlign.Center)
                  .padding({ top: 30, bottom: 30 })
              }
            }
          }
        },
          (item: string) => item)
      }
      .width('100%')
      .layoutWeight(1)
      .divider({ strokeWidth: 1, color: Color.Gray })
      .scrollBar(BarState.Off)
      .align(Alignment.Center)
    }
  }
}