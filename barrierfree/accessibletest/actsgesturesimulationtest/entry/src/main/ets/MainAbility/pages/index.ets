/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import file from '@system.file'
import prompt from '@system.prompt'
import commonEvent from '@ohos.commonEvent'

const LOG_PREFIX = '[CQH-GESTURE-TARGET-1]'
const EVENT_NAME_BACK = 'on_target_change_extra'
const CommonEventSubscribeInfo = {
  events: ['on_assist_change']
}

@Entry
@Component
struct Index {
  @State message: string = 'GestureSimulationTest'
  private caseCode: string = ''
  private scroller: Scroller = new Scroller()
  private context2D: CanvasRenderingContext2D = new CanvasRenderingContext2D()
  private swiperController: SwiperController = new SwiperController()
  private arr: string[] = ["列表文本1", "列表文本2", "列表文本3", "列表文本4", "列表文本5", "列表文本6", "列表文本7",
  "列表文本8", "列表文本9", "列表文本10", "列表文本11", "列表文本12", "列表文本13", "列表文本14", "列表文本15", "列表文本16",
  "列表文本17", "列表文本18", "列表文本19", "列表文本20", "列表文本21", "列表文本22", "列表文本23", "列表文本24", "列表文本25",
  "列表文本26", "列表文本27", "列表文本28", "列表文本29", "列表文本30"]
  private Number: String[] = ['1', '2', '3']
  private minNum: number = 0
  private maxNum: number = 0
  private addNum: number = 0
  private notEnd: boolean = true
  @State paintSize: number= 5
  @State paintColor: Color = Color.Orange
  @State pathInfoArray: PathInfo[]= new Array()
  private subScriber = undefined

  aboutToAppear() {
    console.info('TargetApp aboutToAppear')
    this.createSubscriber()
  }

  aboutToDisappear() {
    console.info('TargetApp aboutToDisappear')
    commonEvent.unsubscribe(this.subScriber)
    this.subScriber = undefined
  }

  @Builder
  Canvas() {
    ForEach(this.pathInfoArray, (pathInfo) => OnePath({ pathInfo: pathInfo }))
    Stack()
      .width('100%')
      .height('100%')
      .onTouch((event: TouchEvent) => {
        let x = vp2px(event.touches[0].x)
        let y = vp2px(event.touches[0].y)
        switch (event.type) {
          case TouchType.Down:
            this.pathInfoArray.push(new PathInfo(`M${x} ${y}`, this.paintSize, this.paintColor))
            break
          case TouchType.Move:
            this.pathInfoArray[this.pathInfoArray.length-1].commands += `L${x} ${y}`
            break
          case TouchType.Up:
            this.publishEvent()
            setTimeout(()=>{
              this.pathInfoArray.length = 0
            }, 1500)
            break
        }
      })
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      Stack({ alignContent: Alignment.TopEnd }) {
        this.Canvas()
        Row() {
          Button('clear').onClick(() => this.pathInfoArray.length = 0)
        }.margin(5)
      }.height(545).width('100%')

      Button('Test1', {stateEffect: true})
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })
        .width('60%')
        .height(40)
        .gesture(LongPressGesture({ repeat: false })
          .onActionEnd(() => {
            prompt.showToast({ message: '长点击结束' })
            this.publishEvent()
          })
        )
        .onClick((e) => {
          let position = 'screenX:' + vp2px(e.screenX) + ' screenY:' + vp2px(e.screenY) + ' x:' + vp2px(e.x) + ' y:' + vp2px(e.y)
          console.info(LOG_PREFIX + ' button position : ' + position)
          prompt.showToast({ message: position })
          this.publishEvent()
        })

      //滑动
      List({ initialIndex: 12, scroller: this.scroller }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text(item)
              .width('100%')
              .height(25)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
              .onClick((e) => {
                let position = 'screenX:' + vp2px(e.screenX) + ' screenY:' + vp2px(e.screenY) + ' x:' + vp2px(e.x) + ' y:' + vp2px(e.y)
                console.info(LOG_PREFIX + ' list1 position : ' + position)
              })
          }.editable(true)
        }, item => item)
      }
      .listDirection(Axis.Vertical)
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .edgeEffect(EdgeEffect.None)
      .chainAnimation(false)
      .scrollBar(BarState.On)
      .onScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.getMaxMinNum(scrollOffset)
        if (this.notEnd && scrollState == ScrollState.Idle) {
          if (this.minNum < 0 && this.maxNum == 0) {
            prompt.showToast({ message: '向（上）前滑动' })
            this.publishEvent()
          } else if (this.minNum == 0 && this.maxNum > 0) {
            prompt.showToast({ message: '向（下）后滑动' })
            this.publishEvent()
          }
          this.resetNum()
        }
      })
      .editMode(false)
      .margin({ top: 10 })
      .height(140)

      Text(this.message).fontSize(20).fontWeight(FontWeight.Bold).height(20)
    }.height('100%').width('100%')
  }

  getMaxMinNum(scrollOffset: number){
    this.addNum += scrollOffset
    this.minNum = Math.min(this.addNum, this.minNum)
    this.maxNum = Math.max(this.addNum, this.maxNum)
  }

  resetNum(){
    this.addNum = 0
    this.minNum = 0
    this.maxNum = 0
  }

  publishEvent() {
    let commonEventPublishData = {
      data: this.caseCode, parameters: { res: true }
    }
    console.info(LOG_PREFIX + 'publishEvent data : ' + JSON.stringify(commonEventPublishData))
    try {
      commonEvent.publish(EVENT_NAME_BACK, commonEventPublishData, (err, data) => {
        if (err && err.code != 0) {
          console.info(LOG_PREFIX + 'failed to publish because ' + JSON.stringify(err))
          return
        }
        console.info(LOG_PREFIX + 'success data : ' + JSON.stringify(data))
      })
    } catch (e) {
      console.info(LOG_PREFIX + '[publishEvent]  error' + e.message)
    }
  }

  createSubscriber(){
    commonEvent.createSubscriber(CommonEventSubscribeInfo).then((subscriber) => {
      this.subScriber = subscriber
      commonEvent.subscribe(subscriber, (error, commonEventData) => {
        if (error.code != 0) {
          console.info(LOG_PREFIX + 'subscribe failed. Cause:' + JSON.stringify(error))
          return
        }
        console.info(LOG_PREFIX + 'subscribeTest callback : ' + JSON.stringify(commonEventData))
        this.caseCode = commonEventData.data
        if(commonEventData.data === 'GestureSimulation_0090'){
          this.notEnd = false
        }
      })
    }).catch((error) => {
      console.info(LOG_PREFIX + 'createSubscriber failed. Cause: ' + JSON.stringify(error))
      return
    })
  }
}


@Component
struct OnePath {
  @ObjectLink pathInfo: PathInfo

  build() {
    Path()
      .width('100%')
      .height('100%')
      .fillOpacity(0)
      .commands(this.pathInfo.commands)
      .strokeWidth(this.pathInfo.width)
      .stroke(this.pathInfo.color)
  }
}


@Observed
class PathInfo {
  commands: string
  width: number
  color: Color

  constructor(commands: string, width: number, color: Color) {
    this.commands = commands
    this.width = width
    this.color = color
  }
}