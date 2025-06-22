import { memo} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  @State str: string = ""
  message: string = 'var';
  changeValue() {
    this.stateVar+='~'
  }
  private valueChangeCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    this.str = JSON.stringify(eventData?.data?.['ACTION']).replaceAll('"', '');
    console.log('lichenwei: valueChangeCallBack str: ' + this.str)
  }
  aboutToAppear() {
    //  let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    //  let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()
    //  console.info('start run testcase!!!')
    //  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    console.log('lichenwei: aboutToAppear')
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button(this.message).backgroundColor('#FFFF00FF').key('Router')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
          // this.changeValue();
          try {
            this.getUIContext().getRouter().pushUrl({
              url: this.str,
            });
            // router.clear();
            // let pages = router.getState();
            // console.info("get webViewController state success " + JSON.stringify(pages));
            // if (!("webViewController" == pages.name)) {
            // console.info("get webViewController state success " + JSON.stringify(pages.name));
            // router.pushUrl({
            //   url: this.str,
            // });
            // await Utils.sleep(2000);
            // console.info("push webViewController page success " + JSON.stringify(result));
            // }
          } catch (err) {
            console.error("push webViewController page error: " + err);
          }
        })
      Text(this.stateVar).fontSize(20)
      Child({stateVar: this.stateVar} as __Options_Child)
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
