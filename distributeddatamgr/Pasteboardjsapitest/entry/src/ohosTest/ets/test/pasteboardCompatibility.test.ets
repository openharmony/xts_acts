import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import pasteboard from '@ohos.pasteboard';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import { abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import taskpool from '@ohos.taskpool';

const ARRAY_BUFFER = new ArrayBuffer(256)
let TAG = "ttt"
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard()
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

@Concurrent
async function promise1(){
  let TAG = "ttt"
  let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
  systemPasteboard.clearDataSync();
  let plainTextData = new unifiedDataChannel.UnifiedData();
  let GetDelayPlainTextData = (() => {
    let plainText = new unifiedDataChannel.PlainText();
    plainText.details = {
      Key: 'delayPlainText',
      Value: 'delayPlainText'
    };
    plainText.textContent = 'delayTextContent';
    plainText.abstract = 'delayTextContent';
    plainTextData.addRecord(plainText);
    return plainTextData;
  })
  plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
  plainTextData.properties.getDelayData = GetDelayPlainTextData;
  await systemPasteboard.setUnifiedData(plainTextData).then(() => {
    console.info(TAG + 'Set plainTextData Success');
  }).catch((error:BusinessError) => {
    console.info(TAG + 'Set plainTextData Fail.code:' + error.code + ',message:' + error.message);
    expect().assertFail();
  })
}

@Concurrent
async function promise2(){
  let TAG = "ttt"
  try {
    let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
    let result = systemPasteboard.getDataSync();
    let data = result;
    console.info(TAG + 'Get plainTextData,mimeType:' + data.getPrimaryMimeType() + ',html:' + data.getPrimaryHtml()
      + ',text:' + data.getPrimaryText() + ',uri:' + data.getPrimaryUri());
    expect(data.getPrimaryMimeType()).assertEqual('text/plain');
    expect(data.getPrimaryText()).assertEqual('delayTextContent');
    console.info(TAG + 'Get plainTextData Success');
  } catch (error) {
    console.info(TAG + 'Get plainTextData Fail.code:' + error.code + ',message:' + error.message);
    expect().assertFail();
  }
}

@Concurrent
async function promise3(){
  let TAG = 'ttt'
  let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
  systemPasteboard.clearDataSync();
  let plainTextData = new unifiedDataChannel.UnifiedData();
  let GetDelayPlainTextData = (() => {
    let plainText = new unifiedDataChannel.PlainText();
    plainText.details = {
      Key: 'delayPlainText',
      Value: 'delayPlainText'
    };
    plainText.textContent = 'delayTextContent';
    plainText.abstract = 'delayTextContent';
    plainTextData.addRecord(plainText);
    return plainTextData;
  })
  plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
  plainTextData.properties.getDelayData = GetDelayPlainTextData;
  try {
    systemPasteboard.setUnifiedDataSync(plainTextData);
    console.info(TAG + 'Set plainTextData Success')
  } catch (error) {
    console.info(TAG + 'Set plainTextData Fail.code:' + error.code + ',message:' + error.message);
  }
}

let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('TestAbilityContext') as common.UIAbilityContext
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = await Driver.create();
    console.info('come in driveFn');
    console.info('driver is ${JSON.stringify(driver)}');
    await sleep(1000);
    let button = await driver.findComponent(ON.text('仅本次允许'));
    console.info('button is $ {JSON.stringify(button)}');
    await sleep(1000);
    await button.click();
    await  sleep(1000);
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

export default function PasteboardCompatibilityTest() {
  describe('PasteboardCompatibilityTest', async () => {
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done()
    })
    beforeEach(() => {
      systemPasteboard.clearDataSync();
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0100
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0100
     * @tc.desc Test PlainText in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0100', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0100 start ************')
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let GetDelayPlainTextData = ((dataType:string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'delayPlainText',
          Value: 'delayPlainText'
        };
        plainText.textContent = 'delayTextContent';
        plainText.abstract = 'delayAbstract';
        plainTextData.addRecord(plainText)
        return plainTextData;
      })
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      plainTextData.properties.getDelayData = GetDelayPlainTextData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(plainTextData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set plainTextData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set plainTextData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get hyperLinkData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('text/plain');
        expect(result.getPrimaryText()).assertEqual('delayTextContent')
        console.info(TAG + 'Get plainTextData Success')
      } catch (error) {
        console.info(TAG + 'Get plainTextData Fail.code:' + error.code + ',message:' + error.message)
        expect().assertFail()
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0200
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0200
     * @tc.desc Test Text in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0200', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0200 start ************')
      let textData = new unifiedDataChannel.UnifiedData();
      let GetDelayTextData = ((dataType:string) => {
        let text = new unifiedDataChannel.Text();
        text.details = {
          Key: 'text',
          Value: 'text'
        };
        textData.addRecord(text);
        return textData;
      })
      textData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      textData.properties.getDelayData = GetDelayTextData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(textData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set textData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set textData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get hyperLinkData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('general.text');
        console.info(TAG + 'Get TextData Success')
      } catch (error) {
        console.info(TAG + 'Get TextData Fail.code:' + error.code + ',message:' + error.message)
        expect().assertFail()
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0300
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0300
     * @tc.desc Test hyperLink in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0300', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0300 start ************')
      let hyperLinkData = new unifiedDataChannel.UnifiedData();
      let GetDelayLinkData = ((dataType:string) => {
        let link = new unifiedDataChannel.Hyperlink();
        link.details = {
          Key: 'hyperLink',
          Value: 'hyperLink'
        };
        link.url = 'url';
        link.description = 'description';
        hyperLinkData.addRecord(link);
        return hyperLinkData;
      })
      hyperLinkData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      hyperLinkData.properties.getDelayData = GetDelayLinkData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(hyperLinkData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set hyperLinkData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set hyperLinkData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get hyperLinkData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('text/plain');
        expect(result.getPrimaryText()).assertEqual('url');
      } catch (error) {
        console.info(TAG + 'Get hyperLinkData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0300 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0400
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0400
     * @tc.desc Test html in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0400', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0400 start ************')
      let htmlData = new unifiedDataChannel.UnifiedData();
      let GetDelayHtmlData = ((dataType:string) => {
        let html = new unifiedDataChannel.HTML();
        html.details = {
          Key: 'html',
          Value: 'html'
        };
        html.htmlContent = 'htmlContent';
        html.plainContent = 'plainContent';
        htmlData.addRecord(html);
        return htmlData;
      })
      htmlData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      htmlData.properties.getDelayData = GetDelayHtmlData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(htmlData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set htmlData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set htmlData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get htmlData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('text/html');
      } catch (error) {
        console.info(TAG + 'Get htmlData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0400 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0500
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0500
     * @tc.desc Test file in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0500', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0500 start ************')
      let fileData = new unifiedDataChannel.UnifiedData();
      let GetDelayFileData = ((dataType:string) => {
        let file = new unifiedDataChannel.File();
        file.details = {
          Key: 'file',
          Value: 'file'
        };
        file.uri = 'uri';
        fileData.addRecord(file);
        return fileData;
      })
      fileData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      fileData.properties.getDelayData = GetDelayFileData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(fileData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set fileData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set fileData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get fileData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryUri()).assertEqual('uri');
        expect(result.getPrimaryMimeType()).assertEqual('text/uri');
      } catch (error) {
        console.info(TAG + 'Get fileData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0500 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0600
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0600
     * @tc.desc Test folder in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0600', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0600 start ************')
      let folderData = new unifiedDataChannel.UnifiedData();
      let GetDelayFolderData = ((dataType:string) => {
        let folder = new unifiedDataChannel.File();
        folder.details = {
          Key: 'folder',
          Value: 'folder'
        };
        folder.uri = 'folderUri';
        folderData.addRecord(folder);
        return folderData;
      })
      folderData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      folderData.properties.getDelayData = GetDelayFolderData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(folderData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set folderData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set folderData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get folderData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryUri()).assertEqual('folderUri');
        expect(result.getPrimaryMimeType()).assertEqual('text/uri');
      } catch (error) {
        console.info(TAG + 'Get folderData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0600 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0700
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0700
     * @tc.desc Test image in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0700', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0700 start ************')
      let imageData = new unifiedDataChannel.UnifiedData();
      let GetDelayImageData = ((dataType:string) => {
        let image = new unifiedDataChannel.Image();
        image.details = {
          Key: 'image',
          Value: 'image'
        };
        image.uri = 'imageUri';
        imageData.addRecord(image);
        return imageData;
      })
      imageData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      imageData.properties.getDelayData = GetDelayImageData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(imageData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set imageData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set imageData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get imageData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryUri()).assertEqual('imageUri');
        expect(result.getPrimaryMimeType()).assertEqual('text/uri');
      } catch (error) {
        console.info(TAG + 'Get imageData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0700 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0800
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0800
     * @tc.desc Test video in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0800', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0800 start ************')
      let videoData = new unifiedDataChannel.UnifiedData();
      let GetDelayVideoData = ((dataType:string) => {
        let video = new unifiedDataChannel.Video();
        video.details = {
          Key: 'video',
          Value: 'video'
        };
        video.videoUri = 'videoUri';
        videoData.addRecord(video);
        return videoData;
      })
      videoData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      videoData.properties.getDelayData = GetDelayVideoData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(videoData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set videoData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set videoData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get videoData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryUri()).assertEqual('videoUri');
        expect(result.getPrimaryMimeType()).assertEqual('text/uri');
      } catch (error) {
        console.info(TAG + 'Get videoData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0800 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0900
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0900
     * @tc.desc Test audio in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0900', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0900 start ************')
      let audioData = new unifiedDataChannel.UnifiedData();
      let GetDelayAudioData = ((dataType:string) => {
        let audio = new unifiedDataChannel.Audio();
        audio.details = {
          Key: 'audio',
          Value: 'audio'
        };
        audio.audioUri = 'audioUri';
        audioData.addRecord(audio);
        return audioData;
      })
      audioData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      audioData.properties.getDelayData = GetDelayAudioData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(audioData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set audioData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set audioData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get audioData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryUri()).assertEqual('audioUri');
        expect(result.getPrimaryMimeType()).assertEqual('text/uri');
      } catch (error) {
        console.info(TAG + 'Get audioData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_0900 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1000
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1000
     * @tc.desc Test sysForm in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1000', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1000 start ************')
      let sysFormData = new unifiedDataChannel.UnifiedData();
      let GetDelayFormData = ((dataType:string) => {
        let form = new unifiedDataChannel.SystemDefinedForm();
        form.formId = 0;
        form.formName = 'formName';
        form.bundleName = 'bundleName';
        form.abilityName = 'abilityName';
        form.module = 'module';
        form.details = {
          formKey1: 1,
          formKet2: 'form',
          formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
        };
        sysFormData.addRecord(form);
        return sysFormData;
      })
      sysFormData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      sysFormData.properties.getDelayData = GetDelayFormData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(sysFormData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set sysFormData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set sysFormData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get sysFormData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('openharmony.form');
      } catch (error) {
        console.info(TAG + 'Get sysFormData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1000 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1100
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1100
     * @tc.desc Test appItem in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1100', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1100 start ************')
      let sysAppItemData = new unifiedDataChannel.UnifiedData();
      let GetDelayItemData = ((dataType:string) => {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.appId = 'appId';
        appItem.appName = 'appName';
        appItem.bundleName = 'bundleName';
        appItem.abilityName = 'abilityName';
        appItem.appIconId = 'appIconId';
        appItem.appLabelId = 'appLabelId';
        appItem.details = {
          formKey1: 1,
          formKet2: 'appItem',
          formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
        };
        sysAppItemData.addRecord(appItem);
        return sysAppItemData;
      })
      sysAppItemData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      sysAppItemData.properties.getDelayData = GetDelayItemData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(sysAppItemData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set sysAppItemData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set sysAppItemData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get sysAppItemData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('openharmony.app-item');
      } catch (error) {
        console.info(TAG + 'Get sysAppItemData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1200
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1200
     * @tc.desc Test appRecord in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1200', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1200 start ************')
      let appRecordData = new unifiedDataChannel.UnifiedData();
      let GetDelayAppRecordData = ((dataType:string) => {
        let appRecord = new unifiedDataChannel.ApplicationDefinedRecord();
        let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        appRecord.applicationDefinedType = 'ApplicationDefinedType';
        appRecord.rawData = u8Array;
        appRecordData.addRecord(appRecord)
        return appRecordData;
      })
      appRecordData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      appRecordData.properties.getDelayData = GetDelayAppRecordData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(appRecordData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set appRecordData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set appRecordData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get appRecordData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('ApplicationDefinedType');
      } catch (error) {
        console.info(TAG + 'Get appRecordData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1300
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1300
     * @tc.desc Test want in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1300', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1300 start ************')
      let wantData = new unifiedDataChannel.UnifiedData();
      let GetDelayWantData = ((dataType:string) => {
        let object:Want = {
          bundleName: 'bundleName',
          abilityName: 'abilityName'
        };
        let wantRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT, object);
        wantData.addRecord(wantRecord)
        return wantData;
      })
      wantData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      wantData.properties.getDelayData = GetDelayWantData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(wantData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set wantData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set wantData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get pixelMapData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('text/want');
      } catch (error) {
        console.info(TAG + 'Get pixelMapData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1300 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1400
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1400
     * @tc.desc Test pixelMap in setUnifiedData and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1400', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1400 start ************')
      let pixelMapData = new unifiedDataChannel.UnifiedData();
      let GetDelayPixelMapData = ((dataType:string) => {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5}
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: 3,
          editable: true,
          alphaType: 1,
          scaleMode: 1
        };
        let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
        let pixelMapRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);
        pixelMapData.addRecord(pixelMapRecord)
        return pixelMapData;
      })
      pixelMapData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      pixelMapData.properties.getDelayData = GetDelayPixelMapData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setUnifiedData(pixelMapData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set pixelMapData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set pixelMapData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      })
      try {
        let result = await systemPasteboard.getData();
        console.info(TAG + 'Get pixelMapData,mimeType:' + result.getPrimaryMimeType() + ',html:' + result.getPrimaryHtml()
          + ',text:' + result.getPrimaryText() + ',uri:' + result.getPrimaryUri());
        expect(result.getPrimaryMimeType()).assertEqual('pixelMap');
      } catch (error) {
        console.info(TAG + 'Get pixelMapData Fail:' + error.code + ',message:' + error.message)
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1400 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1500
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1500
     * @tc.desc Test plainText in setUnifiedData and getDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1500', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1500 start ************')
      let task9_promise1: taskpool.Task = new taskpool.Task(promise1)
      try {
        await taskpool.execute(task9_promise1);
        console.info(TAG + 'Promise1 Success');
        await promise2();
        console.info(TAG + 'Promise2 Success');
      } catch (err) {
        console.info(TAG + 'SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1500 taskpool execute Failed.code=' + err.code + ',message=' + err.message);
        expect().assertFail()
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1500 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1600
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1600
     * @tc.desc Test text in setUnifiedData and getData not delay
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1600', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1600 start ************')
      let textData = new unifiedDataChannel.UnifiedData();
      let text = new unifiedDataChannel.Text();
      text.details = {
        Key: 'text',
        Value: 'text'
      };
      textData.addRecord(text);
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      await systemPasteboard.setUnifiedData(textData).then((data: void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set textData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set textData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      });

      let getData = systemPasteboard.getData();
      await getData.then((data) => {
        console.info(TAG + 'Get textData,mimeType:' + data.getPrimaryMimeType() + '.html:' + data.getPrimaryHtml()
        + ',text:' + data.getPrimaryText() + ',uri:' + data.getPrimaryUri());
        expect(data.getPrimaryMimeType()).assertEqual('general.text');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get textData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1600 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1700
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1700
     * @tc.desc Test text in setUnifiedDataSync and getData not delay
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1700', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1700 start ************')
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key: 'plainText',
        Value: 'plainText'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText)
      expect(systemPasteboard.hasDataSync()).assertFalse();
      try {
        systemPasteboard.setUnifiedDataSync(plainTextData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set plainTextData Success');
      } catch (error) {
        console.info(TAG + 'Set plainTextData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }

      let getData = systemPasteboard.getData();
      await getData.then((data) => {
        console.info(TAG + 'Get plainTextData,mimeType:' + data.getPrimaryMimeType() + '.html:' + data.getPrimaryHtml()
          + ',text:' + data.getPrimaryText() + ',uri:' + data.getPrimaryUri());
        expect(data.getPrimaryMimeType()).assertEqual('text/plain');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get plainTextData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1700 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1800
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1800
     * @tc.desc Test plainText in setUnifiedDataSync and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1800', 0, async () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let GetDelayPlainTextData = ((dataType: string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'plainText',
          Value: 'plainText'
        };
        plainText.textContent = 'textContent';
        plainText.abstract = 'abstract';
        plainTextData.addRecord(plainText)
        return plainTextData
      })
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      plainTextData.properties.getDelayData = GetDelayPlainTextData;
      expect(systemPasteboard.hasDataSync()).assertFalse();
      try {
        systemPasteboard.setUnifiedDataSync(plainTextData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set plainTextData Success');
      } catch (error) {
        console.info(TAG + 'Get plainTextData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }

      let getData = systemPasteboard.getData();
      await getData.then((data) => {
        expect(data.getPrimaryMimeType()).assertEqual('text/plain');
        console.info(TAG + 'Get plainTextData,mimeType:' + data.getPrimaryMimeType() + '.html:' + data.getPrimaryHtml()
          + ',text:' + data.getPrimaryText() + ',uri:' + data.getPrimaryUri());
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get plainTextData Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1900
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1900
     * @tc.desc Test plainText in setUnifiedDataSync and getDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1900', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1900 start ************')
      let task9_promise2: taskpool.Task = new taskpool.Task(promise3)
      try {
        await taskpool.execute(task9_promise2);
        console.info(TAG + 'Promise3 Success');
        await promise2();
        console.info(TAG + 'Promise2 Success');
      } catch (err) {
        console.info(TAG + 'SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1500 taskpool execute Failed.code=' + err.code + ',message=' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_1900 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2000
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2000
     * @tc.desc Test string in setData and getUnifiedData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2000', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2000 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData('string', ARRAY_BUFFER);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setData(pasteData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set ARRAY_BUFFER Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set ARRAY_BUFFER Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
      await systemPasteboard.getUnifiedData().then((data) => {
        let outputDataType = data.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('ApplicationDefinedType');
        console.info(TAG + 'Get ARRAY_BUFFER Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get ARRAY_BUFFER Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2000 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2100
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2100
     * @tc.desc Test pixelMap in setData and getUnifiedData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2100', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2100 start ************')
      let buffer = new ArrayBuffer(128);
      let realSize:image.Size = { height: 3, width: 5};
      let opt:image.InitializationOptions = {
        size: realSize,
        pixelFormat: 3,
        editable: true,
        alphaType: 1,
        scaleMode: 1
      };
      let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setData(pasteData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Set pixelMap Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Set pixelMap Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })

      await systemPasteboard.getUnifiedData().then((data) => {
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP) {
          console.info(TAG + 'Get pixelMap, type:' + records[0].getType() + ',object:' + JSON.stringify(records[0].getValue()));
          expect(records[0].getType()).assertEqual('openharmony.pixel-map');
        } else {
          console.info(TAG + 'Get pixelMap Data Fail, type:' + records[0].getType());
          expect().assertFail();
        }
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get pixelMap Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2200
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2200
     * @tc.desc Test want in setData and getUnifiedData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2200', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2200 start ************')
      let object: Want = {
        bundleName: 'com.example.aafwk.test',
        abilityName: 'com.example.aafwk.test.TwoAbility'
      };
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, object);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setData(pasteData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue()
        console.info(TAG + 'Set want Data Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get pixelMap Fail.code:' + error.code + ',message:' + error.message);
      });

      await systemPasteboard.getUnifiedData().then((data) => {
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT) {
          expect(records[0].getType()).assertEqual('openharmony.want');
          console.info(TAG + 'Get Want Data Success, type:' + records[0].getType() + ',object:' + JSON.stringify(records[0].getValue()));
        } else {
          console.info(TAG + 'Get Want Data No Success, type:' + records[0].getType());
          expect().assertFail();
        }
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get pixelMap Fail.code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2300
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2300
     * @tc.desc Test arraybuffer in setData and getUnifiedData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2300', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2300 start ************')
      let dataXml = new ArrayBuffer(256);
      let pasteData: pasteboard.PasteData = pasteboard.createData('arraybuffer', dataXml);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setData(pasteData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue()
        console.info(TAG + 'Succeed in setting PasteData');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Failed to set PasteData. Cause:' + error);
      });

      await systemPasteboard.getUnifiedData().then((data) => {
        let outputDataType = data.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('ApplicationDefinedType');
        console.info(TAG + 'Get Data Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get Data Fail:' + error);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2300 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2400
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2400
     * @tc.desc Test uri in setData and getUnifiedData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2400', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2400 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'dataability://com.example.myapplication1/user.txt');
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setData(pasteData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue()
        console.info(TAG + 'Succeed in setting PasteData');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Failed to set PasteData. Cause:' + error);
      });

      await systemPasteboard.getUnifiedData().then((data) => {
        let outputDataType = data.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('general.file');
        console.info(TAG + 'Get uriData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get uriData Fail:' + error);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2400 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2500
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2500
     * @tc.desc Test html in setData and getUnifiedData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2500', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2500 start ************')
      let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "<h1>HEAD</h1>\n" + "<p></p>\n" + "</body>\n" + "</html>";
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, html);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setData(pasteData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue()
        console.info(TAG + 'Succeed in setting PasteData');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Failed to set PasteData. Cause:' + error);
      });

      await systemPasteboard.getUnifiedData().then((data) => {
        let outputDataType = data.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('general.html');
        console.info(TAG + 'Get htmlData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get htmlData Fail:' + error);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2500 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2600
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2600
     * @tc.desc Test ARRAY_BUFFER in setData and getUnifiedDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2600', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2600 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData('string', ARRAY_BUFFER);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      await systemPasteboard.setData(pasteData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeed in setting PasteData');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Failed to set PasteData. Cause:' + error);
        expect().assertFail();
      })

      try {
        let result: unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
        let outputDataType = result.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('ApplicationDefinedType');
        console.info(TAG + 'Succeed in getting UnifiedData');
      } catch (error) {
        console.info(TAG + 'Failed to get UnifiedData. Cause:' + error);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2600 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2700
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2700
     * @tc.desc Test ARRAY_BUFFER in setDataSync and getUnifiedData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2700', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2700 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData('string', ARRAY_BUFFER);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      try {
        systemPasteboard.setDataSync(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeed in setting PasteData')
      } catch (error) {
        console.info(TAG + 'Failed to set PasteData. Cause:' + error);
        expect().assertFail()
      }

      await systemPasteboard.getUnifiedData().then((data) => {
        let outputDataType = data.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('ApplicationDefinedType');
        console.info(TAG + 'Get htmlData Success');
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get htmlData Fail:' + error);
        expect().assertFail();
      })
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2700 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2800
     * @tc.name testSUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2800
     * @tc.desc Test ARRAY_BUFFER in setDataSync and getUnifiedDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2800', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2800 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData('string', ARRAY_BUFFER);
      expect(systemPasteboard.hasDataSync()).assertFalse();
      try {
        systemPasteboard.setDataSync(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeed in setting PasteData')
      } catch (error) {
        console.info(TAG + 'Failed to set PasteData. Cause:' + error);
        expect().assertFail()
      }

      try {
        let result: unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
        let outputDataType = result.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('ApplicationDefinedType');
        console.info(TAG + 'Succeed in getting UnifiedData');
      } catch (error) {
        console.info(TAG + 'Failed to get UnifiedData. Cause:' + error);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_DelayCopy_CompatibilityTest_2800 end ************')
    })
  })
}