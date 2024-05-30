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

import { describe, beforeAll, afterEach, it, expect, beforeEach } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Driver } from '@ohos.UiTest';

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
}

export default function QueryContactTest() {
  describe('QueryContactTest', () => {

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

    let holder: contact.Holder = {
      holderId: 1,
      bundleName: "com.ohos.contacts",
      displayName: "phone"
    };

    let attr: contact.ContactAttributes = {
      attributes: [
      contact.Attribute.ATTR_CONTACT_EVENT,
      contact.Attribute.ATTR_EMAIL,
      contact.Attribute.ATTR_GROUP_MEMBERSHIP,
      contact.Attribute.ATTR_IM,
      contact.Attribute.ATTR_NAME,
      contact.Attribute.ATTR_NICKNAME,
      contact.Attribute.ATTR_NOTE,
      contact.Attribute.ATTR_ORGANIZATION,
      contact.Attribute.ATTR_PHONE,
      contact.Attribute.ATTR_PORTRAIT,
      contact.Attribute.ATTR_POSTAL_ADDRESS,
      contact.Attribute.ATTR_RELATION,
      contact.Attribute.ATTR_SIP_ADDRESS,
      contact.Attribute.ATTR_WEBSITE
      ]
    };


    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0100
     * @tc.name       : testTelephonyContactQueryContact0100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContact0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0300
     * @tc.name       : testTelephonyContactQueryContact0300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, "12333", (err: BusinessError, data: contact.Contact) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0400
     * @tc.name       : testTelephonyContactQueryContact0400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0500
     * @tc.name       : testTelephonyContactQueryContact0500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0600
     * @tc.name       : testTelephonyContactQueryContact0600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, holder, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0800
     * @tc.name       : testTelephonyContactQueryContact0800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'xxxx', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0900
     * @tc.name       : testTelephonyContactQueryContact0900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1000
     * @tc.name       : testTelephonyContactQueryContact1000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1100
     * @tc.name       : testTelephonyContactQueryContact1100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: 1.1,
                  bundleName: "",
                  displayName: ""
                }, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1200
     * @tc.name       : testTelephonyContactQueryContact1200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: -100000,
                  bundleName: "",
                  displayName: ""
                }, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1300
     * @tc.name       : testTelephonyContactQueryContact1300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1500
     * @tc.name       : testTelephonyContactQueryContact1500
     * @tc.desc       : Query the key of a contact based on their ID and use the Callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'xxx', attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1600
     * @tc.name       : testTelephonyContactQueryContact1600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1700
     * @tc.name       : testTelephonyContactQueryContact1700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1800
     * @tc.name       : testTelephonyContactQueryContact1800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, holder, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2000
     * @tc.name       : testTelephonyContactQueryContact2000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'xxxx', holder, attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2100
     * @tc.name       : testTelephonyContactQueryContact2100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', holder, attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2200
     * @tc.name       : testTelephonyContactQueryContact2200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', holder, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2300
     * @tc.name       : testTelephonyContactQueryContact2300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: 1.1,
                  bundleName: "",
                  displayName: ""
                }, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2400
     * @tc.name       : testTelephonyContactQueryContact2400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: -10000000,
                  bundleName: "",
                  displayName: ""
                }, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
                    done();
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2500
     * @tc.name       : testTelephonyContactQueryContact2500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'sdfafasfafdafasfasfasfasfasfafafafafafsaf', holder, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2600
     * @tc.name       : testTelephonyContactQueryContact2600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                let promise = contact.queryContact(context, data, holder, attr);
                promise.then((data) => {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data !== undefined);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2800
     * @tc.name       : testTelephonyContactQueryContact2800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryContact(context, 'xxxx', holder, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        });
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2900
     * @tc.name       : testTelephonyContactQueryContact2900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryContact(context, '!@#abc', holder, attr);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3000
     * @tc.name       : testTelephonyContactQueryContact3000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryContact(context, 'null', holder, attr);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3100
     * @tc.name       : testTelephonyContactQueryContact3100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                let promise = contact.queryContact(context, data, {
                  holderId: 1.1,
                  bundleName: "",
                  displayName: ""
                }, attr);
                promise.then((data) => {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data !== undefined);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3200
     * @tc.name       : testTelephonyContactQueryContact3200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                let promise = contact.queryContact(context, data, {
                  holderId: -100,
                  bundleName: "",
                  displayName: ""
                }, attr);
                promise.then((data) => {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data !== undefined);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3300
     * @tc.name       : testTelephonyContactQueryContact3300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.emails = [{
        email: "13800000000@email.com",
        labelName: "家庭地址类型",
        labelId: contact.Email.EMAIL_HOME,
        displayName: "emailDisplayName"
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} callback: success data->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.emails !== undefined) {
                      let email: contact.Email[] = resDate.emails;
                      if (email[0].labelId !== undefined) {
                        ExpectTrue(email[0].labelId.toString() === "1");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3400
     * @tc.name       : testTelephonyContactQueryContact3400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.emails = [{
        email: "13800000000@email.com",
        labelName: "工作地址类型",
        labelId: contact.Email.EMAIL_WORK,
        displayName: "emailDisplayName"
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.emails !== undefined) {
                      if (queryData.emails[0].labelId !== undefined) {
                        ExpectTrue(queryData.emails[0].labelId.toString() === "2");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3500
     * @tc.name       : testTelephonyContactQueryContact3500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.emails = [{
        email: "13800000000@email.com",
        labelName: "其它地址类型",
        labelId: contact.Email.EMAIL_OTHER,
        displayName: "emailDisplayName"
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.emails !== undefined) {
                      if (queryData.emails[0].labelId !== undefined) {
                        ExpectTrue(queryData.emails[0].labelId.toString() === "3");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3600
     * @tc.name       : testTelephonyContactQueryContact3600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "自定义关系类型", labelId: contact.Relation.CUSTOM_LABEL
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "0");
                        done();
                      }
                      ;
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3700
     * @tc.name       : testTelephonyContactQueryContact3700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "助手关系类型", labelId: contact.Relation.RELATION_ASSISTANT
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "1");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3800
     * @tc.name       : testTelephonyContactQueryContact3800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "兄弟关系类型", labelId: contact.Relation.RELATION_BROTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "2");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3900
     * @tc.name       : testTelephonyContactQueryContact3900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "子女关系类型", labelId: contact.Relation.RELATION_CHILD
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "3");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4000
     * @tc.name       : testTelephonyContactQueryContact4000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "合作伙伴关系类型", labelId: contact.Relation.RELATION_DOMESTIC_PARTNER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "4");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4100
     * @tc.name       : testTelephonyContactQueryContact4100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "父亲关系类型", labelId: contact.Relation.RELATION_FATHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "5");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4200
     * @tc.name       : testTelephonyContactQueryContact4200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4200";
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "朋友关系类型", labelId: contact.Relation.RELATION_FRIEND
      }];
      console.info(`${caseName} test start `);
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "6");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4300
     * @tc.name       : testTelephonyContactQueryContact4300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "管理者关系类型", labelId: contact.Relation.RELATION_MANAGER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "7");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
              }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4400
     * @tc.name       : testTelephonyContactQueryContact4400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "母亲关系类型", labelId: contact.Relation.RELATION_MOTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    
  })
}