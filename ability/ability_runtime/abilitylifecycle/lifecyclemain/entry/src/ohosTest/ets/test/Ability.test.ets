import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, power } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { common, UIAbility, application } from '@kit.AbilityKit';
import installer from '@ohos.bundle.installer';
import { Driver, Component, ON, UiWindow, abilityDelegatorRegistry } from '@kit.TestKit';

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

function createAppClone() {
  console.info('app clone')
  installer.getBundleInstaller().then((bundleInstaller) => {
    bundleInstaller.createAppClone('com.example.myapplication', paramForCreatingAppClone).then((appIndex: number) => {
      console.info(`app clone was created, appIndex: ${appIndex}`);
    }).catch((err: BusinessError) => {
      console.error(`create app clone failed, cause: ${JSON.stringify(err)}`);
    });
  }).catch((e: Error) => {
    console.error(`create app clone failed, cause1: ${JSON.stringify(e)}`);
  });
}

function uninstallAppClone() {
  installer.getBundleInstaller().then((bundleInstaller) => {
    bundleInstaller.destroyAppClone('com.example.myapplication', appCloneIndex, 100).then(() => {
      console.info(`destroyAppClone success`);
    }).catch((err: BusinessError) => {
      console.error(`destroyAppClone failed, cause: ${JSON.stringify(err)}`);
    });
  })
}
let appCloneIndex = 1;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let paramForCreatingAppClone: installer.CreateAppCloneParam = {
  userId: 100,
  appIndex: 1,
};
let delegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function LifeCycleTest() {
  describe('LifeCycleTest', () => {

    it('SUB_Ability_AbilityRuntime_OnWillForeground_0100', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0100';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0100']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0100'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillForeground_0200', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0200';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0200']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });

          setTimeout(async () => {
            try {
              console.info('setTimeout')
              let driver = Driver.create();
              await driver.pressHome();
              abilityDelegator.startAbility({
                bundleName: 'com.example.myapplication',
                abilityName: 'EntryAbility',
                parameters: {
                  parameter: '0200'
                }
              }, (err: BusinessError) => {
                console.info(`${tag}-startAbility err:` + JSON.stringify(err));
              });

            } catch (e) {
              console.error(`${tag}-pressHome error`, e)
            }
          }, 2000)
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack =async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data).assertEqual("onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillForeground_0300', 0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_OnWillForeground_0300`;
      console.log(`${tag}-it begin`);
      createAppClone();
      await sleep(1000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0300']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0300'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
            await sleep(2000);
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('label1'));
            await button.click();
            await sleep(1000);
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        uninstallAppClone()
        done()
      };

    })

    it('SUB_Ability_AbilityRuntime_OnWillForeground_0400', 0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_OnWillForeground_0400`;
      console.log(`${tag}, it begin`);
      createAppClone();
      await sleep(1000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0400']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0400'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
            await sleep(2000);
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('label1'));
            await button.click();
            await sleep(1000);
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        uninstallAppClone()
        await sleep(2000)
        done()
      };

    })

    it('SUB_Ability_AbilityRuntime_OnWillForeground_0900', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0900';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0900']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0900'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillForeground_1000', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_1000';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1000']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '1000'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        done()
      };
    })
  })
}