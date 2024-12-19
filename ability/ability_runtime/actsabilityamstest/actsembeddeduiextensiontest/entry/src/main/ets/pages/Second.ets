
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

@Entry
@Component
struct First {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Entry second aboutToAppear');

  }
  @State message:string = 'ni'
  private want: Want = {
    bundleName: 'com.example.act_embeddeduiextension',
    abilityName: 'EntryEmbeddedUIExtAbility3',
    parameters: {
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info: TerminationInfo) => {
            this.message = 'Terminarion: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
            console.log('1111',this.message)
          })
          .onError((error: BusinessError) => {
            this.message = 'Error: code = ' + error.code;
            console.log('EmbeddedAbility3',JSON.stringify(error))

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}