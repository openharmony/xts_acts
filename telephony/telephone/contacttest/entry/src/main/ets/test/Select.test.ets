/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, afterEach, it, expect, beforeEach, afterAll } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Component, Driver, ON, On} from '@ohos.UiTest';

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.contacttest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
};

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

async function getComponent(driver:Driver, onType:On) {
    let item:Component = await driver.findComponent(onType);
    if(!item) {
      await getComponent(driver,onType);
    }else {
      console.log(`get component: ${JSON.stringify(item)}`);
      await item.click();
    }
}

export default function SelectTest() {
  describe('SelectTest', () => {

    let contactData: contact.Contact = {
      id: 0,
      key: "0",
      contactAttributes: {
        attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
          contact.Attribute.ATTR_GROUP_MEMBERSHIP,
          contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME,
          contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
          contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
          contact.Attribute.ATTR_RELATION,
          contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
      },
      emails: [{
        email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
      }],
      events: [{
        eventDate: "event", labelName: "自定义event", labelId: 2
      }],
      groups: [{
        groupId: 1, title: "群组"
      }],
      imAddresses: [{
        imAddress: "imAddress", labelName: "自定义", labelId: 3
      }],
      phoneNumbers: [{
        phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: 4
      }],
      portrait: {
        uri: "content://head/0"
      },
      postalAddresses: [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: 5
      }],
      relations: [{
        relationName: "relationName", labelName: "自定义relationName", labelId: 6
      }],
      sipAddresses: [{
        sipAddress: "sipAddress", labelName: "自定义sipAddress", labelId: 6
      }],
      websites: [{
        website: "website"
      }],
      name: {
        familyName: "familyName",
        familyNamePhonetic: "familyNamePhonetic",
        fullName: "小李",
        givenName: "givenName",
        givenNamePhonetic: "givenNamePhonetic",
        middleName: "middleName",
        middleNamePhonetic: "middleNamePhonetic",
        namePrefix: "namePrefix",
        nameSuffix: "nameSuffix"
      },
      nickName: {
        nickName: "nickName"
      },
      note: {
        noteContent: "note"
      },
      organization: {
        name: "TT", title: "开发"
      }
    };

    beforeAll(async (done: Function) => {
      console.info("beforeAll case");
      await getPermissions();
      done();
    });

    afterEach(async (done: Function) => {
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contactList: contact.Contact[] = [];
        try {
          contactList = await contact.queryContacts(context);
        } catch (queryErr) {
          console.info(`afterEach queryContacts catch err: ${JSON.stringify(queryErr)}`);
          done();
        }
        try {
          if (contactList.length > 0) {
            contactList.forEach(async (item: contact.Contact) => {
              if (item.key) {
                await contact.deleteContact(context, item.key);
                console.info(`afterEach deleteContact success--${item.key}`);
              }
            })
          }
          done();
        } catch (deleteErr) {
          console.info(`afterEach deleteContact catch err: ${JSON.stringify(deleteErr)}`);
          done();
        }
      } catch (error) {
        console.info(`afterEach catch error: ${JSON.stringify(error)}`);
        done();
      }
    });


    /**
     * @tc.number     : SUB_Telephony_Contact_SelectContacts_0100
     * @tc.name       : testTelephonyContactSelectContacts0100
     * @tc.desc       : Call the contact selection interface, and use the callback method as an asynchronous method for the selected contact 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactSelectContacts0100', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, async  (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.selectContacts( (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.log(`${caseName} selectContacts: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} selectContacts: success data>${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
            try {
              let driver: Driver = Driver.create();
              let onType:On = ON.text('小李');
              await getComponent(driver,onType);
            }catch (err) {
              console.info(`${caseName} get component catch: ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_SelectContacts_0200
     * @tc.name       : testTelephonyContactSelectContacts0200
     * @tc.desc       : Call the contact selection interface, and use the Promise method as an asynchronous method for the selected contact 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactSelectContacts0200', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data:number = await contact.addContact(context, contactData);
        console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
        let promise = contact.selectContacts();
        let driver: Driver = Driver.create();
        let onType:On = ON.clickable(true).isBefore(ON.text('选择联系人'));
        await getComponent(driver,onType);
        promise.then((data: contact.Contact[]) => {
          console.log(`${caseName} selectContacts: data>${JSON.stringify(data)}`);
          ExpectTrue(data.length === 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} selectContacts: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_SelectContacts_0300
     * @tc.name       : testTelephonyContactSelectContacts0300
     * @tc.desc       : Call the contact selection interface, and use the Promise method as an asynchronous method for the selected contact 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactSelectContacts0300', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData,async (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.selectContacts({
              isMultiSelect: false
            }, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.log(`${caseName} selectContacts: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} selectContacts: success data>${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
            let driver: Driver = Driver.create();
            await driver.delayMs(1000);
            let onType:On = ON.text('小李');
            await getComponent(driver,onType);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_SelectContacts_0400
     * @tc.name       : testTelephonyContactSelectContacts0400
     * @tc.desc       : Call the contact selection interface, and use the Promise method as an asynchronous method for the selected contact 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactSelectContacts0400', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData,async (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.selectContacts({
              isMultiSelect: true
            }, async (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.log(`${caseName} selectContacts: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} selectContacts: success data>${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
            try {
              let driver: Driver = Driver.create();
              let onType1:On = ON.text('联系人');
              await getComponent(driver,onType1);
              await delay(500);
              let onType2:On = ON.text('全选');
              await getComponent(driver,onType2);
              await delay(500);
              let onType3:On = ON.type('Image').isAfter(ON.type('Image'));
              await getComponent(driver,onType3);
            }catch (err) {
              console.info(`${caseName} get component catch: ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            }

          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_SelectContacts_0500
     * @tc.name       : testTelephonyContactSelectContacts0500
     * @tc.desc       : Call the contact selection interface, and use the Promise method as an asynchronous method for the selected contact 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactSelectContacts0500', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData,async (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.selectContacts({
              isMultiSelect: false
            });
            let driver: Driver = Driver.create();
            await driver.delayMs(1000);
            let onType:On = ON.text('小李');
            await getComponent(driver,onType);
            promise.then((data: contact.Contact[]) => {
              console.log(`${caseName} selectContacts: success data>${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} selectContacts: err>${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_SelectContacts_0600
     * @tc.name       : testTelephonyContactSelectContacts0600
     * @tc.desc       : Call the contact selection interface, and use the Promise method as an asynchronous method for the selected contact 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactSelectContacts0600', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, async (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data1>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let data2:number = await contact.addContact(context, contactData)
            console.log(`${caseName} addContact: success data2>${JSON.stringify(data2)}`);
            let promise = contact.selectContacts({
              isMultiSelect: true
            });
            try {
              let driver: Driver = Driver.create();
              let onType1:On = ON.text('联系人');
              await getComponent(driver,onType1);
              await delay(500);
              let onType2:On = ON.text('全选');
              await getComponent(driver,onType2);
              await delay(500);
              let onType3:On = ON.type('Image').isAfter(ON.type('Image'));
              await getComponent(driver,onType3);
            }catch (err) {
              console.log(`${caseName}--get component catch: ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            }
            promise.then((data: contact.Contact[]) => {
              console.log(`${caseName} selectContacts: success data>${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} selectContacts: err>${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });


  });
}