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
import prompt from '@ohos.prompt';
import router from '@ohos.router';
import fileio from '@ohos.fileio';
import xml from '@ohos.xml';
import fileIO from '@ohos.fileio';
import util from '@ohos.util';

const TAG = 'ParseXML';
let path = globalThis.dir;
let path1;
path1 = path + '/report1';



@Entry
@Component
struct IndexPage {
  @State BackColor: string = '#ff808080'
  @State ClearAll : boolean = false
  private current : number = undefined
  @State count : number = 0
  @State result : string = ''
  private TestCaseList = [
    {title:'Scroll List',uri:'pages/ArkUI/ScrollListTest'},
    {title:'TouchMove',uri:'pages/ArkUI/TouchMoveTest'},
    {title:'PinchGesture',uri:'pages/ArkUI/PinchGestureTest'},
    {title:'RotationGesture',uri:'pages/ArkUI/RotationGestureTest'},
    {title:'SwipeGesture',uri:'pages/ArkUI/SwipeGestureTest'},
    {title:'LongPressGesture',uri:'pages/ArkUI/LongPressGesture'},
    {title:'TapGesture',uri:'pages/ArkUI/TapGesture'},
    {title:'PanGesture',uri:'pages/ArkUI/PanGesture'},
    {title:'CanvasFillStyle',uri:'pages/ArkUI/CanvasFillStyle'},
    {title:'CanvasLineWidth',uri:'pages/ArkUI/CanvasLineWidth'},
    {title:'CanvasStrokeStyle',uri:'pages/ArkUI/CanvasStrokeStyle'},
    {title:'CanvasLineCap',uri:'pages/ArkUI/CanvasLineCap'},
    {title:'CanvasLineJoin',uri:'pages/ArkUI/CanvasLineJoin'},
    {title:'CanvasMiterLimit',uri:'pages/ArkUI/CanvasMiterLimit'},
    {title:'CanvasFont',uri:'pages/ArkUI/CanvasFont'},
    {title:'CanvasTextAlign',uri:'pages/ArkUI/CanvasTextAlign'},
    {title:'CanvasGlobalAlpha',uri:'pages/ArkUI/CanvasGlobalAlpha'},
    {title:'CanvasLineDashOffset',uri:'pages/ArkUI/CanvasLineDashOffset'},
    {title:'CanvasGlobalCompositeOperation',uri:'pages/ArkUI/CanvasGlobalCompositeOperation'},
    {title:'CanvasShadowBlur',uri:'pages/ArkUI/CanvasShadowBlur'},
    {title:'CanvasShadowColor',uri:'pages/ArkUI/CanvasShadowColor'},
    {title:'CanvasShadowOffsetX',uri:'pages/ArkUI/CanvasShadowOffsetX'},
    {title:'CanvasShadowOffsetY',uri:'pages/ArkUI/CanvasShadowOffsetY'},
    {title:'CanvasImageSmoothingEnabled',uri:'pages/ArkUI/CanvasImageSmoothingEnabled'},
    {title:'',uri:'',bgc:Color.Black},
  ]
  @State ColorObject : string[] = ['#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080',
  '#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080',
  '#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080','#ff808080']
  onPageShow(){
    if (this.count === 1){
      this.result = router.getParams()['result'];
      let titles = router.getParams()['title'];
      let name1 = '刚刚点进了哪个用例：'+ titles;
      let results = this.result;
      if (this.result === 'Pass'){
        this.ColorObject[this.current] = '#ff008000';
        filewrite(name1,results,titles);
      }
      else if (this.result === 'Fail'){
        this.ColorObject[this.current] = '#ffff0000';
        filewrite(name1,results,titles);
      }
      else if (this.result === 'None'){
        this.ColorObject[this.current] = this.ColorObject[this.current]
      }
    }

  }
  build(){
    Column(){
      Row() {
        Button() {
          Image($r('app.media.ic_public_back')).width('20vp').height('18vp')
        }.backgroundColor(Color.Black)
        .onClick(() => {
          router.back()
        })
        Row(){
          Text('ArkUI SubSystem')
            .fontColor(Color.White)
            .fontSize('22fp')
        }.justifyContent(FlexAlign.SpaceAround).backgroundColor(Color.Black)
        Row() {
          Button(){
            Image($r('app.media.ic_public_delete'))
              .width('30vp')
              .height('30vp')
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.ClearAll = true;
            this.ColorObject.forEach((value, index) => {
              this.ColorObject[index] =  '#ff808080'
            });
            this.ClearText();
            prompt.showToast({
              message: '结果已删除', duration: 1000
            })
          })
          Button(){
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.ReadTextParseXml();
            prompt.showToast({
              message: '报告已生成', duration: 1000
            })
          })
        }
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({top:'15vp'}).height('6%').backgroundColor(Color.Black)
      List({space:5}){
        ForEach(this.TestCaseList,(item,index) => {
          ListItem(){
            Row(){
              Text(item.title).fontSize(16).fontColor(Color.Black)
              Text(this.BackColor.toString()).visibility(Visibility.None)
            }.width('100%').height(50).alignItems(VerticalAlign.Center).backgroundColor(this.ColorObject[index])
            .onClick(( )=>{
              this.count = 1
              this.ClearAll=false
              this.current = index
              console.info('current:'+this.current+'当前背景色：'+this.TestCaseList[index].bgc+'Index:'+index)
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
    fileio.rmdirSync(path1);
    fileio.mkdirSync(path1);
  }
  ReadTextParseXml(){
    let ReportPath = path1 + '/report1.txt';
    let dir = fileio.opendirSync(path1);
    console.info("ssssss"+dir);
    while (dir) {
      let OP = fileio.openSync(ReportPath, 0o100 | 0o2002, 0o664);
      let buf = new ArrayBuffer(40960);
      let RD = fileio.readSync(OP,buf);
      console.info("ddddd"+RD);
      let report;
      function ab2str(buf) {
        return report = String.fromCharCode.apply(null,new Uint8Array(buf));
      }
      ab2str(buf);
      let str1 = report.split(";");
      let title = [];
      let result = [];
      for(let i=0; i<Math.floor(str1.length/2); i++){
        title[i] = str1[i*2];
        result[i] = str1[i*2+1];
      }
      let arrayBuffer = new ArrayBuffer(40960);
      let bufView = new DataView(arrayBuffer);
      let serializer = new xml.XmlSerializer(bufView);
      serializer.setDeclaration();
      serializer.startElement("testsuite");
      serializer.setAttributes("name","ActsArkUITest");
      for(let i=0; i<title.length; i++){
        serializer.startElement("testcase");
        serializer.setAttributes("name",String(title[i]));
        serializer.setAttributes("result",String(result[i]));
        serializer.endElement();
      }
      serializer.endElement();

      let that = new util.TextDecoder('utf-8');
      let array = new Uint8Array(arrayBuffer);
      let serializerStr = that.decode(array);
      let xmlPath = path1 + "/ArkUITest.xml";
      console.info(xmlPath);
      try{
        console.error(TAG,"write xmlPath =" +xmlPath);
        var xmlfd = fileIO.openSync(xmlPath, 0o102, 0o666);
        fileIO.writeSync(xmlfd,serializerStr);
      }catch(err){
        console.error(TAG,"read xmlPath =" + xmlPath + "error:" + err);
      }finally{
        fileIO.closeSync(xmlfd);
      }
      return
    }
  }
}
function filewrite(name1,results,titles){
  let txtpath = path1 + '/report1.txt';
  let fd = fileio.openSync(txtpath, 0o100 | 0o2002, 0o664);
  let buf = new ArrayBuffer(4096);
  let RD = fileio.readSync(fd,buf);
  console.info("RRRRRRRRRRd"+RD);
  let report = String.fromCharCode.apply(null,new Uint8Array(buf));
  let WriteTitle = (titles).toString();
  let number = WriteTitle.length + 6;
  let Index = report.indexOf(WriteTitle);
  let Log = (titles+";"+results+";").toString();
  if (Index == -1){
    fileio.writeSync(fd,Log);
  }
  else if (Index != -1){
    let key = report.substring(Index,Index+number);
    let FD = fileio.openSync(txtpath, 0o102, 0o666);
    report = report.replace(key,Log);
    let buffer = new ArrayBuffer(4096);
    let rd = fileio.readSync(FD,buffer);
    let Report = report.substring(0,rd);
    fileio.closeSync(FD);
    let Fd = fileio.openSync(txtpath, 0o102, 0o666);
    fileio.writeSync(Fd,Report);
  }
}