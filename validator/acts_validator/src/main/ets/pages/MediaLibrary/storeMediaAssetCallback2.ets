import fileio from '@ohos.fileio';
import featureAbility from '@ohos.ability.featureAbility';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {CustomContainer} from '../common/MediaCustomContainer';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  @State FillColor: string = '#FF000000';
  @State name: string = 'storeMediaAssetCallback2';
  @State StepTips: string = '操作步骤:点击“点击保存”按钮'+'\n'+'预期结果：成功保存音频，资源内容为“hello world”';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam(){
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text('点击保存').margin('2%').backgroundColor('#FFDDDDF8').fontSize(20).border({ width: 1 }).size({ width: '70%', height: '20%' })
            .onClick(async () => {
              let TAG = 'storeMediaAssetCallback2';
              let context0 = featureAbility.getContext();
              let data = await context0.getFilesDir();
              let time = new Date().getTime();
              console.log("data is"+ JSON.stringify(data));
              data = 'data/storage/el2/base/haps/entry';
              let PathMp3 = data + "/files/"+time + ".mp3";

              let srcFd =await fileio.open(PathMp3,0o102,0o0600);
              await fileio.write(srcFd,"hello world");
              await fileio.close(srcFd);

              let option = {
                src : PathMp3,
                mimeType : "audio/mp3",
                relativePath : "Audios/"
              };
              mediaLibrary.getMediaLibrary().storeMediaAsset(option, (err, value) => {
                if (err) {
                  console.log(TAG + "An error occurred when storing audios resources."+ JSON.stringify(err));
                  return;
                }
                AlertDialog.show(
                  {
                    title: '保存成功',
                    message: '查询到Audios路径下新增一个.mp3格式的音频资源，资源内容为“hello world”',
                    confirm: {
                      value: 'OK',
                      action: () => {
                        console.info(TAG + 'Button-clicking callback')
                      }
                    },
                    cancel: () => {
                      console.info(TAG + 'Closed callbacks')
                    }
                  }
                )
                console.log(TAG + "audios resources stored. "+ JSON.stringify(value));
              });
            })
      }
    }.width('100%').height('80%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/MediaLibrary/MediaLibrary_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        FillColor:$FillColor,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}