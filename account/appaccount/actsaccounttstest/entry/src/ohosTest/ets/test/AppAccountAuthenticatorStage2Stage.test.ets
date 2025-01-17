/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import account from '@ohos.account.appAccount'
import Want from '@ohos.app.ability.Want';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest'

const name = 'zhangsan'
const owner_stage = 'com.acts.accountauthenticator'

let driver = Driver.create();

export default function AppAccountAuthenticatorStage2Stage() {
  describe('AppAccountAuthenticatorStage2Stage', () => {

    beforeAll(async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage beforeAll start====");
      let wantInfo: Want = {
        deviceId: "",
        bundleName: "com.acts.accountauthenticator",
        abilityName: "com.acts.accountauthenticator.MainAbility",
        action: "action1",
        parameters: {},
      }
      try {
        await globalThis.abilityContext.startAbility(wantInfo);
      } catch (err) {
        console.info("====>startAbility err:" + JSON.stringify(err));
      }
      await driver.delayMs(500);
      try {
        let allowed = await driver.findComponent(ON.text("允许"));
        let allowed1 = await driver.findComponent(ON.text("本次允许"));
        if (allowed != undefined && allowed != null) {
          await allowed.click();
          console.info("====>beforeAll click allowed");
        } else if (allowed1 != undefined && allowed1 != null) {
          await allowed1.click();
          console.info("====>beforeAll click allowed1");
        }
      } catch (err) {
        console.info("====>click button err:" + JSON.stringify(err));
      }
      done();
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0100
    * @tc.name      : test createAccountImplicitly callback without options
    * @tc.desc      : createAccountImplicitly
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0100', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0100 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start createAccountImplicitly");
      appAccountManager.createAccountImplicitly(owner_stage, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0100 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0100 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData.account != undefined) {
              expect(resultData.account.name).assertEqual("createNewAccountName");
              expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0100 onRequestContinued");
        }
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0200
    * @tc.name      : test createAccountImplicitly callback with options
    * @tc.desc      : createAccountImplicitly
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0200', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          "age": "18"
        }
      };
      console.info("====>start createAccountImplicitly");
      appAccountManager.createAccountImplicitly(owner_stage, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0200 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0200 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData.account != undefined) {
              expect(resultData.account.name).assertEqual("createNewAccountName");
              expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0200 onRequestContinued");
        }
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0300
    * @tc.name      : test auth callback without options
    * @tc.desc      : auth
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0300', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0300 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start auth");
      appAccountManager.auth("0300", owner_stage, "getSocialData", {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0300 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0300 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData.account && resultData.tokenInfo) {
              expect(resultData.account.name).assertEqual("0300");
              expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
              expect(resultData.tokenInfo.authType).assertEqual("getSocialData");
              expect(resultData.tokenInfo.token).assertEqual("xxxxxxxxx");
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0300 onRequestContinued");
        }
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0400
    * @tc.name      : test auth callback with options
    * @tc.desc      : auth
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0400', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info("====>start auth");
      appAccountManager.auth("0400", owner_stage, "getSocialData", options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0400 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0400 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData.account && resultData.tokenInfo) {
              expect(resultData.account.name).assertEqual("0400");
              expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
              expect(resultData.tokenInfo.authType).assertEqual("getSocialData");
              expect(resultData.tokenInfo.token).assertEqual("xxxxxxxxx");
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0400 onRequestContinued");
        }
      });
    });


    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0500
    * @tc.name      : test auth callback with options
    * @tc.desc      : ActsAccountCheckAccountLabels
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0500', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0500 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start verifyCredential");
      appAccountManager.verifyCredential(name, owner_stage, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0500 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0500 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData != undefined) {
              expect(resultData["booleanResult"]).assertEqual(false)
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0500 verifyCredential_onRequestContinued");
        }
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0600
    * @tc.name      : test auth callback with options
    * @tc.desc      : ActsAccountCheckAccountLabels
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0600', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456"
      };
      console.info("====>start verifyCredential");
      appAccountManager.verifyCredential(name, owner_stage, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0600 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0600 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData != undefined) {
              expect(resultData["booleanResult"]).assertEqual(true)
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0600 verifyCredential_onRequestContinued");
        }
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0700
    * @tc.name      : test setAuthenticatorProperties callback without options
    * @tc.desc      : setAuthenticatorProperties
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0700', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0700 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner_stage, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0700 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0700 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(10016);
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0700 verifyCredential_onRequestContinued");
        }
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0800
    * @tc.name      : test setAuthenticatorProperties callback with options
    * @tc.desc      : setAuthenticatorProperties
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0800', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties : { prop1 : "value1", prop2 : "value2"}
      };
      console.info("====>start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner_stage, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0800 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0800 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(10016);
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0800 verifyCredential_onRequestContinued");
        }
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_0900
    * @tc.name      : test checkAccountLabels callback with options
    * @tc.desc      : checkAccountLabels
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_0900', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0900 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start checkAccountLabels");
      appAccountManager.checkAccountLabels(name, owner_stage, ['level4'], (err, data) => {
        console.info("====>AppAccountAuthenticatorStage2Stage_0900 err:" + JSON.stringify(err));
        console.info("====>AppAccountAuthenticatorStage2Stage_0900 data:" + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
          expect(data).assertTrue();
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_1000
    * @tc.name      : test checkAccountLabels promise with options
    * @tc.desc      : checkAccountLabels
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_1000', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1000 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        console.info("====>start checkAccountLabels");
        let ret = await appAccountManager.checkAccountLabels(name, owner_stage, ['20-30'])
        console.info("====>AppAccountAuthenticatorStage2Stage_1000 ret:" + JSON.stringify(ret));
        expect(ret).assertFalse();
        done();
      } catch (err) {
        console.info("====>AppAccountAuthenticatorStage2Stage_1000 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_1100
    * @tc.name      : test selectAccountsByOptions callback with allowedOwners
    * @tc.desc      : selectAccountsByOptions
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_1100', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1100 start====");
      let select_options: account.SelectAccountsOptions = {
        allowedOwners:[owner_stage]
      };
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start selectAccountsByOptions");
      appAccountManager.selectAccountsByOptions(select_options, (err, data) => {
        console.info("====>AppAccountAuthenticatorStage2Stage_1100 err:" + JSON.stringify(err));
        console.info("====>AppAccountAuthenticatorStage2Stage_1100 data:" + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
          expect(data.length).assertEqual(3);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_1200
    * @tc.name      : test selectAccountsByOptions promise with requiredLabels
    * @tc.desc      : selectAccountsByOptions
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_1200', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1200 start====");
      let select_options: account.SelectAccountsOptions = {
        requiredLabels: ["male", "30-40"]
      };
      let appAccountManager = account.createAppAccountManager();
      try {
        console.info("====>start selectAccountsByOptions");
        let ret = await appAccountManager.selectAccountsByOptions(select_options)
        console.info("====>AppAccountAuthenticatorStage2Stage_1200 ret:" + JSON.stringify(ret));
        expect(ret[0].name).assertEqual("zhangsan");
        expect(ret[0].owner).assertEqual("com.acts.accountauthenticator");
        done();
      } catch (err) {
        console.info("====>AppAccountAuthenticatorStage2Stage_1200 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_1300
    * @tc.name      : test queryAuthenticatorInfo callback
    * @tc.desc      : queryAuthenticatorInfo
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_1300', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1300 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start queryAuthenticatorInfo");
      appAccountManager.queryAuthenticatorInfo(owner_stage, (err, data) => {
        console.info("====>AppAccountAuthenticatorStage2Stage_1300 err:" + JSON.stringify(err));
        console.info("====>AppAccountAuthenticatorStage2Stage_1300 data:" + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
          expect(data.owner).assertEqual("com.acts.accountauthenticator");
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountAuthenticatorStage2Stage_1400
    * @tc.name      : test queryAuthenticatorInfo promise
    * @tc.desc      : queryAuthenticatorInfo
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountAuthenticatorStage2Stage_1400', 0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1400 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        console.info("====>start queryAuthenticatorInfo");
        let ret = await appAccountManager.queryAuthenticatorInfo(owner_stage)
        console.info("====>AppAccountAuthenticatorStage2Stage_1400 ret:" + JSON.stringify(ret));
        expect(ret.owner).assertEqual("com.acts.accountauthenticator");
        done();
      } catch (err) {
        console.info("====>AppAccountAuthenticatorStage2Stage_1400 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        done();
      }
    });
  })
}