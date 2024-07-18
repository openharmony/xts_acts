/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT Wtemplate_arrANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct PanGestureExampleTemplate {
  @State pinchCenterX: string = 'init'
  @State pinchCenterY: string = 'init'
  @State fingerList_globalX: string = 'init'
  @State fingerList_globalY: string = 'init'
  @State fingerList_localX: string = 'init'
  @State fingerList_localY: string = 'init'
  @State target_area_position_x: string = 'init'
  @State target_area_position_y: string = 'init'
  @State target_area_globalPosition_x: string = 'init'
  @State target_area_globalPosition_y: string = 'init'
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State time: number = 0
  @State timestamp: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right | PanDirection.All | PanDirection.Horizontal | PanDirection.Vertical})
  @State template_arr: number[] = []
  @State template_flag: boolean = false
  @State startTime: number = 0
  @State endTime: number = 0
  @State cnt: number = 0
  @State inputTemplate_arr: number[] = []

  build() {
    Column({space:10}) {
      Text('PanGesture').fontSize(20).width(240).height(80).margin({left:0,top:0}).padding({left:0,top:0}).backgroundColor(Color.Yellow).key('PanGestureExampleTemplate_Click')
        .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
        .onTouch((event:TouchEvent)=>{
          let arr = event?.getHistoricalPoints()
          for (let i = 0; i < arr?.length; i++) {
            this.inputTemplate_arr.push(arr[i].timestamp);
          }
          if (event.type == TouchType.Down && this.startTime == 0) {
            this.startTime = Date.now();
          }
          if (event.type == TouchType.Up && this.endTime == 0) {
            this.endTime = Date.now();
          }
          this.cnt += event.getHistoricalPoints().length
        })
        .gesture(
          PanGesture(this.panOption)
            .onActionUpdate((event: GestureEvent) => {
              if (event) {
                this.template_arr.push(event.timestamp)
                this.time = Date.now()
                this.timestamp = event.timestamp
                this.offsetX = event.offsetX
                this.offsetY = event.offsetY
                this.pinchCenterX = event.pinchCenterX + ''
                this.pinchCenterY = event.pinchCenterY + ''
                this.fingerList_globalX = event.fingerList[0].globalX + ''
                this.fingerList_globalY = event.fingerList[0].globalY + ''
                this.fingerList_localX = event.fingerList[0].localX + ''
                this.fingerList_localY = event.fingerList[0].localY + ''
                this.target_area_position_x = event.target.area.position.x + ''
                this.target_area_position_y = event.target.area.position.y + ''
                this.target_area_globalPosition_x = event.target.area.globalPosition.x + ''
                this.target_area_globalPosition_y = event.target.area.globalPosition.y + ''
              }
            })
        )

      Button('template').id('PanGestureExampleTemplate_template')
        .onClick(()=>{
          if(this.template_arr.length > 3) {
            let timeLimit = (this.endTime - this.startTime) / this.cnt * 1000000 * 2;
            let mid: number = Math.ceil(this.template_arr.length / 2)
            let x: number = Math.abs(this.template_arr[1] - this.template_arr[0])
            let y: number = Math.abs(this.template_arr[this.template_arr.length - mid + 1] - this.template_arr[this.template_arr.length - mid])
            let z: number = Math.abs(this.template_arr[this.template_arr.length - 2] - this.template_arr[this.template_arr.length - 3])
            console.log("PanGestureExampleTemplate_template : x " + x + ", y " + y + ", z " + z + ", timeLimit " + timeLimit);
            if(x <= timeLimit && y <= timeLimit && z <= timeLimit) {
              this.template_flag = true
            } else {
              let a = -1
              for (let i = 1; i < this.inputTemplate_arr.length; i++) {
                let datax = this.inputTemplate_arr[i] - this.inputTemplate_arr[i-1]
                if (datax > a) {
                  a = datax
                }
              }
              console.log('PanGestureExampleTemplate_template datax', a)
            }

          }
        })
      Text(`templateFlag:${this.template_flag}`).key('PanGestureExampleTemplate_Text')

    }.alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba')
  }
}