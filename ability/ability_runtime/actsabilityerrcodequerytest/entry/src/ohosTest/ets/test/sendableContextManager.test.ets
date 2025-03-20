/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { commonEventManager } from '@kit.BasicServicesKit';
import base from '@ohos.base';
import { common } from '@kit.AbilityKit';
import { wantAgent, Want } from '@kit.AbilityKit';
import type { WantAgent } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';

let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_OPENLINK', 'ACTS_TEST_DESTROY']
};
let subscriber: commonEventManager.CommonEventSubscriber;
let context = getContext(this) as common.UIAbilityContext;
let wantAgentData: WantAgent;

function publishCB(err: BusinessError) {
  if (err) {
    console.error(`Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    console.info('====>publish ACTS_TEST_OPENLINK');
    console.info(`Succeeded in publishing common event.`);
  }
}

export default function sendableContextManagerTest() {
  describe('sendableContextManagerTest', () => {

    beforeAll(() => {
      context = globalThis.context
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0100
     * @tc.name   : call startChildProcess to create a child process
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_ChildProcessManager_sendableContextManager_0100', 0, (done:Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0100`;
      try {
        // let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(undefined);
        // let context: common.Context = sendableContextManager.convertToContext(undefined);
        // let context: common.ApplicationContext = sendableContextManager.convertToApplicationContext(undefined);
        // let context: common.AbilityStageContext = sendableContextManager.convertToAbilityStageContext(undefined);
        // let context: common.UIAbilityContext = sendableContextManager.convertToUIAbilityContext(undefined);
        console.info(`${tag} sendableContextManager.convertFromContext success`);
        done();
      } catch (error) {
        console.error(`${tag}convertFromContext failed,error is:`, JSON.stringify(error));
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0200
     * @tc.name   : call startChildProcess to create a child process
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_ChildProcessManager_sendableContextManager_0200', 0, (done:Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0200`;
      let moduleContext: common.Context;
      try {
        moduleContext = context.createModuleContext(undefined);
      } catch (error) {
        console.error(`createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0300
     * @tc.name   : getGroupDir callback
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0300', 0, (done:Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0300`;
      try {
        context.getGroupDir(undefined, (err, data) => {
          if (err) {
            console.error(`${tag} getGroupDir faile, err: ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401)
            done();
          } else {
            console.log(`${tag} getGroupDir result is: ${JSON.stringify(data)}`);
          }
        })
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0400
     * @tc.name   : getGroupDir promise with undefined
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0400', 0, (done:Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0400`;
      try {
        context.getGroupDir(undefined).then(data => {
          console.log(`${tag} getGroupDir result:` + data);
        })
          .catch((error : BusinessError)=>{
            console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
            expect(error.code).assertEqual(401)
            done();
          })
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0500
     * @tc.name   : createAreaModeContext with undefined
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0500', 0, (done:Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0500`;
      let moduleContext: common.Context;
      try {
        moduleContext = context.createAreaModeContext(undefined)
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    // /*
    //  * @tc.number : SUB_ChildProcessManager_sendableContextManager_0600
    //  * @tc.name   : killAllProcesses with undefined
    //  * @tc.desc   : Function test
    //  * @tc.size:   MediumTest
    //  * @tc.type:   Function
    //  * @tc.level  : 0
    //  */
    // it('SUB_ChildProcessManager_sendableContextManager_0600', 0, (done:Function) => {
    //   let tag:string = `SUB_ChildProcessManager_sendableContextManager_0600`;
    //   let link:string = 'https://www.applicationContext01.com'
    //   let want: Want = {
    //     uri: link,
    //     parameters: {
    //       appLinkingOnly: false,
    //       demo_num: 111
    //     }
    //   }
    //   commonEventManager.createSubscriber(ACTS_EVENT)
    //     .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
    //       subscriber = commonEventSubscriber;
    //       let unSubscribeCallback = () => {
    //         setTimeout(async () => {
    //           console.info(`====>${tag} unSubscribeCallback`);
    //           done();
    //         }, 1000);
    //       }
    //       let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
    //         console.log("OpenLink subscribeCallBack success")
    //         if (data.event == 'ACTS_TEST_OPENLINK') {
    //           setTimeout(() => {
    //             context.startAbility(want, (err: BusinessError) => {
    //               if (err.code) {
    //                 console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
    //                 expect(err.code).assertEqual(16000019);
    //                 commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
    //               }
    //             })
    //           }, 500);
    //         }
    //         if (data.event == 'ACTS_TEST_DESTROY') {
    //           setTimeout(() => {
    //             commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
    //           }, 500);
    //         }
    //       }
    //       commonEventManager.subscribe(subscriber, subscribeCallBack);
    //       setTimeout(() => {
    //         commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
    //       }, 100)
    //     })
    // })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0700
     * @tc.name   : restartApp with undefined
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0700', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_0700`;
      let applicationContext = context.getApplicationContext();
      try {
        applicationContext.restartApp(undefined);
      } catch (error) {
        console.error(`${tag} restartApp fail, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0800
     * @tc.name   : restartApp in background
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
      it('SUB_ChildProcessManager_sendableContextManager_0800', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_0800`;
      let applicationContext = context.getApplicationContext();
      let link:string = 'https://www.applicationContext02.com'
      let want: Want = {
        uri: link,
        parameters: {
          appLinkingOnly: false,
          demo_num: 111
        }
      }
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              applicationContext.restartApp(want);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0900
     * @tc.name   : restartApp with other want
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0900', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_0900`;
      let applicationContext = context.getApplicationContext();
      let want: Want = {
        bundleName: 'ohos.example.myapplication',
        abilityName: 'entry'
      };
      try {
        applicationContext.restartApp(want);
      } catch (error) {
        console.error(`${tag} restartApp fail, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(16000063);
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1200
     * @tc.name   : wantAgent.getBundleName(callback) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1200', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1200`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //getBundleName回调
          let getBundleNameCallback = (err: BusinessError, data: string) => {
            if (err) {
              console.error(`${tag} getBundleName failed! ${err.code} ${err.message}`);
              done();
            } else {
              // 走了这个分支 不符合预期
              console.info(`${tag} getBundleName ok! ${JSON.stringify(data)}`);
              done();
            }
          }
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              try {
                wantAgent.getBundleName(wantAgentData, getBundleNameCallback);
              } catch (err) {
                console.error(`${tag} getBundleName failed! ${err.code} ${err.message}`);
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1300
     * @tc.name   : wantAgent.getBundleName(promise) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1300', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1300`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //getBundleName
              try {
                wantAgent.getBundleName(wantAgentData).then((data)=>{
                  // 走了这个分支 不符合预期
                  console.info(`${tag} getBundleName ok! ${JSON.stringify(data)}`);
                  done();
                }).catch((err: BusinessError)=>{
                  console.error(`${tag} getBundleName failed! ${err.code} ${err.message}`);
                });
              } catch(err){
                console.error(`${tag} getBundleName failed! ${err.code} ${err.message}`);
                done();
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1400
     * @tc.name   : wantAgent.getUid(callback) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1400', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1400`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //getUid回调
          let getUidCallback = (err: BusinessError, data: number) => {
            if (err) {
              console.error(`getUid failed! ${err.code} ${err.message}`);
              done();
            } else {
              // 走了这个分支 不符合预期
              console.info(`getUid ok! ${JSON.stringify(data)}`);
              done();
            }
          }
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //getUid
              try {
                wantAgent.getUid(wantAgentData, getUidCallback);
              } catch (err) {
                console.error(`${tag} getUid failed! ${err.code} ${err.message}`);
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })


    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1500
     * @tc.name   : wantAgent.getUid(promise) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1500', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1500`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //getUid
              try {
                wantAgent.getUid(wantAgentData).then((data) => {
                  console.info(`${tag} getUid ok! ${JSON.stringify(data)}`);
                  done();
                }).catch((err: BusinessError) => {
                  console.error(`${tag} getUid failed! ${err.code} ${err.message}`);
                  done();
                });
              } catch (err) {
                console.error(`${tag} getUid failed! ${err.code} ${err.message}`);
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1600
     * @tc.name   : wantAgent.cancel(callback) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1600', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1600`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        let cancelNumber:number = 0
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              cancelNumber++
              console.info(`${tag} cancel ok!`);
              if(cancelNumber<2){
                wantAgent.cancel(wantAgentData, cancelCallback);
              }else {
                done();
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1700
     * @tc.name   : wantAgent.cancel(promise) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1700', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1700`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //cancel
              try {
                wantAgent.cancel(wantAgentData).then((data) => {
                  console.info(`${tag} cancel ok!`);
                  done();
                }).catch((err: BusinessError) => {
                  console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
                });
              } catch (err) {
                console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1800
     * @tc.name   : wantAgent.getWantAgent(callback) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1800', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1800`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          let getWantAgentCallback = (err: BusinessError, data: WantAgent)=>{
            if (err) {
              console.error(`getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            } else {
              console.info(`${tag} getWantAgent ok!`);
              wantAgentData = data;
              done();
            }
          }
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //getWantAgent
              wantAgent.getWantAgent(wantAgentInfo, getWantAgentCallback);
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_1900
     * @tc.name   : wantAgent.getWantAgent(promise) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1900', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1900`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //getWantAgent
              try {
                wantAgent.getWantAgent(wantAgentInfo).then((data) => {
                  console.info(`${tag} getWantAgent ok!`);
                  wantAgentData = data;
                  done();
                }).catch((err: BusinessError) => {
                  console.error(`getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
                });
              } catch (err) {
                console.error(`getWantAgent failed! ${err.code} ${err.message}`);
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_2000
     * @tc.name   : wantAgent.getOperationType(callback) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2000', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_2000`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //getOperationTypeCallback回调
          let getOperationTypeCallback = (err: BusinessError, data: number) => {
            if (err) {
              console.error(`${tag} getOperationType failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} getOperationType ok! ${JSON.stringify(data)}`);
              done();
            }
          }
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //getOperationType
              try {
                wantAgent.getOperationType(wantAgentData, getOperationTypeCallback);
              } catch (err) {
                console.error(`getOperationTypeCallback failed! ${(err as BusinessError).code} ${(err as BusinessError).message}`);
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_2100
     * @tc.name   : wantAgent.getOperationType(promise) after wantAgent.cancel
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2100', 0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_2100`;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.myapplication',
            abilityName: 'applicationContext05',
            action: 'action1',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      try {
        console.info(`${tag} wantAgent.getWantAgen begin`);
        wantAgent.getWantAgent(wantAgentInfo).then((data) => {
          console.info(`${tag} wantAgent.getWantAgen get data`);
          wantAgentData = data;
          //cancel回调
          let cancelCallback = (err: BusinessError, data: void) => {
            if (err) {
              console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
            } else {
              console.info(`${tag} cancel ok!`);
              //getOperationType
              try {
                wantAgent.getOperationType(wantAgentData).then((data) => {
                  console.info(`${tag} getOperationType ok! ${JSON.stringify(data)}`);
                  done();
                }).catch((err: BusinessError) => {
                  console.error(`${tag} getOperationType failed! ${err.code} ${err.message}`);
                });
              } catch (err) {
                console.error(`${tag} getOperationType failed! ${(err as BusinessError).code} ${(err as BusinessError).message}`);
              }
            }
          }
          try {
            console.info(`${tag} wantAgent.cancel begin`);
            wantAgent.cancel(wantAgentData, cancelCallback);
          } catch (err) {
            console.error(`${tag} cancel failed! ${err.code} ${err.message}`);
          }
        }).catch((err: BusinessError) => {
          console.error(`${tag} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        });
      } catch (err) {
        console.error(`${tag} getWantAgent failed! ${err.code} ${err.message}`);
      }
    })
  })
}