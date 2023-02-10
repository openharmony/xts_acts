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
import DateTimeUtil from './model/DateTimeUtil'

const TAG = 'ParseXML';
let path=globalThis.dir;
let path1;
let path2;
console.info("ssssssssss"+path);
path1 = path + '/ArkUI';
console.info("ssssssssss"+path1);
path2 = path + '/MediaLibrary';
console.info("ssssssssss"+path2);
fileio.rmdirSync(path);
fileio.mkdirSync(path);
fileio.mkdirSync(path1);
fileio.mkdirSync(path2);

@Entry
@Component
struct IndexPage {
  private TestCaseList = [
    {title:'ArkUI',uri:'pages/ArkUI/ArkUI_index'},
    {title:'MediaLibrary',uri:'pages/MediaLibrary/MediaLibrary_index'},
    {title:'Camera',uri:'pages/Camera/Camera_index'},
  ]
  @State ColorObject : string[] = ['#ff808080','#ff808080','#ff808080']
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
            AlertDialog.show(
              {
                message: "是否删除所有记录",
                primaryButton: {
                  value: 'Yes',
                  action: () => {
                    this.ClearText();
                    prompt.showToast({
                      message: '结果已删除', duration: 1000
                    });
                  }
                },
                secondaryButton: {
                  value: 'No',
                  action: () => {

                  }
                },
                cancel: () => {

                }
              }
            )
          })
          Button(){
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.SaveXml();
            AlertDialog.show({
              message: "报告已生成，如需查看通过命令行输入'hdc_std file recv hdc_std file recv /data/app/el2/100/base/com.example.actsvalidator/haps/entry/files/Test.xml -本地路径'",
              confirm:{
                value:'OK',
                action:()=>{
                  prompt.showToast({
                    message: '总报告已生成', duration: 1000
                  })
                }
              },
              cancel: () => {
                prompt.showToast({
                  message: '总报告已生成', duration: 1000
                });
              }
            })
          })
        }
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({top:'15vp'}).height('6%')
      List({space:5}){
        ForEach(this.TestCaseList,(item,index) => {
          ListItem(){
            Row(){
              Text(item.title).fontSize(16).fontColor(Color.Black)
            }.width('100%').height(50).alignItems(VerticalAlign.Center).backgroundColor(this.ColorObject[index])
            .onClick(()=>{
              router.push({
                url: item.uri,
              })
              let dateTimeUtil = new DateTimeUtil();
              let time = `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDate()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
              let TimePath = path + "/Time.txt";
              let OP = fileio.openSync(TimePath, 0o100 | 0o2002, 0o664);
              let buf = new ArrayBuffer(4096);
              fileio.readSync(OP,buf);
              let Log = (time + ";").toString();
              fileio.writeSync(OP,Log);
            })
          }
        },item  => item.title)
      }.width('100%').height('92%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  ClearText(){
    fileio.rmdirSync(path);
    fileio.mkdirSync(path);
    fileio.mkdirSync(path1);
    fileio.mkdirSync(path2);
  }
  SaveXml() {
    let dateTimeUtil = new DateTimeUtil();
    let endtime = `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDate()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
    let TimePath = path + "/Time.txt";
    let fd = fileio.openSync(TimePath, 0o100 | 0o2002, 0o664);
    let buf = new ArrayBuffer(40960);
    fileio.readSync(fd,buf);
    let StartTime = String.fromCharCode.apply(null, new Uint8Array(buf));
    let Index = StartTime.indexOf(';');
    let starttime = StartTime.substring(0,Index);

    let path11 = path1 + '/ArkUI.txt';
    let path22 = path2 + '/MediaLibrary.txt';
    let OP1 = fileio.openSync(path11, 0o100 | 0o2002, 0o664);
    let buf1 = new ArrayBuffer(40960);
    fileio.readSync(OP1,buf1);
    let ArkUIReport;
    let MediaLibraryReport;

    function ab2str1(buf1) {
      return ArkUIReport = String.fromCharCode.apply(null, new Uint8Array(buf1));
    }
    ab2str1(buf1);
    let str1 = ArkUIReport.split(";");
    let title1 = [];
    let result1 = [];
    for (let i = 0; i < Math.floor(str1.length / 2); i++) {
      title1[i] = str1[i * 2];
      result1[i] = str1[i * 2 + 1];
    }

    let OP2 = fileio.openSync(path22, 0o100 | 0o2002, 0o664);
    let buf2 = new ArrayBuffer(40960);
    fileio.readSync(OP2,buf2);
    function ab2str2(buf2) {
      return MediaLibraryReport = String.fromCharCode.apply(null, new Uint8Array(buf2));
    }
    ab2str2(buf2);
    let str2 = MediaLibraryReport.split(";");
    let title2 = [];
    let result2 = [];
    for (let i = 0; i < Math.floor(str2.length / 2); i++) {
      title2[i] = str2[i * 2];
      result2[i] = str2[i * 2 + 1];
    }

    let report = ArkUIReport + MediaLibraryReport;
    let FailIndex = report.indexOf('Fail');
    let FailNum = 0;
    while(FailIndex != -1) {
      console.log(FailIndex);
      FailNum++;
      FailIndex = report.indexOf('Fail',FailIndex + 1);
    }
    let failNum = (FailNum).toString();
    let PassIndex = report.indexOf('Pass');
    let PassNum = 0;
    while(PassIndex != -1) {
      console.log(PassIndex);
      PassNum++;
      PassIndex = report.indexOf('Pass',PassIndex + 1);
    }
    let TestNum = FailNum + PassNum;
    let testNum = (TestNum).toString();
    let ignoreNum = (52-TestNum).toString();

    let ArkUIFailIndex = ArkUIReport.indexOf('Fail');
    let ArkUIFailNum = 0;
    while (ArkUIFailIndex != -1) {
      console.log(ArkUIFailIndex);
      ArkUIFailNum++;
      ArkUIFailIndex = ArkUIReport.indexOf('Fail',ArkUIFailIndex + 1);
    }
    let ArkuiFailNum = (ArkUIFailNum).toString();
    let ArkUIPassIndex = ArkUIReport.indexOf('Pass');
    let ArkUIPassNum = 0;
    while (ArkUIPassIndex != -1) {
      console.log(ArkUIPassIndex);
      ArkUIPassNum++;
      ArkUIPassIndex = ArkUIReport.indexOf('Pass',ArkUIPassIndex + 1);
    }
    let ArkUITestNum = ArkUIFailNum + ArkUIPassNum;
    let ArkuiTestNum = (ArkUIPassNum).toString();
    let ArkUIIgnoreNum = (24-ArkUITestNum).toString();

    let MediaLibraryFailIndex = MediaLibraryReport.indexOf('Fail');
    let MediaLibraryFailNum = 0;
    while (MediaLibraryFailIndex != -1) {
      console.log(MediaLibraryFailIndex);
      MediaLibraryFailNum++;
      MediaLibraryFailIndex = MediaLibraryReport.indexOf('Fail',MediaLibraryFailIndex + 1);
    }
    let medialibraryFailNum = (MediaLibraryFailNum).toString();
    let MediaLibraryPassIndex = MediaLibraryReport.indexOf('Pass');
    let MediaLibraryPassNum = 0;
    while (MediaLibraryPassIndex != -1) {
      console.log(MediaLibraryPassIndex);
      MediaLibraryPassNum++;
      MediaLibraryPassIndex = MediaLibraryReport.indexOf('Pass',MediaLibraryPassIndex + 1);
    }
    let MediaLibraryTestNum = MediaLibraryFailNum + MediaLibraryPassNum;
    let medialibraryTestNum = (MediaLibraryPassNum).toString();
    let MediaLibraryIgnoreNum = (28-MediaLibraryTestNum).toString();

    let arrayBuffer = new ArrayBuffer(40960);
    let bufView = new DataView(arrayBuffer);
    let serializer = new xml.XmlSerializer(bufView);
    serializer.setDeclaration();
    serializer.startElement("testsuites");
    serializer.setAttributes("name", "ActValidator");
    serializer.setAttributes("starttime", starttime);
    serializer.setAttributes("endtime", endtime);
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", failNum);
    serializer.setAttributes("tests", testNum);
    serializer.setAttributes("ignored", ignoreNum);
    serializer.setAttributes("unavailable", "0");
    serializer.setAttributes("productinfo", "{ }");
    serializer.setAttributes("modules", " ");
    serializer.setAttributes("runmodules", " ");
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsArkUITest");
    serializer.setAttributes("time", " ");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", ArkuiFailNum);
    serializer.setAttributes("ignored", ArkUIIgnoreNum);
    serializer.setAttributes("tests", ArkuiTestNum);
    serializer.setAttributes("message", " ");
    serializer.setAttributes("modulename", "ActsArkUITest");
    for (let i = 0; i < title1.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title1[i]));
      serializer.setAttributes("status", " ");
      serializer.setAttributes("time", " ");
      serializer.setAttributes("classname", " ");
      serializer.setAttributes("result", String(result1[i]));
      serializer.setAttributes("level", " ");
      serializer.setAttributes("message", " ");
      serializer.endElement();
    }
    serializer.endElement();

    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsMediaLibraryTest");
    serializer.setAttributes("time", " ");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", medialibraryFailNum);
    serializer.setAttributes("ignored", MediaLibraryIgnoreNum);
    serializer.setAttributes("tests", medialibraryTestNum);
    serializer.setAttributes("message", " ");
    serializer.setAttributes("modulename", "ActsMediaLibraryTest");
    for (let i = 0; i < title2.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title2[i]));
      serializer.setAttributes("status", " ");
      serializer.setAttributes("time", " ");
      serializer.setAttributes("classname", " ");
      serializer.setAttributes("result", String(result2[i]));
      serializer.setAttributes("level", " ");
      serializer.setAttributes("message", " ");
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
