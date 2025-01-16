import { describe, it, expect, afterAll, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';

let ACTS_CallFunction: commonEventManager.CommonEventSubscribeInfo = {
  events: ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900']
};

const TAG = 'ActsGetApplicationNewTest';

let subscriber: commonEventManager.CommonEventSubscriber;

let driver = Driver.create();
console.log(TAG, driver)

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    afterEach(async (done: Function) => {
      commonEventManager.unsubscribe(subscriber, () => {
        done();
      });
    })

    afterAll(async () => {
      let cmd: string = 'aa force-stop com.example.contexttest';
      AbilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(cmd,
          (err: BusinessError, d: AbilityDelegatorRegistry.ShellCmdResult) => {
            hilog.info(0x0000, TAG, 'executeShellCommand: %{public}s; err: %{public}s; result:',
            cmd, JSON.stringify(err), d.stdResult);
          });
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0100
     * @tc.name   : Call the global function GetApplicationContext in ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0100', 0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 start!!!')
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 subscribe');
            if (data.event == '0100') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 setTimeout');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0100 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }

      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'EntryAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 getAbilityDelegator end');
      setTimeout(() => {
        AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 StartAbility successfully.');
        }).catch((err: BusinessError) => {
          console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 StartAbility err: ' + err.code);
        })
      }, 1000);
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0200
     * @tc.name   : Call the global function GetApplicationContext in ts
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0200', 0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 start!!!')
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 createSubscriber data')
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0200') {
                expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
                expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
                expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
                expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
                expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
                expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
                expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
                expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
                expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
                expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
                expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
                expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
                expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
                expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
                expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
                expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
                expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
                expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
                expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
                expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
                expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
                expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              	expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              	expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              	expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              	expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              	expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              	expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              	expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              	expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              	expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              	done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0200 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }

      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'StartAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 getAbilityDelegator end');
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 StartAbility err: ' + err.code);
      })
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0300
     * @tc.name   : Call the global function GetApplicationContext in index.ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0300', 0, async (done: Function) => {
      try {
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 createSubscriber data')
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0300') {
                expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
                expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
                expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
                expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
                expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
                expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
                expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
                expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
                expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
                expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
                expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
                expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
                expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
                expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
                expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
                expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
                expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
                expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
                expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
                expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
                expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
                expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              	expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
           	    expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
          	    expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              	expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              	expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              	expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              	expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              	expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              	expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              	done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbility'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 getAbilityDelegator end');
        await AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 StartAbility successfully.');
        }).catch((err: BusinessError) => {
          console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 StartAbility err: ' + err.code);
        });

        try {
          await driver.delayMs(500);
          let name = await driver.findComponent(ON.id('getapplicationl1'));
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 name = ', name)
          await driver.delayMs(500);
          await name.click();
        } catch (err) {
          console.log(' driver error: ', JSON.stringify(err));
        }
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0300 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0400
     * @tc.name   : Call the global function GetApplicationContext in UIAbility
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0400', 0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 start!!!');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0600') {
                expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
                expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
                expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
                expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
                expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
                expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
                expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
                expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
                expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
                expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
                expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
                expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
                expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
                expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
                expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
                expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
                expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
                expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
                expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
                expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
                expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
                expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              	expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              	expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              	expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              	expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              	expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              	expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              	expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              	expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              	expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              	done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0400 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }

      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'SingleStartMultipleAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 getAbilityDelegator end');
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 StartAbility err: ' + err.code);
      })
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0500
     * @tc.name   : Call the global function GetApplicationContext in multi module
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0500', 0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 start!!!')
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0900') {
                expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
                expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
                expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
                expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
                expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
                expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
                expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
                expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
                expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
                expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
                expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
                expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
                expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
                expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
                expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
                expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
                expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
                expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
                expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
                expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
                expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
                expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              	expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              	expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              	expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              	expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              	expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              	expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              	expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              	expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              	expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              	done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0500 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }

      console.log(TAG, 'StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'FeatureAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 getAbilityDelegator end');
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 StartAbility err: ' + err.code);
      })
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0600
     * @tc.name   : Call the global function GetApplicationContext in index.ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
         it('SUB_Ability_AbilityRuntime_GetApplicationContext_0600', 0, async (done: Function) => {
          try {
            commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 createSubscriber data')
              subscriber = data;
              commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
                console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 event start')
                if (data.event == '0700') {
                    console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 event')
                    expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
                    expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
                    expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
                    expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
                    expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
                    expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
                    expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
                    expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
                    expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
                    expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
                    expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
                    expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
                    expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
                    expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
                    expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
                    expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
                    expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
                    expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
                    expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
                    expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
                    expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
                    expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
                    expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
                    expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
                    expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
                    expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
                    expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
                    expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
                    expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
                    expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
                    expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
                    done();
                }
              });
            });
    
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 StartAbility start');
            let want: Want = {
              bundleName: 'com.example.contexttest',
              abilityName: 'HotStartAbility'
            };
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 getAbilityDelegator end');
            await AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
              console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 StartAbility successfully.');
            }).catch((err: BusinessError) => {
              console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 StartAbility err: ' + err.code);
            });
    
            try {
              await driver.delayMs(500);
              let name = await driver.findComponent(ON.id('change1'));
              console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 name = ', name)
              await driver.delayMs(500);
              await name.click();
            } catch (err) {
              console.log(' driver error: ', JSON.stringify(err));
            }
          } catch (err) {
            console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0600 error: ', JSON.stringify(err))
            expect().assertFail();
            done();
          }
        })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0700
     * @tc.name   : Call the global function GetApplicationContext in ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0700', 0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 start!!!')
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 subscribe');
            if (data.event == '0800') {
                console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 setTimeout');
                expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
                expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
                expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
                expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
                expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
                expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
                expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
                expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
                expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
                expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
                expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
                expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
                expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
                expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
                expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
                expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
                expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
                expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
                expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
                expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
                expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
                expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
                expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
                expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
                expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
                expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
                expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
                expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
                expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
                expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
                expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
                done();
            }
          });
        });

      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'InstanceUIExtensionAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 getAbilityDelegator end');
      setTimeout(() => {
        AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 StartAbility successfully.');
        }).catch((err: BusinessError) => {
          console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 StartAbility err: ' + err.code);
        })
      }, 1000);
    } catch (err) {
      console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0700 error: ', JSON.stringify(err))
      expect().assertFail();
      done();
    }
    })

        /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0800
     * @tc.name   : Call the global function GetApplicationContext in ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
         it('SUB_Ability_AbilityRuntime_GetApplicationContext_0800', 0, async (done: Function) => {
          try {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 start!!!')
            commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 createSubscriber data');
              subscriber = data;
              commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
                console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 subscribe');
                if (data.event == '0400') {
                    console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 setTimeout');
                    expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
                    expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
                    expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
                    expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
                    expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
                    expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
                    expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
                    expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
                    expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
                    expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
                    expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
                    expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
                    expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
                    expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
                    expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
                    expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
                    expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
                    expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
                    expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
                    expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
                    expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
                    expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
                    expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
                    expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
                    expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
                    expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
                    expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
                    expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
                    expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
                    expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
                    expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
                    done();
                }
              });
            });
    
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility start');
            let want: Want = {
              bundleName: 'com.example.contexttest',
              abilityName: 'StartAbility'
            };
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 getAbilityDelegator end');
            setTimeout(() => {
              AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
                console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility successfully.');
              }).catch((err: BusinessError) => {
                console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility err: ' + err.code);
              })
            }, 1000);
          } catch (err) {
            console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0800 error: ', JSON.stringify(err))
            expect().assertFail();
            done();
          }
      })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0900
     * @tc.name   : Call the global function GetApplicationContext in ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0900', 0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 start!!!')
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 subscribe');
            if (data.event == '0500') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 setTimeout');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'ServiceExtAbility'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 StartAbility successfully.');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0900 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }
     })
   })
}