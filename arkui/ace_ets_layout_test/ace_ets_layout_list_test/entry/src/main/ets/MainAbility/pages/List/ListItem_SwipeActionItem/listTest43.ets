@Entry
@Component
struct ListItemExample43 {
  @State message: string = 'Hello World'
  @State arr: number[] = [0, 1, 2, 3, 4]
  @State enterEndDeleteAreaString: string = "not enterEndDeleteArea"
  @State exitEndDeleteAreaString: string = "not exitEndDeleteArea"
 @State  swipeActionState:string = '-1'
  @State closeCount: number = 0;
  listScroller: ListScroller = new ListScroller()
  @Builder itemEnd() {
    Row() {
      Button("Delete").margin("4vp")
      Button("Set").margin("4vp")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder itemStart() {
    Row() {
      Button("StartDelete").margin("4vp")
      Button("StartSet").margin("4vp")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }



  build() {
    Column() {
      List({ space: 10 ,scroller: this.listScroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text("item" + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition({ type: TransitionType.Delete, opacity: 0 })
          .swipeAction({
            start : {
              builder: () => { this.itemStart() },
              onAction: () => {
                animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item)
                  this.arr.splice(index, 1)
                })
              },
              actionAreaDistance: 56,
              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = "enterEndDeleteArea"
                this.exitEndDeleteAreaString = "not exitEndDeleteArea"
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = "not enterEndDeleteArea"
                this.exitEndDeleteAreaString = "exitEndDeleteArea"
              },
              onStateChange:(swipeActionState => {
                  this.swipeActionState = swipeActionState.toString();
              })

            }
            ,edgeEffect:SwipeEdgeEffect.Spring

          })

          .key('lSwipe43Action' + item)
        }, (item: string) => item)
      }

      Text(this.swipeActionState).fontSize(20).margin({top:20}).key('swipe43State')
      Text("value is " + this.closeCount).fontSize(20).margin({top:20}).key('swipe43Finish')

      Button("collapseAll").margin("4vp").key('bt43').onClick(()=>{
         this.listScroller.closeAllSwipeActions({onFinish:()=> {
              this.closeCount = this.closeCount + 1;
         }})
      })
      Button("Delete").margin("4vp").key('btreset43').onClick(()=>{
         this.swipeActionState = "-1";
         this.arr = [0, 1, 2, 3, 4];
         this.closeCount = 0
      })

    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}