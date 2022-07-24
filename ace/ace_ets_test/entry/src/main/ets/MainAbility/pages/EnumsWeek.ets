/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
struct EnumsWeek {
  @State weekTime:Week = 0
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {

      Text(''+Week.Mon).width(100).height(60).fontSize(20).key('TextMon')
      Text(''+Week.Thur).width(100).height(60).fontSize(20).key('TextThur')
      Text(''+Week.Fri).width(100).height(60).fontSize(20).key('TextFri')
      Text(''+Week.Sat).width(100).height(60).fontSize(20).key('TextSat')

      Text(''+Edge.Middle).width(100).height(60).fontSize(20).key('TextMiddle')

      Text(''+HoverEffect.Auto).width(100).height(60).fontSize(20).key('TextAuto')
      Text(''+HoverEffect.None).width(100).height(60).fontSize(20).key('TextNone')
      Text(''+HoverEffect.Highlight).width(100).height(60).fontSize(20).key('TextHighlight')
      Text(''+HoverEffect.Scale).width(100).height(60).fontSize(20).key('TextScale')


    }.height(400).padding({ left: 35, right: 35, top: 35 })
  }
}