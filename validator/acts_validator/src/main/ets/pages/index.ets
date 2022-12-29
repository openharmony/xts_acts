import prompt from '@ohos.prompt';
import router from '@ohos.router';
import fileio from '@ohos.fileio';
import xml from '@ohos.xml';
import fileIO from '@ohos.fileio';
import util from '@ohos.util';

const TAG = 'ParseXML';
let path=globalThis.dir;
let path1;
let path2;
console.info("ssssssssss"+path);
path1 = path + '/report1';
console.info("ssssssssss"+path1);
path2 = path + '/report2';
console.info("ssssssssss"+path2);
fileio.rmdirSync(path);
fileio.mkdirSync(path);
fileio.mkdirSync(path1);
fileio.mkdirSync(path2);

@Entry
@Component
struct IndexPage {
  private TestCaseList = [
    {title:'ArkUI',MainTitle:false,uri:'pages/ArkUI/ArkUI_index',bgc:'#ff808080'},
    {title:'MediaLibrary',MainTitle:false,uri:'pages/MediaLibrary/MediaLibrary_index',bgc:'#ff808080'},
  ]
  build(){
    Column(){
      Row() {
        Text('ActValidator')
          .fontColor(Color.White)
          .fontSize('22fp')
        Row() {
          Button(){
            Image($r('app.media.ic_public_delete'))
              .width('30vp')
              .height('30vp')
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.ClearText();
            prompt.showToast({
              message: '所有结果已删除', duration: 1000
            })
          })
          Button(){
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.SaveXml();
            prompt.showToast({
              message: '总报告已生成', duration: 1000
            })
          })
        }
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({top:'15vp'}).height('6%')
      List({space:5}){
        ForEach(this.TestCaseList,(item,index) => {
          ListItem(){
            Row(){
              Text(item.title).fontSize(16).fontColor(Color.Black)
            }.width('100%').height(50).alignItems(VerticalAlign.Center).backgroundColor(Color.Grey)
            .onClick(()=>{
              router.push({
                url: item.uri,
              })
            })
          }
        },item  => item.title)
      }.width('100%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  ClearText(){
    fileio.rmdirSync(path);
    fileio.mkdirSync(path);
    fileio.mkdirSync(path1);
    fileio.mkdirSync(path2);
  }
  SaveXml() {
    let path11 = path1 + '/report1.txt';
    let path22 = path2 + '/report2.txt';
    let OP1 = fileio.openSync(path11, 0o100 | 0o2002, 0o664);
    let buf1 = new ArrayBuffer(40960);
    fileio.readSync(OP1,buf1);
    let report1;

    function ab2str1(buf1) {
      return report1 = String.fromCharCode.apply(null, new Uint8Array(buf1));
    }
    ab2str1(buf1);
    let str1 = report1.split(";");
    let title1 = [];
    let result1 = [];
    for (let i = 0; i < Math.floor(str1.length / 2); i++) {
      title1[i] = str1[i*2];
      result1[i] = str1[i * 2+1];
    }

    let OP2 = fileio.openSync(path22, 0o100 | 0o2002, 0o664);
    let buf2 = new ArrayBuffer(40960);
    fileio.readSync(OP2,buf2);
    function ab2str2(buf2) {
      return report1 = String.fromCharCode.apply(null, new Uint8Array(buf2));
    }
    ab2str2(buf2);
    let str2 = report1.split(";");
    let title2 = [];
    let result2 = [];
    for (let i = 0; i < Math.floor(str2.length / 2); i++) {
      title2[i] = str2[i*2];
      result2[i] = str2[i * 2+1];
    }

    let arrayBuffer = new ArrayBuffer(40960);
    let bufView = new DataView(arrayBuffer);
    let serializer = new xml.XmlSerializer(bufView);
    serializer.setDeclaration();
    serializer.startElement("testsuites");
    serializer.setAttributes("name", "ActValidator");
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsArkUITest");
    for (let i = 0; i < title1.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title1[i]));
      serializer.setAttributes("result", String(result1[i]));
      serializer.endElement();
    }
    serializer.endElement();

    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsMediaTest");
    for (let i = 0; i < title2.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title2[i]));
      serializer.setAttributes("result", String(result2[i]));
      serializer.endElement();
    }
    serializer.endElement();
    serializer.endElement();

    let that = new util.TextDecoder('utf-8');
    let array = new Uint8Array(arrayBuffer);
    let serializerStr = that.decode(array);
    let xmlPath = path + "/Test.xml";
    console.info(xmlPath);
    try {
      console.error(TAG, "write xmlPath =" + xmlPath);
      var xmlfd = fileIO.openSync(xmlPath, 0o102, 0o666);
      fileIO.writeSync(xmlfd, serializerStr);
    } catch (err) {
      console.error(TAG, "read xmlPath =" + xmlPath + "error:" + err);
    } finally {
      fileIO.closeSync(xmlfd);
    }
  }
}
