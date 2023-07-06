/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import appAccount from '@ohos.account.appAccount';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsAALoginPlugin() {
  describe('ActsAALoginPlugin', function () {

    async function sleep(delay) {
      let timeoutId = null;
      var promise = new Promise((resolve, reject) => {
        timeoutId = setTimeout(() => resolve("done!"), delay);
      })
      await promise
      clearTimeout(timeoutId)
    }

    class TestErrorAuthProvider extends appAccount.AuthorizationProvider {
      constructor() {
        super({
          bundleName: "", abilityName: ""
        })
      }
    }

    class TestAuthRequest extends appAccount.AccountCapabilityRequest {
      readonly testKey: string
      testKey1: string
      constructor(provider) {
        super(provider)
        this.testKey = "test_testkey";
      }
    }

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_0900
    * @tc.name      : executeRequest callback test_0100
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_0900', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_0900 start====");
      try {
        let request = null;
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request, (err, data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_0900 err====");
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_0900 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_0900 end====");
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1000
    * @tc.name      : executeRequest promise test_0100
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1000', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1000 start====");
      try {
        let request = null;
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request).then(async (data) => {
          expect().assertFail();
          await sleep(200)
          done();
        }).catch(async (err) => {
          expect().assertFail();
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1000 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1000 end====");
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1100
    * @tc.name      : executeRequest callback test_0200
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1100', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1100 start====");
      try {
        let request = undefined;
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request, async (err, data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1100 err====");
          expect().assertFail();
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1100 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1100 end====");
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1200
    * @tc.name      : executeRequest promise test_0200
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1200', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1200 start====");
      try {
        let request = undefined;
        let scheduler = new appAccount.AccountCapabilityScheduler();
        await scheduler.executeRequest(request).then(async (data) => {
          expect().assertFail();
          await sleep(200)
          done();
        }).catch(async (err) => {
          expect().assertFail();
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1200 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1200 end====");
        await sleep(200)
        done()
      }
    })

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1300
    * @tc.name      : executeRequest callback test_0300
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1300', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1300 start====");
      try {
        let testProvider = new appAccount.AccountCapabilityProvider(1)
        let request = new appAccount.AccountCapabilityRequest(testProvider);
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request, async (err, data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1300 err====");
          expect().assertFail();
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1300 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1300 end====");
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1400
    * @tc.name      : executeRequest promise test_0300
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1400', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1400 start====");
      try {
        let testProvider = new appAccount.AccountCapabilityProvider(1)
        let request = new appAccount.AccountCapabilityRequest(testProvider);
        let scheduler = new appAccount.AccountCapabilityScheduler();
        await scheduler.executeRequest(request).then(async (data) => {
          expect().assertFail();
          await sleep(200)
          done();
        }).catch(async (err) => {
          expect().assertFail();
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1400 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1400 end====");
        await sleep(200)
        done()
      }
    })

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1500
    * @tc.name      : executeRequest callback test_0400
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1500', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1500 start====");
      try {
        let testProvider = new appAccount.AccountCapabilityProvider(1)
        let request = new TestAuthRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request, async (err, data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1500 err====");
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1500 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1500 end====");
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1600
    * @tc.name      : executeRequest promise test_0400
    * @tc.desc      : err.code = 401
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1600', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1600 start====");
      try {
        let testProvider = new appAccount.AccountCapabilityProvider(1)
        let request = new TestAuthRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        await scheduler.executeRequest(request).then(async (data) => {
          expect().assertFail();
          done();
        }).catch(async (err) => {
          expect().assertFail();
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1600 exception: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1600 end====");
        await sleep(200)
        done()
      }
    })

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1700
    * @tc.name      : executeRequest callback test_0100
    * @tc.desc      : err = 12300002, 2 provider 1 request
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1700', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1500 start====");
      try {
        let testProvider = new appAccount.AuthorizationProvider({
          bundleName: "com", abilityName: "Auth"
        })
        let request = new appAccount.AccountCapabilityRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request, async (err, data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1700 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1700 end====");
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1700 err====");
        expect().assertFail();
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1600
    * @tc.name      : executeRequest promise test_0100
    * @tc.desc      : err = 12300002, 2 provider 1 request
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1800', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1800 start====");
      try {
        let testProvider = new appAccount.AuthorizationProvider({
          bundleName: "com", abilityName: "Auth"
        })
        let request = new appAccount.AccountCapabilityRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        await scheduler.executeRequest(request).then(async (data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1800 run err====");
          expect().assertFail();
          done();
        }).catch(async (err) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1800 end====");
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1800 exception: " + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done()
      }
    })

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1900
    * @tc.name      : executeRequest callback test_0200
    * @tc.desc      : err = 12300002, errData 2 provider 2 request
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1900', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1900 start====");
      try {
        let testProvider = new appAccount.AuthorizationProvider({
          bundleName: "com", abilityName: "Auth"
        })
        let request = new TestAuthRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request, async (err, data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1900 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1900 end====");
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1900 exception: " + JSON.stringify(err));
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_1900 err====");
        expect().assertFail();
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000
    * @tc.name      : executeRequest promise test_0200
    * @tc.desc      : err = 12300002, errData 2 provider 2 request
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000 start====");
      try {
        let testProvider = new TestErrorAuthProvider()
        let request = new TestAuthRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        await scheduler.executeRequest(request).then(async (data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000 run err====");
          expect().assertFail();
          done();
        }).catch(async (err) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000 end====");
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000 exception: " + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done()
      }
    })

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2100
    * @tc.name      : executeRequest callback test_0300
    * @tc.desc      : err = 12300002, errData 3 provider 2 request
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2100', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2100 start====");
      try {
        let testProvider = new TestErrorAuthProvider()
        let request = new TestAuthRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        scheduler.executeRequest(request, async (err, data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2100 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2100 end====");
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2100 exception: " + JSON.stringify(err));
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2100 err====");
        expect().assertFail();
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2200
    * @tc.name      : executeRequest promise test_0300
    * @tc.desc      : err = 12300002, errData 3 provider 2 request
    */
    it('SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2200', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2200 start====");
      try {
        let testProvider = new TestErrorAuthProvider()
        let request = new TestAuthRequest(testProvider)
        let scheduler = new appAccount.AccountCapabilityScheduler();
        await scheduler.executeRequest(request).then(async (data) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2000 run err====");
          expect().assertFail();
          done();
        }).catch(async (err) => {
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2200 end====");
          await sleep(200)
          done();
        });
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_ExecuteRequest_2200 exception: " + JSON.stringify(err));
        expect().assertFail();
        await sleep(200)
        done()
      }
    })
	
	/*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100
    * @tc.name      : ExtensionAbility Attribute verification test_0100
    * @tc.desc      : capabilityType & request
    */
    it('SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100 start====");
      try {
        let capabilityType = appAccount.AccountCapabilityType.AUTHORIZATION
        let testProvider = new appAccount.AccountCapabilityProvider(capabilityType)
        let request = new TestAuthRequest(testProvider)
        let testResponse = new appAccount.AccountCapabilityResponse(request)
        let result_1 = (testProvider instanceof appAccount.AccountCapabilityProvider)
        let result_2 = (testResponse instanceof appAccount.AccountCapabilityResponse)
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100 testProvider result: " + JSON.stringify(result_1));
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100 testResponse result: " + JSON.stringify(result_2));
        expect(result_1).assertTrue()
        expect(result_2).assertTrue()
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100 end====");
        await sleep(200)
        done();
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100 exception: " + JSON.stringify(err));
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_EXTENSION_ABILITY_0100 err====");
        expect().assertFail();
        await sleep(200)
        done()
      }
    });

    /*
    * @tc.number    : SUB_ACCOUNT_APPACCOUNT_Enum_AccountCapabilityType_0100
    * @tc.name      : AccountCapabilityType test_0100
    * @tc.desc      : Enum
    */
    it('SUB_ACCOUNT_APPACCOUNT_Enum_AccountCapabilityType_0100', 0, async function (done) {
      console.debug("====>SUB_ACCOUNT_APPACCOUNT_Enum_AccountCapabilityType_0100 start====");
      try {
        console.debug("====>Enum AccountCapabilityType.AUTHORIZATION : " + JSON.stringify(appAccount.AccountCapabilityType.AUTHORIZATION));
        expect(1).assertEqual(appAccount.AccountCapabilityType.AUTHORIZATION)
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_Enum_AccountCapabilityType_0100 end====");
        await sleep(200)
        done();
      } catch (err) {
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_Enum_AccountCapabilityType_0100 exception: " + JSON.stringify(err));
        console.debug("====>SUB_ACCOUNT_APPACCOUNT_Enum_AccountCapabilityType_0100 err====");
        await sleep(200)
        done()
      }
    })
  })
}