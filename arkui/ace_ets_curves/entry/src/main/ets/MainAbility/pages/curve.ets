// @ts-nocheck
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

import file from '@system.file';
import {Core, ExpectExtend, InstrumentLog, ReportExtend} from "deccjsunit/index.ets"
import testsuite from "../../test/List.test"
import Curves from '@ohos.curves'
import featureAbility from "@ohos.ability.featureAbility"

@Entry
@Component
struct CurveExample {
  @State widthSize: number = 100
  @State heightSize: number = 100
  @State widthSize1: number = 100
  @State heightSize1: number = 100
  @State widthSize2: number = 100
  @State heightSize2: number = 100
  @State widthSize3: number = 100
  @State heightSize3: number = 100


  onPageShow() {
    console.info("LANYI curve start run testcase!!!!")
    featureAbility.getWant()
      .then((Want) => {
        const core = Core.getInstance()
        const expectExtend = new ExpectExtend({
          'id': 'extend'
        })
        core.addService('expect', expectExtend)
        const reportExtend = new ReportExtend(file)

        core.addService('report', reportExtend)
        core.init()
        core.subscribeEvent('task', reportExtend)
        const configService = core.getDefaultService('config')
        const timeout = 10000
        configService.setConfig(timeout)
        console.info('LANYI parameters---->' + JSON.stringify(Want.parameters))

        configService.setConfig(Want.parameters)
        testsuite()
        core.execute()
        console.info('Operation successful. Data: ' + JSON.stringify(Want));
        console.info('Operation successful. Data: ' + JSON.stringify(Want));

      })
      .catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
      })
        var stateChangeEvent = {
         eventId: 8,
         priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }



  build() {
    Column() {
      Text()
        .key('curve')
        .margin({top:100})
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(Color.Red)
        .onClick(()=> {
          let curve = Curves.stepsCurve(9,true);
          this.widthSize = curve.interpolate(0.5) * this.widthSize;
          globalThis.widthSize = this.widthSize;
          this.heightSize = curve.interpolate(0.5) * this.heightSize;
          globalThis.heightSize =  this.heightSize;
          console.info("LANYI"+this.heightSize);
          console.info("LANYI"+globalThis.heightSize);
        }).animation({ duration: 2000, curve: Curve.EaseIn, delay: 500, iterations: 1, playMode: PlayMode.Normal })

      Text()
        .key('curve1')
        .margin({top:100})
        .width(this.widthSize1)
        .height(this.heightSize1)
        .backgroundColor(Color.Red)
        .onClick(()=> {
          let curve = Curves.springCurve(10,1,28,3);
          this.widthSize1 = curve.interpolate(0.5) * this.widthSize1;
          globalThis.widthSize1 = this.widthSize1;
          this.heightSize1 = curve.interpolate(0.5) * this.heightSize1;
          globalThis.heightSize1 =  this.heightSize1;
          console.info("LANYI"+this.heightSize1);
          console.info("LANYI"+globalThis.heightSize1);
        }).animation({ duration: 2000, curve: Curve.EaseIn, delay: 500, iterations: 1, playMode: PlayMode.Normal })

      Text()
        .key('curve2')
        .margin({top:100})
        .width(this.widthSize2)
        .height(this.heightSize2)
        .backgroundColor(Color.Red)
        .onClick(()=> {
          let curve = Curves.initCurve();
          this.widthSize2 = curve.interpolate(0.5) * this.widthSize2;
          globalThis.widthSize2 = this.widthSize2;
          this.heightSize2 = curve.interpolate(0.5) * this.heightSize2;
          globalThis.heightSize2 =  this.heightSize2;
          console.info("LANYI"+this.heightSize2);
          console.info("LANYI"+globalThis.heightSize2);
        }).animation({ duration: 2000, curve: Curve.EaseIn, delay: 500, iterations: 1, playMode: PlayMode.Normal })

      Text()
        .key('curve3')
        .margin({top:100})
        .width(this.widthSize3)
        .height(this.heightSize3)
        .backgroundColor(Color.Red)
        .onClick(()=> {
          let curve = Curves.cubicBezierCurve(0.1,1,0.1,1);
          this.widthSize3 = curve.interpolate(0.5) * this.widthSize3;
          globalThis.widthSize3 = this.widthSize3;
          this.heightSize3 = curve.interpolate(0.5) * this.heightSize3;
          globalThis.heightSize3 =  this.heightSize3;
          console.info("LANYI"+this.heightSize3);
          console.info("LANYI"+globalThis.heightSize3);
        }).animation({ duration: 2000, curve: Curve.EaseIn, delay: 500, iterations: 1, playMode: PlayMode.Normal })

    }.width("100%").height("100%")
  }
}

