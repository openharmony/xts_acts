/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsAppAccountOptionalParameterTest() {
  describe('ActsAppAccountOptionalParameterTest', function () {
    const name = 'zhangsan'
    const owner = 'com.example.accounttstest'

    async function sleep(delay) {
      let timeoutId = null;
      var promise = new Promise((resolve, reject) => {
        timeoutId = setTimeout(() => resolve("done!"), delay);
      });
      await promise
      clearTimeout(timeoutId)
    }

    /*
    * @tc.number    : ActsAccountOptionalParameter_0100
    * @tc.name      : createAccount callback form
    * @tc.desc      : createAccount in callback form without optional information
    */
    it('ActsAccountOptionalParameter_0100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0100 start====");
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>create finish====");
      appAccountManager.createAccount(name, (err) => {
        console.debug("====>createAccount ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(name, async (err) => {
          console.debug("====>delete Account ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.debug("====>ActsAccountOptionalParameter_0100 end====");
          await sleep(200)
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0200
    * @tc.name      : createAccount promise form
    * @tc.desc      : createAccount in promise form without optional information
    */
    it('ActsAccountOptionalParameter_0200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0200 start====");
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      console.debug("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done();
      }
      console.debug("====>delete account start====");
      await appAccountManager.removeAccount(name);
      console.debug("====>ActsAccountOptionalParameter_0200 end====");
      await sleep(200)
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0300
    * @tc.name      : createAccount promise form
    * @tc.desc      : undefined callback
    */
    it('ActsAccountOptionalParameter_0300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0300 start====");
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      appAccountManager.createAccount(name, undefined, (err) => {
        console.debug("====>createAccount ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(name, async (err) => {
          console.debug("====>delete Account ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.debug("====>ActsAccountOptionalParameter_0300 end====");
          await sleep(200)
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0400
    * @tc.name      : createAccount promise form
    * @tc.desc      : undefined Promise
    */
    it('ActsAccountOptionalParameter_0400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0400 start====");
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      console.debug("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name, undefined);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done();
      }
      console.debug("====>delete account start====");
      await appAccountManager.removeAccount(name);
      console.debug("====>ActsAccountOptionalParameter_0400 end====");
      await sleep(200)
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0500
    * @tc.name      : createAccount promise form
    * @tc.desc      : null callback
    */
    it('ActsAccountOptionalParameter_0500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0500 start====");
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      appAccountManager.createAccount(name, null, (err) => {
        console.debug("====>createAccount ActsAccountOptionalParameter_0500 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(name, async (err) => {
          console.debug("====>delete Account ActsAccountOptionalParameter_0500 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.debug("====>ActsAccountOptionalParameter_0500 end====");
          await sleep(200)
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0600
    * @tc.name      : createAccount promise form
    * @tc.desc      : null Promise
    */
    it('ActsAccountOptionalParameter_0600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0600 start====");
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      console.debug("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name, null);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done();
      }
      console.debug("====>delete account start====");
      await appAccountManager.removeAccount(name);
      console.debug("====>ActsAccountOptionalParameter_0600 end====");
      await sleep(200)
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0700
    * @tc.name      : createAccount callback form
    * @tc.desc      : no customData callback
    */
    it('ActsAccountOptionalParameter_0700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0700 start====");
      let createAccountOptions = {}
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_second", createAccountOptions, (err) => {
        console.debug("====>createAccount ActsAccountOptionalParameter_0700 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_second", async (err) => {
          console.debug("====>delete Account ActsAccountOptionalParameter_0700 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.debug("====>ActsAccountOptionalParameter_0700 end====");
          await sleep(200)
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0800
    * @tc.name      : createAccount promise form
    * @tc.desc      : no customData promise
    */
    it('ActsAccountOptionalParameter_0800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_0800 start====");
      let createAccountOptions = {}
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      console.debug("====>createAccount start====");
      try {
        await appAccountManager.createAccount("account_name_promise_second", createAccountOptions);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done();
      }
      console.debug("====>delete account start====");
      await appAccountManager.removeAccount("account_name_promise_second");
      console.debug("====>ActsAccountOptionalParameter_0800 end====");
      await sleep(200)
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0900
    * @tc.name      : createAccount callback form
    * @tc.desc      : customData is undefined callback
    */
    it('ActsAccountOptionalParameter_0900', 0, async function (done) {
      console.debug("====>ActsAccountCreateAccount_0300 start====");
      let createAccountOptions = {
        customData: undefined
      };
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_second", createAccountOptions, (err) => {
        console.debug("====>createAccount ActsAccountOptionalParameter_0900 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_second", async (err) => {
          console.debug("====>delete Account ActsAccountOptionalParameter_0900 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.debug("====>ActsAccountOptionalParameter_0900 end====");
          await sleep(200)
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1000
    * @tc.name      : createAccount promise form
    * @tc.desc      : customData is undefined promise
    */
    it('ActsAccountOptionalParameter_1000', 0, async function (done) {
      console.debug("====>ActsAccountCreateAccount_0400 start====");
      let createAccountOptions = {
        customData: undefined
      }
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      console.debug("====>createAccount start====");
      try {
        await appAccountManager.createAccount("account_name_promise_second", createAccountOptions);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done();
      }
      console.debug("====>delete account start====");
      await appAccountManager.removeAccount("account_name_promise_second");
      console.debug("====>ActsAccountOptionalParameter_1000 end====");
      await sleep(200)
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1100
    * @tc.name      : createAccount callback form
    * @tc.desc      : customData is null callback
    */
    it('ActsAccountOptionalParameter_1100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1100 start====");
      let createAccountOptions = {
        customData: null
      };
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_second", createAccountOptions, (err) => {
        console.debug("====>createAccount ActsAccountOptionalParameter_1100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_second", async (err) => {
          console.debug("====>delete Account ActsAccountOptionalParameter_1100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.debug("====>ActsAccountOptionalParameter_1100 end====");
          await sleep(200)
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1200
    * @tc.name      : createAccount promise form
    * @tc.desc      : customData is null promise
    */
    it('ActsAccountOptionalParameter_1200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1200 start====");
      let createAccountOptions = {
        customData: null
      }
      var appAccountManager = account.createAppAccountManager();
      console.debug("====>createAppAccountManager finish====");
      console.debug("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name, createAccountOptions);
        console.debug("====>delete account start====");
        await appAccountManager.removeAccount(name);
        console.debug("====>ActsAccountOptionalParameter_1200 end====");
        await sleep(200)
        done();
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        await appAccountManager.removeAccount(name);
        await sleep(200)
        done();
      }
      console.debug("====>ActsAccountOptionalParameter_1200 end====");
      await sleep(200)
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1300
    * @tc.name      : createAccountImplicitly no options
    * @tc.desc      : no option
    */
    it('ActsAccountOptionalParameter_1300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", {
          onResult: async (resultCode) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_1300 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_1300 end====");
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_1300 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_1300 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_1300 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_1300 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1400
    * @tc.name      : createAccountImplicitly with options
    * @tc.desc      : with option
    */
    it('ActsAccountOptionalParameter_1400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_1400 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_1400 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_1400 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_1400 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_1400 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_1400 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1500
    * @tc.name      : createAccountImplicitly undefined options
    * @tc.desc      : undefined option
    */
    it('ActsAccountOptionalParameter_1500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", undefined, {
          onResult: async (resultCode, undefined) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_1500 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_1500 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_1500 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: undefined
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_1500 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_1500 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1600
    * @tc.name      : createAccountImplicitly null options
    * @tc.desc      : null option
    */
    it('ActsAccountOptionalParameter_1600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", null, {
          onResult: async (resultCode) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_1600 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_1600 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_1600 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: null
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_1600 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_1600 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1700
    * @tc.name      : createAccountImplicitly with empty options
    * @tc.desc      : empty option
    */
    it('ActsAccountOptionalParameter_1700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {}
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_1700 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_1700 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_1700 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_1700 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_1700 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_1700 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1800
    * @tc.name      : createAccountImplicitly with undefined options
    * @tc.desc      : undefined options
    */
    it('ActsAccountOptionalParameter_1800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: undefined, authType: undefined, parameters: undefined
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_1800 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_1800 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_1800 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_1800 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_1800 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_1800 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1900
    * @tc.name      : createAccountImplicitly with null options
    * @tc.desc      : null options
    */
    it('ActsAccountOptionalParameter_1900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_1900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: null, authType: null, parameters: null
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_1900 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_1900 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_1900 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_1900 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_1900 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_1900 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2000
    * @tc.name      : createAccountImplicitly with authType options
    * @tc.desc      : authType options
    */
    it('ActsAccountOptionalParameter_2000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        authType: "PIN"
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2000 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2000 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2000 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2000 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2000 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2000 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2100
    * @tc.name      : createAccountImplicitly with authType options
    * @tc.desc      : authType options
    */
    it('ActsAccountOptionalParameter_2100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: undefined, authType: "PIN", parameters: undefined
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2100 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2100 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2100 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2100 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2100 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2100 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2200
    * @tc.name      : createAccountImplicitly with authType options
    * @tc.desc      : authType options
    */
    it('ActsAccountOptionalParameter_2200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: null, authType: "PIN", parameters: null
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2200 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2200 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2200 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2200 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2200 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2200 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2300
    * @tc.name      : createAccountImplicitly with requiredLabels options
    * @tc.desc      : requiredLabels options
    */
    it('ActsAccountOptionalParameter_2300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40']
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2300 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2300 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2300 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2300 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2300 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2300 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2400
    * @tc.name      : createAccountImplicitly with requiredLabels options
    * @tc.desc      : requiredLabels options
    */
    it('ActsAccountOptionalParameter_2400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], authType: undefined, parameters: undefined
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2400 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2400 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2400 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2400 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2400 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2400 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2500
    * @tc.name      : createAccountImplicitly with requiredLabels options
    * @tc.desc      : requiredLabels options
    */
    it('ActsAccountOptionalParameter_2500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], authType: null, parameters: null
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2500 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2500 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2500 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2500 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2500 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2500 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2600
    * @tc.name      : createAccountImplicitly with parameters options
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_2600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2600 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2600 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2600 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2600 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2600 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2600 end====");
        expect(null).assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2700
    * @tc.name      : createAccountImplicitly with parameters options
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_2700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: undefined, authType: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2700 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2700 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2700 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2700 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2700 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2700 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2800
    * @tc.name      : createAccountImplicitly with parameters options
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_2800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: null, authType: null, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2800 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_2800 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2800 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2800 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2800 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2800 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2800 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2900
    * @tc.name      : createAccountImplicitly with authType&requiredLabels options
    * @tc.desc      : authType&requiredLabels options
    */
    it('ActsAccountOptionalParameter_2900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_2900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], authType: "PIN"
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_2900 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_2900 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_2900 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_2900 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_2900 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_2900 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_2900 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3000
    * @tc.name      : createAccountImplicitly with authType&requiredLabels options
    * @tc.desc      : authType&requiredLabels options
    */
    it('ActsAccountOptionalParameter_3000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], authType: "PIN", parameters: undefined
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3000 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_3000 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3000 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3000 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3000 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3000 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3000 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3100
    * @tc.name      : createAccountImplicitly with authType&requiredLabels options
    * @tc.desc      : authType&requiredLabels options
    */
    it('ActsAccountOptionalParameter_3100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], authType: "PIN", parameters: null
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3100 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_3100 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3100 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3100 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3100 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3100 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3100 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3200
    * @tc.name      : createAccountImplicitly with authType&parameters options
    * @tc.desc      : authType&parameters options
    */
    it('ActsAccountOptionalParameter_3200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        authType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3200 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_3200 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3200 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3200 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3200 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3200 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3200 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3300
    * @tc.name      : createAccountImplicitly with authType&parameters options
    * @tc.desc      : authType&parameters options
    */
    it('ActsAccountOptionalParameter_3300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: undefined, authType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3300 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_3300 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3300 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3300 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3300 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3300 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3300 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3400
    * @tc.name      : createAccountImplicitly with authType&parameters options
    * @tc.desc      : authType&parameters options
    */
    it('ActsAccountOptionalParameter_3400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: null, authType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3400 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.debug("====>ActsAccountOptionalParameter_3400 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3400 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3400 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3400 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3400 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3400 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3500
    * @tc.name      : createAccountImplicitly with requiredLabels&parameters options
    * @tc.desc      : requiredLabels&parameters options
    */
    it('ActsAccountOptionalParameter_3500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3500 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3500 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3500 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3500 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3500 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3500 end====");
        expect().assertFail()
        await sleep(200)
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3600
    * @tc.name      : createAccountImplicitly with requiredLabels&parameters options
    * @tc.desc      : requiredLabels&parameters options
    */
    it('ActsAccountOptionalParameter_3600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], authType: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3600 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              await sleep(200)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3600 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3600 end====");
              await sleep(200)
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3600 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3600 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3600 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3700
    * @tc.name      : createAccountImplicitly with requiredLabels&parameters options
    * @tc.desc      :
    */
    it('ActsAccountOptionalParameter_3700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ['male', '30-40'], authType: null, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3700 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3700 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3700 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: function () {
            console.debug("====>ActsAccountOptionalParameter_3700 onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3700 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3700 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3800
    * @tc.name      : auth
    * @tc.desc      : no option
    */
    it('ActsAccountOptionalParameter_3800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3800 start====");
      var appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.example.accountauthenticator", "authType", {
          onResult: (resultCode) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3800 authenticate resultCode:" + JSON.stringify(resultCode));
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3800 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3800 end====");
              done();
            }
          },
          onRequestRedirected: function () {
            console.debug("====>onRequestRedirected")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3800 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3800 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3900
    * @tc.name      : auth
    * @tc.desc      : empty option
    */
    it('ActsAccountOptionalParameter_3900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_3900 start====");
      var appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.example.accountauthenticator", "authType", {}, {
          onResult: (resultCode, resultData) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_3900 authenticate resultCode:" + JSON.stringify(resultCode));
              console.debug("====>ActsAccountOptionalParameter_3900 authenticate resultData:" + JSON.stringify(resultData));
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_3900 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_3900 end====");
              done();
            }

          },
          onRequestRedirected: function () {
            console.debug("====>onRequestRedirected")
          },
          onRequestContinued: function () {
            console.debug("====>_onRequestContinued")
          }
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_3900 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_3900 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4000
    * @tc.name      : auth
    * @tc.desc      : undefined option,
    */
    it('ActsAccountOptionalParameter_4000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4000 start====");
      var appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.example.accountauthenticator", "authType", undefined, {
          onResult: (resultCode, undefined) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_4000 authenticate resultCode:" + JSON.stringify(resultCode));
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_4000 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_4000 end====");
              done();
            }
          },
          onRequestRedirected: function () {
            console.debug("====>onRequestRedirected")
          },
          onRequestContinued: undefined
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_4000 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_4000 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4100
    * @tc.name      : auth
    * @tc.desc      : null option
    */
    it('ActsAccountOptionalParameter_4100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4100 start====");
      var appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.example.accountauthenticator", "authType", null, {
          onResult: (resultCode) => {
            try {
              console.debug("====>ActsAccountOptionalParameter_4100 authenticate resultCode:" + JSON.stringify(resultCode));
              done();
            } catch (err) {
              console.debug("====>ActsAccountOptionalParameter_4100 err:" + JSON.stringify(err));
              console.debug("====>ActsAccountOptionalParameter_4100 end====");
              done();
            }
          },
          onRequestRedirected: function () {
            console.debug("====>onRequestRedirected")
          },
          onRequestContinued: null
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_4100 err:" + JSON.stringify(err));
        console.debug("====>ActsAccountOptionalParameter_4100 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4200
    * @tc.name      : verifyCredential
    * @tc.desc      : no option
    */
    it('ActsAccountOptionalParameter_4200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      try {
        appAccountManager.createAccount(name, (err) => {
          console.debug("====>ActsAccountOptionalParameter_4200 add_account_err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          appAccountManager.verifyCredential(name, owner, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4200 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        });
      } catch (err) {
        console.debug("====>ActsAccountOptionalParameter_4200 err:" + JSON.stringify(err));
        await appAccountManager.removeAccount(name);
        expect().assertFail()
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4300
    * @tc.name      : verifyCredential
    * @tc.desc      : with full option
    */
    it('ActsAccountOptionalParameter_4300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_4300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4300 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                console.debug("====>ActsAccountOptionalParameter_4300 verifyCredential_resultData:" + JSON.stringify(resultData));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4300 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_4300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4400
    * @tc.name      : verifyCredential
    * @tc.desc      : undefined option
    */
    it('ActsAccountOptionalParameter_4400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_4400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', undefined, {
            onResult: async (resultCode, undefined) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4400 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4400 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null,
            onRequestContinued: undefined
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_4400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4500
    * @tc.name      : verifyCredential
    * @tc.desc      : null option
    */
    it('ActsAccountOptionalParameter_4500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_4500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', null, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4500 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4500 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null,
            onRequestContinued: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_4500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4600
    * @tc.name      : verifyCredential
    * @tc.desc      : empty option
    */
    it('ActsAccountOptionalParameter_4600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {}
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_4600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4600 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4600 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_4600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4700
    * @tc.name      : verifyCredential
    * @tc.desc      : undefined options
    */
    it('ActsAccountOptionalParameter_4700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: undefined, credential: undefined, parameters: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_4700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4700 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4700 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_4700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4800
    * @tc.name      : verifyCredential
    * @tc.desc      : null options
    */
    it('ActsAccountOptionalParameter_4800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: null, credential: null, parameters: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_4800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4800 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4800 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_4800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4900
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType options
    */
    it('ActsAccountOptionalParameter_4900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_4900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN"
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_4900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_4900 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_4900 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_4900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_4900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5000
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType options
    */
    it('ActsAccountOptionalParameter_5000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: undefined, parameters: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5000 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5000 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5100
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType options
    */
    it('ActsAccountOptionalParameter_5100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: null, parameters: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5100 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5100 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5100 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5200
    * @tc.name      : verifyCredential
    * @tc.desc      : credential options
    */
    it('ActsAccountOptionalParameter_5200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credential: "123456"
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5200 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5200 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5300
    * @tc.name      : verifyCredential
    * @tc.desc      : credential options
    */
    it('ActsAccountOptionalParameter_5300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: undefined, credential: "123456", parameters: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5300 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5300 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5400
    * @tc.name      : verifyCredential
    * @tc.desc      : credential options
    */
    it('ActsAccountOptionalParameter_5400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: null, credential: "123456", parameters: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5400 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5400 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5500
    * @tc.name      : verifyCredential
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_5500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5500 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5500 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5600
    * @tc.name      : verifyCredential
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_5600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: undefined, credential: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5600 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5600 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5700
    * @tc.name      : verifyCredential
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_5700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: null, credential: null, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5700 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5700 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5800
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType&credential options
    */
    it('ActsAccountOptionalParameter_5800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456"
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5800 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5800 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5900
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType&credential options
    */
    it('ActsAccountOptionalParameter_5900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_5900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456", parameters: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_5900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_5900 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_5900 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_5900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_5900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6000
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType&credential options
    */
    it('ActsAccountOptionalParameter_6000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456", parameters: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6000 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6000 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6100
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType&parameters options
    */
    it('ActsAccountOptionalParameter_6100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6100 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6100 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6100 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                expect().assertFail()
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6200
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType&parameters options
    */
    it('ActsAccountOptionalParameter_6200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6200 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6200 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6300
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType&parameters options
    */
    it('ActsAccountOptionalParameter_6300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: null, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6300 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6300 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                expect().assertFail()
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6400
    * @tc.name      : verifyCredential
    * @tc.desc      : credential&parameters options
    */
    it('ActsAccountOptionalParameter_6400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6400 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6400 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6500
    * @tc.name      : verifyCredential
    * @tc.desc      : credential&parameters options
    */
    it('ActsAccountOptionalParameter_6500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: undefined, credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6500 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6500 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
            * @tc.number    : ActsAccountOptionalParameter_6600
            * @tc.name      : verifyCredential
            * @tc.desc      : credential&parameters options
            */
    it('ActsAccountOptionalParameter_6600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: null, credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6600 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6600 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6700
    * @tc.name      : verifyCredential
    * @tc.desc      : credentialType&credential options
    */
    it('ActsAccountOptionalParameter_6700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.example.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6700 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6700 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6800
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : no option
    */
    it('ActsAccountOptionalParameter_6800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": "value1"
        }, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6800 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6800 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6900
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : with option
    */
    it('ActsAccountOptionalParameter_6900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_6900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": "value1"
        }, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_6900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_6900 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_6900 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_6900 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_6900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_6900 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_6900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
            * @tc.number    : ActsAccountOptionalParameter_7000
            * @tc.name      : setAuthenticatorProperties
            * @tc.desc      : undefined option
            */
    it('ActsAccountOptionalParameter_7000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": "value1"
        }, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, undefined, {
            onResult: async (resultCode, undefined) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7000 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7000 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: undefined
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
            * @tc.number    : ActsAccountOptionalParameter_7100
            * @tc.name      : setAuthenticatorProperties
            * @tc.desc      : null option
            */
    it('ActsAccountOptionalParameter_7100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": "value1"
        }, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, null, {
            onResult: async (resultCode) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7100 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7100 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7100 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: null
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7200
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : empty option
    */
    it('ActsAccountOptionalParameter_7200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {}
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7200 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7200 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7200 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7200 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7200 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7300
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : undefined options
    */
    it('ActsAccountOptionalParameter_7300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": undefined
        }, parameters: {
          'sex': undefined
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7300 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7300 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7300 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7300 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
            * @tc.number    : ActsAccountOptionalParameter_7400
            * @tc.name      : setAuthenticatorProperties
            * @tc.desc      : null options
            */
    it('ActsAccountOptionalParameter_7400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": null
        }, parameters: {
          'sex': null
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7400 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7400 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7400 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7400 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      })
    })

    /*
            * @tc.number    : ActsAccountOptionalParameter_7500
            * @tc.name      : setAuthenticatorProperties
            * @tc.desc      : properties options
            */
    it('ActsAccountOptionalParameter_7500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": "value1"
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7500 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7500 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7500 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7500 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7600
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : properties options
    */
    it('ActsAccountOptionalParameter_7600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": "value1"
        }, parameters: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7600 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7600 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7600 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7600 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7700
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : properties options
    */
    it('ActsAccountOptionalParameter_7700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: {
          "prop1": "value1"
        }, parameters: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7700 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7700 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7700 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7700 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7800
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_7800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7800 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7800 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7800 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7800 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7900
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_7900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_7900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_7900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_7900 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_7900 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_7900 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_7900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_7900 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_7900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8000
    * @tc.name      : setAuthenticatorProperties
    * @tc.desc      : parameters options
    */
    it('ActsAccountOptionalParameter_8000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        properties: null, parameters: {
          'sex': 'male'
        }
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.debug("====>ActsAccountOptionalParameter_8000 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.debug("====>ActsAccountOptionalParameter_8000 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                console.debug("====>ActsAccountOptionalParameter_8000 success")
                done();
              } catch (err) {
                console.debug("====>ActsAccountOptionalParameter_8000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                await sleep(200)
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: function () {
              console.debug("====>ActsAccountOptionalParameter_8000 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_8000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8100
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : empty option
     */
    it('ActsAccountOptionalParameter_8100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {}
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        try {
          console.debug("====>ActsAccountOptionalParameter_8100 add_account_err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_8100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            await sleep(200)
            console.debug("====>ActsAccountOptionalParameter_8100 success")
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_8100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8200
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : empty option
    */
    it('ActsAccountOptionalParameter_8200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {}
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            await sleep(200)
            console.debug("====>ActsAccountOptionalParameter_8200 success")
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8300
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : with option
     */
    it('ActsAccountOptionalParameter_8300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_8300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            await sleep(200)
            console.debug("====>ActsAccountOptionalParameter_8300 success")
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_8300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8400
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : with option
    */
    it('ActsAccountOptionalParameter_8400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            await sleep(200)
            console.debug("====>ActsAccountOptionalParameter_8400 success")
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8500
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : undefined options
     */
    it('ActsAccountOptionalParameter_8500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_8500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            await sleep(200)
            console.debug("====>ActsAccountOptionalParameter_8500 success")
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_8500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8600
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : undefined option
    */
    it('ActsAccountOptionalParameter_8600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            await sleep(200)
            console.debug("====>ActsAccountOptionalParameter_8600 success")
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8700
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : null option
     */
    it('ActsAccountOptionalParameter_8700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_8700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            await sleep(200)
            console.debug("====>ActsAccountOptionalParameter_8700 success")
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_8700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8800
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : null option
    */
    it('ActsAccountOptionalParameter_8800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_8800 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8900
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts options
     */
    it('ActsAccountOptionalParameter_8900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_8900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_8900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_8900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_8900 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_8900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9000
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts options
    */
    it('ActsAccountOptionalParameter_9000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9000 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9100
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts options
     */
    it('ActsAccountOptionalParameter_9100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_9100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9100 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_9100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9200
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts options
    */
    it('ActsAccountOptionalParameter_9200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9200 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9300
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts options
     */
    it('ActsAccountOptionalParameter_9300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_9300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9300 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_9300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9400
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts options
    */
    it('ActsAccountOptionalParameter_9400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9400 success")
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9500
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedOwners options
     */
    it('ActsAccountOptionalParameter_9500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedOwners: ["com.example.accounttstest"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_9500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9500 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_9500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9600
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedOwners options
    */
    it('ActsAccountOptionalParameter_9600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedOwners: ["com.example.accounttstest"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9600 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9700
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedOwners options
     */
    it('ActsAccountOptionalParameter_9700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_9700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9700 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_9700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9800
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedOwners options
    */
    it('ActsAccountOptionalParameter_9800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9800 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9900
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedOwners options
     */
    it('ActsAccountOptionalParameter_9900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_9900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_9900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_9900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_9900 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_9900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10000
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedOwners options
    */
    it('ActsAccountOptionalParameter_10000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10000 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10100
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : requiredLabels options
     */
    it('ActsAccountOptionalParameter_10100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_10100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10100 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_10100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10200
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : requiredLabels options
    */
    it('ActsAccountOptionalParameter_10200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10200 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10300
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : requiredLabels options
     */
    it('ActsAccountOptionalParameter_10300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_10300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10300 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_10300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10400
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : requiredLabels options
    */
    it('ActsAccountOptionalParameter_10400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10400 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10500
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : requiredLabels options
     */
    it('ActsAccountOptionalParameter_10500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_10500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10500 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_10500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10600
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : requiredLabels options
    */
    it('ActsAccountOptionalParameter_10600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10600 success")
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10700
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&allowedOwners options
     */
    it('ActsAccountOptionalParameter_10700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_10700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10700 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_10700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10800
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&allowedOwners options
    */
    it('ActsAccountOptionalParameter_10800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10800 success")
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10900
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&allowedOwners options
     */
    it('ActsAccountOptionalParameter_10900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_10900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_10900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_10900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_10900 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_10900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11000
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&allowedOwners options
    */
    it('ActsAccountOptionalParameter_11000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11000 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11100
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&allowedOwners options
     */
    it('ActsAccountOptionalParameter_11100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_11100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11100 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_11100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11200
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&allowedOwners options
    */
    it('ActsAccountOptionalParameter_11200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11200 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11300
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&requiredLabels options
     */
    it('ActsAccountOptionalParameter_11300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_11300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11300 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_11300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11400
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&requiredLabels options
    */
    it('ActsAccountOptionalParameter_11400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11400 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11500
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&requiredLabels options
     */
    it('ActsAccountOptionalParameter_11500', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11500 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_11500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11500 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_11500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11600
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&requiredLabels options
    */
    it('ActsAccountOptionalParameter_11600', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11600 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11600 success")
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11700
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&requiredLabels options
     */
    it('ActsAccountOptionalParameter_11700', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11700 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_11700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11700 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_11700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11800
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&requiredLabels options
    */
    it('ActsAccountOptionalParameter_11800', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11800 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11800 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11900
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedOwners&requiredLabels options
     */
    it('ActsAccountOptionalParameter_11900', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_11900 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_11900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_11900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_11900 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_11900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_12000
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedOwners&requiredLabels options
    */
    it('ActsAccountOptionalParameter_12000', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_12000 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_12000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_12000 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_12100
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedOwners&requiredLabels options
     */
    it('ActsAccountOptionalParameter_12100', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_12100 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_12100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_12100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_12100 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_12100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_12200
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedOwners&requiredLabels options
    */
    it('ActsAccountOptionalParameter_12200', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_12200 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_12200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_12200 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_12300
     * @tc.name      : selectAccountsByOptions callback
     * @tc.desc      : allowedOwners&requiredLabels options
     */
    it('ActsAccountOptionalParameter_12300', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_12300 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_12300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.debug("====>ActsAccountOptionalParameter_12300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_12300 success")
            await sleep(200)
            done();
          })
        } catch (err) {
          console.debug("====>ActsAccountOptionalParameter_12300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_12400
    * @tc.name      : selectAccountsByOptions promise
    * @tc.desc      : allowedOwners&requiredLabels options
    */
    it('ActsAccountOptionalParameter_12400', 0, async function (done) {
      console.debug("====>ActsAccountOptionalParameter_12400 start====");
      var appAccountManager = account.createAppAccountManager();
      var options = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.debug("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.debug("====>ActsAccountOptionalParameter_12400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.debug("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.debug("====>ActsAccountOptionalParameter_12400 success")
            await sleep(200)
            done()
          }).catch(async (err) => {
            console.debug("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            await sleep(200)
            done()
          });
        } catch (err) {
          console.debug("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          await sleep(200)
          done();
        }
      });
    });
  })
}