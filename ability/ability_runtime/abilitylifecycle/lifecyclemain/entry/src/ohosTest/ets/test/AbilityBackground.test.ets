import { describe, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import installer from '@ohos.bundle.installer';
import { Driver, Component, ON } from '@kit.TestKit';

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

let appCloneIndex = 1;

function uninstallAppClone() {
  console.info('pzz uninstallAppClone')
  installer.getBundleInstaller().then((bundleInstaller) => {
    bundleInstaller.destroyAppClone('com.example.myapplication', appCloneIndex, 100).then(() => {
      console.info(`destroyAppClone success`);
    }).catch((err: BusinessError) => {
      console.error(`destroyAppClone failed, cause: ${JSON.stringify(err)}`);
    });
  })
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

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let paramForCreatingAppClone: installer.CreateAppCloneParam = {
  userId: 100,
  appIndex: 1,
};

export default function LifeCycleTest() {
  describe('LifeCycleBackgroundTest', () => {

    it('SUB_Ability_AbilityRuntime_OnWillBackground_0100', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0100';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0100']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility1',
            parameters: {
              parameter: '0100'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
            try {
              let driver = Driver.create();
              await driver.pressHome();
              await sleep(2000)
            } catch (e) {
              console.error(`${tag}-pressHome error`, e)
            }
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1-${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillBackground_0200', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0200';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0200']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility2',
            parameters: {
              parameter: '0200'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
          await sleep(2000)
          try {
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('Close App'));
            await button.click();
          } catch (e) {
            console.error(`${tag}-background 0200 error=>`, JSON.stringify(e))
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1-${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillBackground_1300', 0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_1300';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1300']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility13',
            parameters: {
              parameter: '1300'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });

          await sleep(3000)
          try {
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('Close App'));
            if (button) {
              await button.click();
            }
          } catch (e) {
            console.error(`${tag}-background 1300 error=>`, JSON.stringify(e))
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillBackground_1400', 0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_1400';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1400']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility14',
            parameters: {
              parameter: '1400'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
          await sleep(2000)
          try {
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('Close App'));
            await button.click();
          } catch (e) {
            console.error(`${tag}-background 1400 error=> ${JSON.stringify(e)}`);
          }

        })
        .catch((err: BusinessError) => {
          console.error(`${tag} createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillBackground_0300', 0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0300';
      console.log(`${tag}, it begin`);
      createAppClone();
      await sleep(1000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0300']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility3',
            parameters: {
              parameter: '0300'
            }
          }, async (err: BusinessError) => {
            console.info(`startAbility err:` + JSON.stringify(err));
          });
          await sleep(3000);
          let driver: Driver = Driver.create();
          let button: Component = await driver.findComponent(ON.text('label1'));
          if(button){
            await button.click();
          }
          await sleep(1000)
          try {
            await driver.pressHome();
          }catch (e) {
            console.error(`${tag}-startAbility err:` + JSON.stringify(e));
          }

        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });

      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground");
        commonEventManager.unsubscribe(subscriber);
        uninstallAppClone()
        await sleep(2000);
        done()
      };
    })

    it('SUB_Ability_AbilityRuntime_OnWillBackground_0400', 0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0400';
      console.log(`${tag}-it begin`);
      createAppClone();
      await sleep(1000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0400']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility4',
            parameters: {
              parameter: '0400'
            }
          }, async (err: BusinessError) => {
            console.error(`${tag}-startAbility err:` + JSON.stringify(err));
          });
          await sleep(3000)
          try {
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('label1'));
            button.click()
            await sleep(1000)
            try {
              let closeButton: Component = await driver.findComponent(ON.text('Close App'));
              await closeButton.click();
            } catch (e) {
              console.info(`${tag}-closeButton err:` + JSON.stringify(e));
            }
          } catch (e) {
            console.error(`${tag}-createSubscriber failed, error=`, JSON.stringify(e));
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
        });

      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        commonEventManager.unsubscribe(subscriber);
        uninstallAppClone()
        await sleep(2000);
        done()
      };
    })
  })
}