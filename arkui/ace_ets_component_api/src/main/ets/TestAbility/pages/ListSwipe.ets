/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import MyUtils from '../common/MyUtils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct ListSwipe {
  private listScroller = new ListScroller();
  @State swipeOffset: string = ''

  @Builder itemStart() {
    Row () {
      Button("Del").margin("4vp")
      Button("Set").margin("4vp")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder itemEnd() {
    Row () {
      Button("Del").margin("4vp")
      Button("Set").margin("4vp")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column({ space: 20 }) {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('ListItem0')
            .width('100%')
            .height(30)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }
        .key('MyList1_ListItem0')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          end: {
            builder: this.itemEnd.bind(this),
            // without onAction, no deleteArea
            onStateChange:(state : SwipeActionState)=> {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList1_ListItem0 swipe action state COLLAPSED')
                MyUtils.sendEvent('end COLLAPSED', 74000)
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList1_ListItem0 swipe action state EXPANDED')
                MyUtils.sendEvent('end EXPANDED', 74000)
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList1_ListItem0 swipe action state ACTIONING')
                MyUtils.sendEvent('end ACTIONING', 74000)
              } else {
                console.info('MyList1_ListItem0 swipe action state UNKOWN')
                MyUtils.sendEvent('end UNKOWN', 74000)
              }
            }
          },
          edgeEffect : SwipeEdgeEffect.Spring,
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              console.info('MyList1_Item0 swipe start')
              MyUtils.sendEvent('swipe start', 70000)
            } else {
              console.info('MyList1_Item0 swipe end')
              MyUtils.sendEvent('swipe end', 70000)
            }
          }
        })

        ListItem() {
          Text('ListItem1')
            .width('100%')
            .height(30)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }
        .key('MyList1_ListItem1')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          end: {
            builder: this.itemEnd.bind(this),
            // without onAction, no deleteArea
          },
          edgeEffect : SwipeEdgeEffect.Spring,
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              console.info('MyList1_Item0 swipe start')
              MyUtils.sendEvent('swipe start', 70000)
            } else {
              console.info('MyList1_Item0 swipe end')
              MyUtils.sendEvent('swipe end', 70000)
            }
          }
        })
      }
      .margin({ top: 5 })
      .listDirection(Axis.Vertical)
      .key('MyList1')
      .width('90%')

      List({ space: 20, initialIndex: 0, scroller: this.listScroller }) {
        ListItem() {
          Text('ListItem0')
          .width('100%')
          .height(30)
          .fontSize(16)
          .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
        }
        .key('MyList2_ListItem0')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          start: {
            builder: this.itemStart.bind(this),
            actionAreaDistance: 5,
            onStateChange:(state : SwipeActionState)=> {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList2_ListItem0 swipe action state COLLAPSED')
                MyUtils.sendEvent('COLLAPSED', 74000)
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList2_ListItem0 swipe action state EXPANDED')
                MyUtils.sendEvent('EXPANDED',  74000)
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList2_ListItem0 swipe action state ACTIONING')
                MyUtils.sendEvent('ACTIONING',  74000)
              } else {
                console.info('MyList2_ListItem0 swipe action state UNKOWN')
                MyUtils.sendEvent('UNKOWN', 74000)
              }
            }
          },
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              MyUtils.sendEvent('swipe start', 70000)
            } else {
              MyUtils.sendEvent('swipe end', 70000)
            }
          },
          edgeEffect:SwipeEdgeEffect.Spring
        })

        ListItem() {
          Text('ListItem1')
          .width('100%').height(30).fontSize(16)
          .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
        }
        .key('MyList2_ListItem1')
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          start: {
            builder: this.itemEnd.bind(this),
            actionAreaDistance: 5,
            // with onAction
            onAction: () => {},
            onStateChange:(state : SwipeActionState)=> {
              if (state == SwipeActionState.COLLAPSED) {
                console.info('MyList2_ListItem1 swipe action state COLLAPSED')
                MyUtils.sendEvent('COLLAPSED', 74000)
              } else if (state == SwipeActionState.EXPANDED) {
                console.info('MyList2_ListItem1 swipe action state EXPANDED')
                MyUtils.sendEvent('EXPANDED', 74000)
              } else if (state == SwipeActionState.ACTIONING) {
                console.info('MyList2_ListItem1 swipe action state ACTIONING')
                MyUtils.sendEvent('ACTIONING', 74000)
              } else {
                console.info('MyList2_ListItem1 swipe action state UNKOWN')
                MyUtils.sendEvent('UNKOWN', 74000)
              }
            }
          },
          onOffsetChange: (offset: number) => {
            if (offset > 0) {
              MyUtils.sendEvent('swipe start', 70000)
            } else {
              MyUtils.sendEvent('swipe left', 70000)
            }
          },
          edgeEffect:SwipeEdgeEffect.Spring
        })
      }
      .divider({ strokeWidth: 2, color: 0xFF, startMargin: 20, endMargin: 20 })
      .margin({ top: 5 })
      .listDirection(Axis.Vertical)
      .key('MyList2')
      .width('90%')

      Button("Collapse All").width("60%").height(80)
      .key("MyList2CloseButton")
      .onClick(() => {
        console.info("onClick closeAllSwipeActions")
        this.listScroller.closeAllSwipeActions({
          onFinish:()=>{
            MyUtils.sendEvent("onFinish", 79000)
          }
        });
      })
    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}
