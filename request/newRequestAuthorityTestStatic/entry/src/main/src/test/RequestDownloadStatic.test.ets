import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import request from "@ohos.request";
import common from "@ohos.app.ability.common";
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let baseContext: common.UIAbilityContext;

export default function RequestDownloadStaticTest() {

  describe("RequestDownloadStaticTest", (): void => {
  hilog.info(domain, tag, '%{public}s', 'RequestDownloadStaticTest start');

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          baseContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.newRequestAuthority.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.number    SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010
     * @tc.name      SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
     hilog.info(domain, tag, "====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 is starting-----------------------");
      try {
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.INITIALIZED:" + request.agent.State.INITIALIZED);
        expect(request.agent.State.INITIALIZED + '').assertEqual('0');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.WAITING:" + request.agent.State.WAITING);
        expect(request.agent.State.WAITING + '').assertEqual('16');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.RUNNING:" + request.agent.State.RUNNING);
        expect(request.agent.State.RUNNING + '').assertEqual('32');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.RETRYING:" + request.agent.State.RETRYING);
        expect(request.agent.State.RETRYING + '').assertEqual('33');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.PAUSED:" + request.agent.State.PAUSED);
        expect(request.agent.State.PAUSED + '').assertEqual('48');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.STOPPED:" + request.agent.State.STOPPED);
        expect(request.agent.State.STOPPED + '').assertEqual('49');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.COMPLETED:" + request.agent.State.COMPLETED);
        expect(request.agent.State.COMPLETED + '').assertEqual('64');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.FAILED:" + request.agent.State.FAILED);
        expect(request.agent.State.FAILED + '').assertEqual('65');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.REMOVED:" + request.agent.State.REMOVED);
        expect(request.agent.State.REMOVED + '').assertEqual('80');
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 error: " + err);
        expect().assertFail();
      }
      hilog.info(domain, tag, "====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 end-----------------------");
      done();
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Download_Promise_Static_0010
     * @tc.name    SUB_Misc_REQUEST_Create_Download_Promise_Static_0010
     * @tc.desc      create a download task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_REQUEST_Create_Download_Promise_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "-----------------------SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Create_Download_Promise_Static_0010.txt',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        expect(task !== undefined).assertEqual(true);
        hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 create success: " + task);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 catch error: " + JSON.stringify(err));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s',"-----------------------SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 end-----------------------");
      done();
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Start_Download_Promise_Static_0010
     * @tc.name SUB_Misc_REQUEST_Start_Download_Promise_Static_0010
     * @tc.desc Start the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Start_Download_Promise_Static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Start_Download_Promise_Static_0010.txt',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        await task.start();
        expect(task !== undefined).assertEqual(true);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 download start success: " + task);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 download start err: " + JSON.stringify(err));
        expect().assertFail();
      }
      hilog.info(domain, tag, "-----------------------SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Download_Callback_Static_0010
     * @tc.name    SUB_Misc_REQUEST_Create_Download_Callback_Static_0010
     * @tc.desc      create a download session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_REQUEST_Create_Download_Callback_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "-----------------------SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Create_Download_Callback_Static_0010.txt',
        data: '',
      };

      request.agent.create(baseContext, config, (err : BusinessError | null, task : request.agent.Task | undefined) : void => {
        hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 downloadTask: " + task);
        try{
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          expect(task !== undefined).assertEqual(true);
          hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 create success: " + task);
        } catch(error: BusinessError ) {
          hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 create fail: " + JSON.stringify(error));
        }
        hilog.info(domain, tag, '%{public}s', "-----------------------SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 end-----------------------");
        done();
      });
    });


    /**
     * @tc.number SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010
     * @tc.name SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010
     * @tc.desc Start the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 is starting-----------------------");
      let arr: request.agent.FormItem = {
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "test.txt",
        }
      };
      let attachments: Array<request.agent.FormItem> = [arr];
      let config: request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        saveas: './SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010.txt',
        method: "POST",
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        await task.start();
        expect(task !== undefined).assertEqual(true);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 download start success: " + task);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 download start err: " + JSON.stringify(err));
        expect().assertFail();
      }
      hilog.info(domain, tag, "-----------------------SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 end-----------------------");
      done();
    });
    

  })

}