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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct PinchGestureTemplate {
  @State offsetX: string = 'init'
  @State offsetY: string = 'init'
  @State pinchCenterX: string = 'init'
  @State pinchCenterY: string = 'init'
  @State fingerList_globalX: string = 'init'
  @State fingerList_globalY: string = 'init'
  @State fingerList_localX: string = 'init'
  @State fingerList_localY: string = 'init'
  @State fingerList1_globalX: string = 'init'
  @State fingerList1_globalY: string = 'init'
  @State fingerList1_localX: string = 'init'
  @State fingerList1_localY: string = 'init'
  @State target_area_width: string = 'init'
  @State target_area_height: string = 'init'
  @State target_area_position_x: string = 'init'
  @State target_area_position_y: string = 'init'
  @State target_area_globalPosition_x: string = 'init'
  @State target_area_globalPosition_y: string = 'init'
  @State time: number = 0
  @State timestamp: number = 0

  @State scaleValue: number = 1
  @State pinchValue: number = 1
  @State pinchX: number = 0
  @State pinchY: number = 0

  @State template_arr: number[] = []
  @State template_flag: boolean = false
  build() {
    Column({space:10}) {
      Column() {
        Text('PinchGesture').fontSize(20)
      }
      .scale({ x: this.scaleValue, y: this.scaleValue, z: 1 })
      .width(240).height(160)
      .backgroundColor(Color.Yellow).key('PinchGestureTemplate_Click')
      .gesture(
        PinchGesture({ fingers: 2 })
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.scaleValue = this.pinchValue * event.scale
              this.pinchX = event.pinchCenterX
              this.pinchY = event.pinchCenterY

              this.template_arr.push(event.timestamp)
              this.time = Date.now()
              this.timestamp = event.timestamp
              this.offsetX = event.offsetX + ''
              this.offsetY = event.offsetY + ''
              this.pinchCenterX = event.pinchCenterX + ''
              this.pinchCenterY = event.pinchCenterY + ''
              // 测试fingerList
              // 第一根手指的
              if (event.fingerList[0] && event.fingerList[0] !== undefined) {
                this.fingerList_globalX = event.fingerList[0].globalX + ''
                this.fingerList_globalY = event.fingerList[0].globalY + ''
                this.fingerList_localX = event.fingerList[0].localX + ''
                this.fingerList_localY = event.fingerList[0].localY + ''
              }
              if (event.fingerList[1] && event.fingerList[1] !== undefined) {
                // 第二根手指的
                this.fingerList1_globalX = event.fingerList[1].globalX + ''
                this.fingerList1_globalY = event.fingerList[1].globalY + ''
                this.fingerList1_localX = event.fingerList[1].localX + ''
                this.fingerList1_localY = event.fingerList[1].localY + ''
              }
              this.target_area_position_x = event.target.area.position.x + ''
              this.target_area_position_y = event.target.area.position.y + ''
              this.target_area_globalPosition_x = event.target.area.globalPosition.x + ''
              this.target_area_globalPosition_y = event.target.area.globalPosition.y + ''
            }
          })
      )

      Button('template').id('PinchGestureTemplate_template')
        .onClick(()=>{
          if(this.template_arr.length > 2) {
            let mid: number = Math.ceil(this.template_arr.length / 2)
            let x: number = Math.abs(this.template_arr[1] - this.template_arr[0])
            let y: number = Math.abs(this.template_arr[this.template_arr.length - mid + 1] - this.template_arr[this.template_arr.length - mid])
            let z: number = Math.abs(this.template_arr[this.template_arr.length - 1] - this.template_arr[this.template_arr.length - 2])

            if(x <= 16 && y <= 16 && z <= 16) {
              this.template_flag = true
            }

          }
        })
      Text(`templateFlag:${this.template_flag}`).key('PinchGestureTemplate_Text')

    }.padding({top: 10, left:40 }).alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba')
  }
}