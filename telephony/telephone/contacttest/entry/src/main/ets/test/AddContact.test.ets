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

import { describe, beforeAll, afterEach, it, expect } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

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

export default function AddContactTest() {
  describe('AddContactTest', () => {

    beforeAll(async (done: Function) => {
      console.info("beforeAll case");
      await getPermissions();
      done();
    });

    afterEach(async (done: Function) => {
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contactList: contact.Contact[];
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
								console.info(`afterEach deleteContact success`);
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
      attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
      contact.Attribute.ATTR_GROUP_MEMBERSHIP,
      contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME,
      contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
      contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
      contact.Attribute.ATTR_RELATION,
      contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
    };
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0100
     * @tc.name       : testTelephonyContactAddContact0100
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactAddContact0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0200
     * @tc.name       : testTelephonyContactAddContact0200
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactAddContact0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 2, name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact1: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact1: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
              if (err) {
                console.log(`${caseName} addContact2: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} addContact2: success data>${JSON.stringify(data)}`);
                ExpectTrue(data > 0);
                contact.queryContactsByPhoneNumber(context, "13800000000", (err: BusinessError, data: contact.Contact[]) => {
                  if (err) {
                    console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                    ExpectTrue(data.length === 2);
                    done()
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0300
     * @tc.name       : testTelephonyContactAddContact0300
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: ''
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0400
     * @tc.name       : testTelephonyContactAddContact0400
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: ''
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0500
     * @tc.name       : testTelephonyContactAddContact0500
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '110'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0600
     * @tc.name       : testTelephonyContactAddContact0600
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '12345'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0700
     * @tc.name       : testTelephonyContactAddContact0700
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 7, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0800
     * @tc.name       : testTelephonyContactAddContact0800
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 8, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13811111111'
        }, {
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13822222222'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0900
     * @tc.name       : testTelephonyContactAddContact0900
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '10086'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1200
     * @tc.name       : testTelephonyContactAddContact1200
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1200";
      console.info(`${caseName} test start `);
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: '张三发发发发发发发发发afafafafafafafafafafaf张三发发发发发发发发发afafafafafafafafafafaf张三发发发发发发发发发afafafafafafafafafafaf张三发发发发发发发发发afafafafafafafafafafaf'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1300
     * @tc.name       : testTelephonyContactAddContact1300
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '010-5591008'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1400
     * @tc.name       : testTelephonyContactAddContact1400
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact1400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: 'Eve!@'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1500
     * @tc.name       : testTelephonyContactAddContact1500
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '+123-456-7890'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1600
     * @tc.name       : testTelephonyContactAddContact1600
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactAddContact1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 15, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1700
     * @tc.name       : testTelephonyContactAddContact1700
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactAddContact1700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 16, name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          let promise2 = contact.addContact(context, phoneNumContact);
          promise2.then((data: number) => {
            console.log(`${caseName} success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, "13800000000", (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 2);
                done()
              }
            });
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1800
     * @tc.name       : testTelephonyContactAddContact1800
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: ''
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_1900
     * @tc.name       : testTelephonyContactAddContact1900
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact1900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: ''
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2000
     * @tc.name       : testTelephonyContactAddContact2000
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '110'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2100
     * @tc.name       : testTelephonyContactAddContact2100
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '12345'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2200
     * @tc.name       : testTelephonyContactAddContact2200
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13811111111'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2300
     * @tc.name       : testTelephonyContactAddContact2300
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13811111111'
        }, {
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13822222222'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2400
     * @tc.name       : testTelephonyContactAddContact2400
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '10086'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2700
     * @tc.name       : testTelephonyContactAddContact2700
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2800
     * @tc.name       : testTelephonyContactAddContact2800
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '010-5591008'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_2900
     * @tc.name       : testTelephonyContactAddContact2900
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact2900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Eve!@'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_3000
     * @tc.name       : testTelephonyContactAddContact3000
     * @tc.desc       : Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactAddContact3000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact3000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '+123-456-7890'
        }]
      };
      try {
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0100
     * @tc.name       : testTelephonyContactIsLocalContact0100
     * @tc.desc       : Determine if the current contact ID is in the phone book and use the callback method as an asynchronous method  10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsLocalContact0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.isLocalContact(context, data, (err: BusinessError<void>, data: boolean) => {
              if (err) {
                console.log(`${caseName} isLocalContact: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} isLocalContact: success data>${JSON.stringify(data)}`);
                ExpectTrue(data === true);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0200
     * @tc.name       : testTelephonyContactIsLocalContact0200
     * @tc.desc       : Determine if the current contact ID is in the phone book and use the callback method as an asynchronous method  10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isLocalContact(context, 9999, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0400
     * @tc.name       : testTelephonyContactIsLocalContact0400
     * @tc.desc       : Determine if the current contact ID is in the phone book and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isLocalContact(context, -1, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0500
     * @tc.name       : testTelephonyContactIsLocalContact0500
     * @tc.desc       : Determine if the current contact ID is in the phone book and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isLocalContact(context, 1.5, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0700
     * @tc.name       : testTelephonyContactIsLocalContact0700
     * @tc.desc       : Determine if the current contact ID is in the phone book and use the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isLocalContact(context, -10000, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false)
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0800
     * @tc.name       : testTelephonyContactIsLocalContact0800
     * @tc.desc       : Determine if the current contact ID is in the phone book and use the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isLocalContact(context, 10000000, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false)
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);

    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0900
     * @tc.name       : testTelephonyContactIsLocalContact0900
     * @tc.desc       : Determine if the current contact ID is in the phone book and use the Promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsLocalContact0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 1, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.isLocalContact(context, data);
            promise.then((data: boolean) => {
              console.log(`${caseName} success: data>${JSON.stringify(data)}`);
              ExpectTrue(data === true);
              done();
            }).catch((err: BusinessError) => {
              console.error(`isLocalContact fail: err>${JSON.stringify(err)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_1000
     * @tc.name       : testTelephonyContactIsLocalContact1000
     * @tc.desc       : Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact1000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.isLocalContact(context, 9999);
        promise.then((data: boolean) => {
          console.log(`isLocalContact success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`isLocalContact fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_1200
     * @tc.name       : testTelephonyContactIsLocalContact1200
     * @tc.desc       : Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isLocalContact(context, -1);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_1300
     * @tc.name       : testTelephonyContactIsLocalContact1300
     * @tc.desc       : Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.isLocalContact(context, 1.5);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_1500
     * @tc.name       : testTelephonyContactIsLocalContact1500
     * @tc.desc       : Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.isLocalContact(context, -10000);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_1600
     * @tc.name       : testTelephonyContactIsLocalContact1600
     * @tc.desc       : Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.isLocalContact(context, 100000000);
        promise.then((data: boolean) => {
          console.log(`isLocalContact success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0100
     * @tc.name       : testTelephonyContactDeleteContact0100
     * @tc.desc       : Delete a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactDeleteContact0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        if (err) {
          console.log(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.log(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          contact.queryKey(context, data, (err: BusinessError, key: string) => {
            if (err) {
              console.log(`${caseName} queryKey: err->${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              console.log(`${caseName} queryKey: success->${JSON.stringify(key)}`);
              ExpectTrue(key.length != 0);
              contact.deleteContact(context, key, (err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} deleteContacts:err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} deleteContacts:success`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0200
     * @tc.name       : testTelephonyContactDeleteContact0200
     * @tc.desc       : Delete a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactDeleteContact0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.deleteContact(context, '', (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} deleteContacts:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} deleteContacts:success`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    
    /**
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0600
     * @tc.name       : testTelephonyContactDeleteContact0600
     * @tc.desc       : Delete a contacts and useing the promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactDeleteContact0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        if (err) {
          console.log(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.log(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          contact.queryKey(context, data, (err: BusinessError, key: string) => {
            if (err) {
              console.log(`${caseName} queryKey: err->${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              console.log(`${caseName} queryKey: success->${JSON.stringify(key)}`);
              ExpectTrue(key.length != 0);
              let promise = contact.deleteContact(context, key);
              promise.then(() => {
                console.info(`${caseName} deleteContacts:success`);
                ExpectTrue(true);
                done();
              }).catch((err: BusinessError) => {
                console.error(`${caseName} deleteContacts:fail->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0700
     * @tc.name       : testTelephonyContactDeleteContact0700
     * @tc.desc       : Delete a contacts and useing the promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactDeleteContact0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.deleteContact(context, "");
        promise.then(() => {
          console.info(`${caseName} deleteContacts:success`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} deleteContacts:fail->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0100
     * @tc.name       : testTelephonyContactQueryKey0100
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryKey0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0100";
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
            contact.queryKey(context,
              data, (err: BusinessError, data) => {
                if (err) {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data.length > 0);
                  done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0200
     * @tc.name       : testTelephonyContactQueryKey0200
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -1, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0300
     * @tc.name       : testTelephonyContactQueryKey0300
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 1.5, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0400
     * @tc.name       : testTelephonyContactQueryKey0400
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 999999999999999999999999999999999999999, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0500
     * @tc.name       : testTelephonyContactQueryKey0500
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryKey0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0500";
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
            contact.queryKey(context, data, holder, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0600
     * @tc.name       : testTelephonyContactQueryKey0600
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0600";
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
            contact.queryKey(context, data, {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0700
     * @tc.name       : testTelephonyContactQueryKey0700
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0700";
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
            contact.queryKey(context, data, {
              holderId: 10,
              bundleName: "bundle",
              displayName: "display"
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0800
     * @tc.name       : testTelephonyContactQueryKey0800
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 56987151545665656565656565, holder, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0900
     * @tc.name       : testTelephonyContactQueryKey0900
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -1, holder, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1000
     * @tc.name       : testTelephonyContactQueryKey1000
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 1.5, holder, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1100
     * @tc.name       : testTelephonyContactQueryKey1100
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -10000, {
          holderId: -1.5,
          bundleName: "bundle",
          displayName: "display"
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1200
     * @tc.name       : testTelephonyContactQueryKey1200
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, Number.MAX_VALUE, holder, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1300
     * @tc.name       : testTelephonyContactQueryKey1300
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1300";
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
            contact.queryKey(context, data, {
              holderId: 1000000,
              bundleName: "bundle",
              displayName: "display"
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1400
     * @tc.name       : testTelephonyContactQueryKey1400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1400";
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
            let promise = contact.queryKey(context, data, holder);
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1500
     * @tc.name       : testTelephonyContactQueryKey1500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1500";
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
            let promise = contact.queryKey(context, data, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1600
     * @tc.name       : testTelephonyContactQueryKey1600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1600";
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
            let promise = contact.queryKey(context, data, {
              holderId: -10,
              bundleName: "bundle",
              displayName: "display"
            });
            promise.then((data) => {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
              ExpectTrue(data === undefined);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1700
     * @tc.name       : testTelephonyContactQueryKey1700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, 564654156215646541561, holder);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1800
     * @tc.name       : testTelephonyContactQueryKey1800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, -1, holder);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1900
     * @tc.name       : testTelephonyContactQueryKey1900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, 1.5, holder);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2000
     * @tc.name       : testTelephonyContactQueryKey2000
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey2000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -1, {
          holderId: -1,
          bundleName: "ddd",
          displayName: "www",
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2100
     * @tc.name       : testTelephonyContactQueryKey2100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey2100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, Number.MAX_VALUE, holder);
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
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2200
     * @tc.name       : testTelephonyContactQueryKey2200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey2200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2200";
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
            let promise = contact.queryKey(context, data, {
              holderId: 100000000000000,
              bundleName: "bundle",
              displayName: "display"
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
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    // 7版本
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2300
     * @tc.name       : testTelephonyContactQueryKey2300
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method. (deprecated)7+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryKey2300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2300";
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
            contact.queryKey(context,
              data, (err: BusinessError, data) => {
                if (err) {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data.length > 0);
                  done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryHolders_0100
     * @tc.name       : testTelephonyContactQueryHolders0100
     * @tc.desc       : Query all application information for creating contacts and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryHolders0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryHolders0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryHolders(context, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryHolders_0200
     * @tc.name       : testTelephonyContactQueryHolders0200
     * @tc.desc       : Query all application information for creating contacts and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryHolders0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryHolders0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryHolders(context);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);
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

    //---------------------------根据电话号码查询联系人-----${caseName}-----版本10--3个参数----------------
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0100
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0100
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, "13800000000", (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch:err`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0200
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0200
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContactsByPhoneNumber(context, '13900000000', (err: BusinessError, data: contact.Contact[]) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectTrue(data.length == 0);
            done();
          }
        });
      } catch (err) {
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0500
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0500
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '138*', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length == 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0600
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '+123-456-7890'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            contact.queryContactsByPhoneNumber(context, '+123-456-7890', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0700
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0700
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '1234'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            contact.queryContactsByPhoneNumber(context, '1234', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0800
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0800
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '12345678901234567890'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '12345678901234567890', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0900
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0900
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: 'abc1234565666666'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, 'abc1234565666666', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1000
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1000
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '-1'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '-1', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    //---------------------------根据电话号码查询联系人-----QueryContactsByPhoneNumber-----版本10--4个参数----------------
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1100
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1100
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactByPhoneNumber1100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, "13800000000", holder, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1200
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1200
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1.5,
              bundleName: "",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1300
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1300
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1,
              bundleName: "",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1400
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1400
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: -11,
              bundleName: "",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1500
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1500
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1,
              bundleName: "com.ohos.contacts",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1600
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1,
              bundleName: "",
              displayName: "phone"
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    //---------------------------根据电话号码查询联系人-----${caseName}-----版本10--4个参数-----arrr属性-----------
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1800
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1800
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactByPhoneNumber1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1900
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1900
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            let attrs: contact.ContactAttributes = {
              attributes: [contact.Attribute.ATTR_EMAIL]
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2000
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2000
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            let attrs: contact.ContactAttributes = {
              attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
              contact.Attribute.ATTR_GROUP_MEMBERSHIP]
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2100
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2100
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let attrs: contact.ContactAttributes = {
        attributes: [
        contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME]
      };
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            contact.queryContactsByPhoneNumber(context, "13800000000", attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2200
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2200
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let attrs: contact.ContactAttributes = {
        attributes: [contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
        contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
        contact.Attribute.ATTR_RELATION,
        contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
      };
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '13800000000', attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0100
     * @tc.name       : testTelephonyContactQueryContactsByEmail0100
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactsByEmail0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryContactsByEmail: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContactsByEmail: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0200
     * @tc.name       : testTelephonyContactQueryContactsByEmail0200
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '13811111111@email.com', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0300
     * @tc.name       : testTelephonyContactQueryContactsByEmail0300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '12!@#895@email.com', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0500
     * @tc.name       : testTelephonyContactQueryContactsByEmail0500
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0500";
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
            contact.addContact(context, contactData, (err: BusinessError, data: number) => {
              if (err) {
                console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
                ExpectTrue(data > 0);
                contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContactsByEmail: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContactsByEmail: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data.length === 2);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0600
     * @tc.name       : testTelephonyContactQueryContactsByEmail0600
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'local_part_max_length64_characters@domain_part_max_length255_characters.com', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success  data->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0700
     * @tc.name       : testTelephonyContactQueryContactsByEmail0700
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', holder, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryContactsByEmail: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContactsByEmail: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0800
     * @tc.name       : testTelephonyContactQueryContactsByEmail0800
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', {
              holderId: -5,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0900
     * @tc.name       : testTelephonyContactQueryContactsByEmail0900
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1000
     * @tc.name       : testTelephonyContactQueryContactsByEmail1000
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '123!@#456@email.com', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1100
     * @tc.name       : testTelephonyContactQueryContactsByEmail1100
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '123456', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1300
     * @tc.name       : testTelephonyContactQueryContactsByEmail1300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '123456', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1400
     * @tc.name       : testTelephonyContactQueryContactsByEmail1400
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '000000@email.com', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1500
     * @tc.name       : testTelephonyContactQueryContactsByEmail1500
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', attr, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1700
     * @tc.name       : testContactQueryContactsByEmail017
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456', {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1800
     * @tc.name       : testTelephonyContactQueryContactsByEmail1800
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1900
     * @tc.name       : testTelephonyContactQueryContactsByEmail1900
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2000
     * @tc.name       : testTelephonyContactQueryContactsByEmail2000
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2100
     * @tc.name       : testTelephonyContactQueryContactsByEmail2100
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '0000@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2200
     * @tc.name       : testTelephonyContactQueryContactsByEmail2200
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123!@#456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2300
     * @tc.name       : testTelephonyContactQueryContactsByEmail2300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123455', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2400
     * @tc.name       : testTelephonyContactQueryContactsByEmail2400
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '000000@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2500
     * @tc.name       : testTelephonyContactQueryContactsByEmail2500
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2600
     * @tc.name       : testTelephonyContactQueryContactsByEmail2600
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2700
     * @tc.name       : testTelephonyContactQueryContactsByEmail2700
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: -5,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2800
     * @tc.name       : testTelephonyContactQueryContactsByEmail2800
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '00000@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2900
     * @tc.name       : testTelephonyContactQueryContactsByEmail2900
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123!@#456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3000
     * @tc.name       : testTelephonyContactQueryContactsByEmail3000
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '3698', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3300
     * @tc.name       : testTelephonyContactQueryContactsByEmail3300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3300";
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
            contact.queryContactsByEmail(context, '897452455', (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0100
     * @tc.name       : testTelephonyContactQueryContacts0100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContacts0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0100";
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
            contact.queryContacts(context, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0300
     * @tc.name       : testTelephonyContactQueryContacts0300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0300";
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
            contact.queryContacts(context, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0400
     * @tc.name       : testTelephonyContactQueryContacts0400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0400";
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
            contact.queryContacts(context, {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0600
     * @tc.name       : testTelephonyContactQueryContacts0600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0600";
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
            contact.queryContacts(context, {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0700
     * @tc.name       : testTelephonyContactQueryContacts0700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0700";
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
            contact.queryContacts(context, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0900
     * @tc.name       : testTelephonyContactQueryContacts0900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0900";
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
            contact.queryContacts(context, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1000
     * @tc.name       : testTelephonyContactQueryContacts1000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1000";
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
            contact.queryContacts(context, {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1200
     * @tc.name       : testTelephonyContactQueryContacts1200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1200";
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
            contact.queryContacts(context, {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1300
     * @tc.name       : testTelephonyContactQueryContacts1300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1300";
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
            let promise = contact.queryContacts(context, {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1500
     * @tc.name       : testTelephonyContactQueryContacts1500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1500";
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
            let promise = contact.queryContacts(context, {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4800
     * @tc.name       : testTelephonyContactQueryContact4800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4800";
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
            contact.queryContact(context, '-1', (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4900
     * @tc.name       : testTelephonyContactQueryContact4900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4900";
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
            contact.queryContact(context, '-1', {
              holderId: -1,
              bundleName: "",
              displayName: ""
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5000
     * @tc.name       : testTelephonyContactQueryContact5000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5000";
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
            contact.queryContact(context, '-1', {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5200
     * @tc.name       : testTelephonyContactQueryContact5200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5200";
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
            let promise = contact.queryContact(context, '-1', {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1600
     * @tc.name       : testTelephonyContactQueryContacts1600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1600";
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
            contact.queryContacts(context, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1700
     * @tc.name       : testTelephonyContactQueryContacts1700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1700";
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
            contact.queryContacts(context, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1800
     * @tc.name       : testTelephonyContactQueryContacts1800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1800";
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
            contact.queryContacts(context, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1900
     * @tc.name       : testTelephonyContactQueryContacts1900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1900";
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
            let promise = contact.queryContacts(context, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_3700
     * @tc.name       : testTelephonyContactQueryContacts3700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContacts3700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts3700";
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
            contact.queryContacts(context, {
              holderId: -10000,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_3800
     * @tc.name       : testTelephonyContactQueryContacts3800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContacts3800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts3800";
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
            let promise = contact.queryContacts(context, {
              holderId: -10,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number : SUB_Telephony_Contact_AddContact_6100
     * @tc.name   : testTelephonyContactAddContact6100
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactAddContact6100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "小明";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.nickName !== undefined) {
                    let nickName: contact.NickName = resDate.nickName;
                    ExpectTrue(nickName.nickName === "小明");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_6200
     * @tc.name   : testTelephonyContactAddContact6200
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact6200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "小  明";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.nickName !== undefined) {
                    let nickName: contact.NickName = resDate.nickName;
                    ExpectTrue(nickName.nickName === "小  明");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_6400
     * @tc.name   : testTelephonyContactAddContact6400
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact6400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_6500
     * @tc.name   : testTelephonyContactAddContact6500
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact6500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "contact.addContact()";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.nickName !== undefined) {
                    let nickName: contact.NickName = resDate.nickName;
                    ExpectTrue(nickName.nickName === "contact.addContact()");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_6600
     * @tc.name   : testTelephonyContactAddContact6600
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactAddContact6600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "同事";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.note !== undefined) {
                    let note: contact.Note = resDate.note;
                    ExpectTrue(note.noteContent === "同事");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_6700
     * @tc.name   : testTelephonyContactAddContact6700
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact6700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "同事1990.3";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.note !== undefined) {
                    let note: contact.Note = resDate.note;
                    ExpectTrue(note.noteContent === "同事1990.3");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_6800
     * @tc.name   : testTelephonyContactAddContact6800
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact6800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "同事~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ha";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_6900
     * @tc.name   : testTelephonyContactAddContact6900
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact6900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7000
     * @tc.name   : testTelephonyContactAddContact7000
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "contact.addContact()";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7100
     * @tc.name   : testTelephonyContactAddContact7100
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactAddContact7100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "Google";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.name === "Google");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7200
     * @tc.name   : testTelephonyContactAddContact7200
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "Google, Research & Development";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.name === "Google, Research & Development");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7300
     * @tc.name   : testTelephonyContactAddContact7300
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "Google, Senior Engineer";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.name === "Google, Senior Engineer");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7400
     * @tc.name   : testTelephonyContactAddContact7400
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer Google, Senior Engineer";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7500
     * @tc.name   : testTelephonyContactAddContact7500
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7600
     * @tc.name   : testTelephonyContactAddContact7600
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "contact.addContact(context, contactData)";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7700
     * @tc.name   : testTelephonyContactAddContact7700
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactAddContact7700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "test title";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.title === "test title");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7800
     * @tc.name   : testTelephonyContactAddContact7800
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.title === undefined);
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_7900
     * @tc.name   : testTelephonyContactAddContact7900
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact7900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "rgarhrthrtar16546841655gieruhgiuerhgi的回复i耳庇古如果发erjfioerhgiowwhgiorehgr8iiiiiiiiiiii(*&^!$#!@#iiiiiiiiiiiiiiiiiiiiiiiiiii还能否龟儿回归额外回归微软划归俄国会饿v与uvu余部i一个统一的如同当初太原分院吧";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    if (organization.title !== undefined) {
                      ExpectTrue(organization.title.length > 0);
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_8000
     * @tc.name   : testTelephonyContactAddContact8000
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "contact.addContact(context, contactData, (err: BusinessError, addData) => {})";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(typeof (organization.title) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_8100
     * @tc.name   : testTelephonyContactAddContact8100
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactAddContact8100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_8200
     * @tc.name   : testTelephonyContactAddContact8200
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.familyName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.familyName) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_8400
     * @tc.name   : testTelephonyContactAddContact8400
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.givenName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.givenName) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_8500
     * @tc.name   : testTelephonyContactAddContact8500
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.givenNamePhonetic = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.givenNamePhonetic) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_8600
     * @tc.name   : testTelephonyContactAddContact8600
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.middleName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.middleName) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });


    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9100
     * @tc.name   : testTelephonyContactQueryContact9100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "AIM即时消息类型", labelId: contact.ImAddress.IM_AIM
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "0");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9200
     * @tc.name   : testTelephonyContactQueryContact9200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "MSN即时消息类型", labelId: contact.ImAddress.IM_MSN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "1");
                      done();
                    }
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9300
     * @tc.name   : testTelephonyContactQueryContact9300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "YAHOO即时消息类型", labelId: contact.ImAddress.IM_YAHOO
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "2");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9400
     * @tc.name   : testTelephonyContactQueryContact9400
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "SKYPE即时消息类型", labelId: contact.ImAddress.IM_SKYPE
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "3");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9500
     * @tc.name   : testTelephonyContactQueryContact9500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "QQ即时消息类型", labelId: contact.ImAddress.IM_QQ
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "4");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9600
     * @tc.name   : testTelephonyContactQueryContact9600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "ICQ即时消息类型", labelId: contact.ImAddress.IM_ICQ
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "6");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9700
     * @tc.name   : testTelephonyContactQueryContact9700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "JABBER即时消息类型", labelId: contact.ImAddress.IM_JABBER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
        ExpectTrue(addData > 0);
        contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
          if (keyErr) {
            console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
            ExpectFail();
            done();
          }
          console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
          contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
            if (queryErr) {
              console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
              ExpectFail();
              done();
            }
            console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
            let resDate: contact.Contact = queryData;
            if (resDate.imAddresses !== undefined) {
              let imAddresses: contact.ImAddress[] = resDate.imAddresses;
              if (imAddresses[0].labelId !== undefined) {
                let labelId: number = imAddresses[0].labelId
                ExpectTrue(labelId.toString() === "7");
                done();
              }
            } else {
              ExpectFail();
              done();
            }
          });
        });
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9800
     * @tc.name   : testTelephonyContactQueryContact9800
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "无效的即时消息类型", labelId: contact.ImAddress.INVALID_LABEL_ID
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "-2");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9900
     * @tc.name   : testTelephonyContactQueryContact9900
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactQueryContact9900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10000
     * @tc.name   : testTelephonyContactQueryContact10000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "", labelName: "自定义即时消息类型", labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    let imAddress: string = imAddresses[0].imAddress;
                    ExpectTrue(typeof (imAddress) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    // --------------------------------------------contact_attribute_imAddresses_imAddress-------参数为超长字符串----------------;
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10100
     * @tc.name   : testTelephonyContactQueryContact10100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型",
          labelName: "自定义即时消息类型",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    let imAddress: string = imAddresses[0].imAddress;
                    ExpectTrue(typeof (imAddress) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10200
     * @tc.name   : testTelephonyContactQueryContact10200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "(*￣︶￣)",
          labelName: "自定义即时消息类型",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    let imAddress: string = imAddresses[0].imAddress;
                    ExpectTrue(typeof (imAddress) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10300
     * @tc.name   : testTelephonyContactQueryContact10300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactQueryContact10300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10500
     * @tc.name   : testTelephonyContactQueryContact10500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "自定义即时消息类型",
          labelName: "自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelName !== undefined) {
                      let labelName: string = imAddresses[0].labelName;
                      ExpectTrue(typeof (labelName) === "string");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10600
     * @tc.name   : testTelephonyContactQueryContact10600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "自定义即时消息类型",
          labelName: "(*￣︶￣)",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelName !== undefined) {
                      let labelName: string = imAddresses[0].labelName;
                      ExpectTrue(typeof (labelName) === "string");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10700
     * @tc.name   : testTelephonyContactQueryContact10700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "0");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10800
     * @tc.name   : testTelephonyContactQueryContact10800
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_HOME
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "1");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10900
     * @tc.name   : testTelephonyContactQueryContact10900
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_MOBILE
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "2");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11000
     * @tc.name   : testTelephonyContactQueryContact11000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_WORK
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "3");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11100
     * @tc.name   : testTelephonyContactQueryContact11100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_FAX_WORK
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "4");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11200
     * @tc.name   : testTelephonyContactQueryContact11200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_FAX_HOME
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "5");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11300
     * @tc.name   : testTelephonyContactQueryContact11300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_PAGER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "6");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11400
     * @tc.name   : testTelephonyContactQueryContact11400
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_OTHER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "7");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11500
     * @tc.name   : testTelephonyContactQueryContact11500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_CALLBACK
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "8");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11600
     * @tc.name   : testTelephonyContactQueryContact11600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_CAR
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "9");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11700
     * @tc.name   : testTelephonyContactQueryContact11700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_COMPANY_MAIN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "10");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11800
     * @tc.name   : testTelephonyContactQueryContact11800
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_ISDN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "11");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11900
     * @tc.name   : testTelephonyContactQueryContact11900
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_MAIN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "12");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12000
     * @tc.name   : testTelephonyContactQueryContact12000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_OTHER_FAX
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "13");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12100
     * @tc.name   : testTelephonyContactQueryContact12100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_RADIO
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "14");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12200
     * @tc.name   : testTelephonyContactQueryContact12200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_TELEX
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "15");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12300
     * @tc.name   : testTelephonyContactQueryContact12300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_TTY_TDD
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "16");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12400
     * @tc.name   : testTelephonyContactQueryContact12400
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_WORK_MOBILE
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "17");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12500
     * @tc.name   : testTelephonyContactQueryContact12500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_WORK_PAGER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "18");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12600
     * @tc.name   : testTelephonyContactQueryContact12600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_ASSISTANT
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "19");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12700
     * @tc.name   : testTelephonyContactQueryContact12700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_MMS
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "20");
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
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_13000
     * @tc.name   : testTelephonyContactQueryContact13000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact13000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact13000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000",
          labelName: "gbjdsgbfsdbjbfj收到回复i士大夫也是个不服输发表12334!#$%^%^&&^%%$@!#contact.queryKey()",
          labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelName !== undefined) {
                      let labelName: string = phoneNumbers[0].labelName;
                      ExpectTrue(labelName.length > 0);
                      done();
                    }
                  } else {
                    ExpectFail();
                    done();
                  }
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_13100
     * @tc.name   : testTelephonyContactQueryContact13100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact13100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact13100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "110", labelName: "labelName", labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    let phoneNumber: string = phoneNumbers[0].phoneNumber;
                    ExpectTrue(phoneNumber === "110");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_13200
     * @tc.name   : testTelephonyContactQueryContact13200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact13200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact13200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "029-1234567", labelName: "labelName", labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} callback: err->${JSON.stringify(addErr)}`);
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
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    let phoneNumber: string = phoneNumbers[0].phoneNumber;
                    ExpectTrue(phoneNumber === "029-1234567");
                    done();
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
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "8");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4500
     * @tc.name       : testTelephonyContactQueryContact4500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "父母关系类型", labelId: contact.Relation.RELATION_PARENT
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
                        ExpectTrue(queryData.relations[0].labelId.toString() === "9");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4600
     * @tc.name       : testTelephonyContactQueryContact4600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "同居同伴关系类型", labelId: contact.Relation.RELATION_PARTNER
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
                        ExpectTrue(queryData.relations[0].labelId.toString() === "10");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4700
     * @tc.name       : testTelephonyContactQueryContact4700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "推荐人关系类型", labelId: contact.Relation.RELATION_REFERRED_BY
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
                        ExpectTrue(queryData.relations[0].labelId.toString() === "11");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4800
     * @tc.name       : testTelephonyContactQueryContact4800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "亲属关系类型", labelId: contact.Relation.RELATION_RELATIVE
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
                        ExpectTrue(queryData.relations[0].labelId.toString() === "12");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4900
     * @tc.name       : testTelephonyContactQueryContact4900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "姐妹关系类型", labelId: contact.Relation.RELATION_SISTER
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
                        ExpectTrue(queryData.relations[0].labelId.toString() === "13");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5000
     * @tc.name       : testTelephonyContactQueryContact5000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "配偶关系类型", labelId: contact.Relation.RELATION_SPOUSE
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
                        ExpectTrue(queryData.relations[0].labelId.toString() === "14");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5200
     * @tc.name       : testTelephonyContactQueryContact5200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "自定义会话发起协议（SIP）地址类型", labelId: contact.SipAddress.CUSTOM_LABEL
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
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "0");
                        done();
                      }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5300
     * @tc.name       : testTelephonyContactQueryContact5300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "家庭会话发起协议（SIP）地址类型", labelId: contact.SipAddress.SIP_HOME
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
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "1");
                        done();
                      }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5400
     * @tc.name       : testTelephonyContactQueryContact5400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "工作会话发起协议（SIP）地址类型", labelId: contact.SipAddress.SIP_WORK
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
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "2");
                        done();
                      }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5500
     * @tc.name       : testTelephonyContactQueryContact5500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "其它会话发起协议（SIP）地址类型", labelId: contact.SipAddress.SIP_OTHER
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
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "3");
                        done();
                      }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5700
     * @tc.name       : testTelephonyContactQueryContact5700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 1,
        emails: [{
          email: '13800000000@email.com',
          labelName: "自定义邮箱",
          labelId: contact.Email.EMAIL_HOME,
          displayName: "emailDisplayName"
        }],
      };
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                if (data[0].emails !== undefined) {
                  if (data[0].emails[0].displayName !== undefined) {
                    ExpectTrue(data[0].emails[0].displayName === "emailDisplayName");
                    done();
                  }
                }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4200
     * @tc.name       : testTelephonyContactQueryContactsByEmail4200
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactsByEmail4200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let phoneNumContact: contact.Contact = {
          id: 1,
          emails: [{
            email: '13800000000@email.com',
            labelName: "自定义邮箱",
            labelId: contact.Email.EMAIL_HOME,
            displayName: "emailDisplayName"
          }],
        };
        contact.addContact(context, phoneNumContact, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                if (data[0].emails !== undefined) {
                  if (data[0].emails[0].labelId !== undefined) {
                    ExpectTrue(data[0].emails[0].displayName === "emailDisplayName");
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
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4300
     * @tc.name       : testTelephonyContactQueryContactsByEmail4300
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let phoneNumContact: contact.Contact = {
          id: 1,
          emails: [{
            email: '13800000000@email.com',
            labelName: "自定义邮箱",
            labelId: contact.Email.EMAIL_HOME,
            displayName: "emailDisplayName"
          }],
        };
        contact.addContact(context, phoneNumContact, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                if (data[0].emails !== undefined) {
                  if (data[0].emails[0].labelId !== undefined) {
                    ExpectTrue(data[0].emails[0].labelName === "自定义邮箱");
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
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4400
     * @tc.name       : testTelephonyContactQueryContactsByEmail4400
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let phoneNumContact: contact.Contact = {
          id: 1,
          emails: [{
            email: '13800000000@email.com',
            labelName: "自定义邮箱",
            labelId: contact.Email.EMAIL_HOME,
            displayName: "emailDisplayName"
          }],
        };
        contact.addContact(context, phoneNumContact, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                let queryData: contact.Contact[] = data
                if (queryData[0].emails !== undefined) {
                  let queryEmail: contact.Email[] = queryData[0].emails
                  if (queryEmail[0].labelId !== undefined) {
                    ExpectTrue(queryEmail[0].labelId.toString() === "1");
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
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4700
     * @tc.name       : testTelephonyContactQueryContactsByEmail4700
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
        [{
          city: "南京",
          country: "中国",
          labelName: "labelName",
          neighborhood: "neighborhood",
          pobox: "pobox",
          postalAddress: "postalAddress",
          postcode: "postcode",
          region: "region",
          street: "street",
          labelId: contact.PostalAddress.ADDR_OTHER
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].labelName !== undefined) {
                        ExpectTrue(PostalAddress[0].labelName === "labelName");
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4900
     * @tc.name       : testTelephonyContactQueryContactsByEmail4900
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
        [{
          city: "南京",
          country: "中国",
          labelName: "labelName",
          neighborhood: "neighborhood",
          pobox: "pobox",
          postalAddress: "postalAddress",
          postcode: "postcode",
          region: "region",
          street: "street",
          labelId: contact.PostalAddress.ADDR_OTHER
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].pobox !== undefined) {
                        ExpectTrue(PostalAddress[0].pobox === "pobox");
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5000
     * @tc.name       : testTelephonyContactQueryContactsByEmail5000
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
        [{
          city: "南京",
          country: "中国",
          labelName: "labelName",
          neighborhood: "neighborhood",
          pobox: "pobox",
          postalAddress: "postalAddress",
          postcode: "postcode",
          region: "region",
          street: "street",
          labelId: contact.PostalAddress.ADDR_OTHER
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].postalAddress !== undefined) {
                        ExpectTrue(PostalAddress[0].postalAddress === "postalAddress");
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5100
     * @tc.name       : testTelephonyContactQueryContactsByEmail5100
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
        [{
          city: "南京",
          country: "中国",
          labelName: "labelName",
          neighborhood: "neighborhood",
          pobox: "pobox",
          postalAddress: "postalAddress",
          postcode: "postcode",
          region: "region",
          street: "street",
          labelId: contact.PostalAddress.ADDR_OTHER
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].postcode !== undefined) {
                        ExpectTrue(PostalAddress[0].postcode === "postcode");
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5200
     * @tc.name       : testTelephonyContactQueryContactsByEmail5200
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
        [{
          city: "南京",
          country: "中国",
          labelName: "labelName",
          neighborhood: "neighborhood",
          pobox: "pobox",
          postalAddress: "postalAddress",
          postcode: "postcode",
          region: "region",
          street: "street",
          labelId: contact.PostalAddress.ADDR_OTHER
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].region !== undefined) {
                        ExpectTrue(PostalAddress[0].region === "region");
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5300
     * @tc.name       : testTelephonyContactQueryContactsByEmail5300
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
        [{
          city: "南京",
          country: "中国",
          labelName: "labelName",
          neighborhood: "neighborhood",
          pobox: "pobox",
          postalAddress: "postalAddress",
          postcode: "postcode",
          region: "region",
          street: "street",
          labelId: contact.PostalAddress.ADDR_OTHER
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].street !== undefined) {
                        ExpectTrue(PostalAddress[0].street === "street");
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5500
     * @tc.name       : testTelephonyContactQueryContactsByEmail5500
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
        [{
          city: "南京",
          country: "中国",
          labelName: "labelName",
          neighborhood: "neighborhood",
          pobox: "pobox",
          postalAddress: "postalAddress",
          postcode: "postcode",
          region: "region",
          street: "street",
          labelId: contact.PostalAddress.ADDR_OTHER
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].labelId !== undefined) {
                        ExpectTrue(PostalAddress[0].labelId.toString() === "3");
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5700
     * @tc.name       : testTelephonyContactQueryContactsByEmail5700
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses =
        [{
          sipAddress: "sipAddress", labelName: "自定义sipAddress", labelId: contact.PostalAddress.ADDR_HOME
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.sipAddresses !== undefined) {
                      let SipAddress: contact.SipAddress[] = resDate.sipAddresses;
                      if (SipAddress[0].labelId !== undefined) {
                        ExpectTrue(SipAddress[0].labelId.toString() === "1");
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
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0600
     * @tc.name       : testTelephonyContactIsLocalContact0600
     * @tc.desc       : Determine if the current contact ID is in the phone book and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isLocalContact(context, 0, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} isLocalContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data == false);
            done();
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3200
     * @tc.name       : testTelephonyContactUpdateContact3200
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
          if (addErr) {
            console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                let promise = contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  name: {
                    fullName: "小李啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                  },
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      ExpectTrue(true);
                      done();
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3400
     * @tc.name       : testTelephonyContactUpdateContact3400
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
          if (addErr) {
            console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                let promise = contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "110"
                  }],
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.phoneNumbers !== undefined) {
                        let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                        if (phoneNumbers[0].phoneNumber !== undefined) {
                          let phoneNumber = phoneNumbers[0].phoneNumber
                          ExpectTrue(phoneNumbers[0].phoneNumber === "110");
                          done();
                        }
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3500
     * @tc.name       : testTelephonyContactUpdateContact3500
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
          if (addErr) {
            console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                let promise = contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "029-1234567"
                  }],
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.phoneNumbers !== undefined) {
                        let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                        if (phoneNumbers[0].phoneNumber !== undefined) {
                          let phoneNumber = phoneNumbers[0].phoneNumber
                          ExpectTrue(phoneNumber === "029-1234567");
                          done();
                        }
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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

    //---------------------------根据电话号码查询联系人-----${caseName}-----版本10--5个参数----------------
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2400
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2400
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: [contact.Attribute.ATTR_NAME]
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2500
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2500
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContactsByPhoneNumber(context, '13811111111', holder, attr, (err: BusinessError, data: contact.Contact[]) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2600
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '-1'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '-1', holder, attr, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2800
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2800
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: []
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2900
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2900
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: []
            };
            let holders: contact.Holder = {
              holderId: 11,
              bundleName: "",
              displayName: "phone"
            };
            contact.queryContactsByPhoneNumber(context, "13800000000", holders, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3000
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3000
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: 'null'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
              contact.Attribute.ATTR_GROUP_MEMBERSHIP]
            };
            contact.queryContactsByPhoneNumber(context, "null", holder, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
    })

    //---------------------------根据电话号码查询联系人，使用Promise方式作为异步方法----------------

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3200
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3200
     * @tc.desc       : Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: [contact.Attribute.ATTR_CONTACT_EVENT]
            };
            let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holder, attrs);
            promise.then((data: contact.Contact[]) => {
              console.log(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3300
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3300
     * @tc.desc       : Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            let attrs: contact.ContactAttributes = {
              attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
              contact.Attribute.ATTR_GROUP_MEMBERSHIP,
              contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME]
            };
            let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holder, attrs);
            promise.then((data: contact.Contact[]) => {
              console.log(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3600
     * @tc.desc       : Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;

      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        if (err) {
          console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(true);
          let holders: contact.Holder = {
            holderId: 2,
            bundleName: "com.ohos.contacts",
            displayName: "phone"
          };
          let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holders, attr);
          promise.then((data: contact.Contact[]) => {
            console.log(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          });
        }
      });
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3700
     * @tc.name       : testTelephonyContactQueryContactsByEmail3700
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3700";
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
            contact.queryContactsByEmail(context, '555555', attr, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3900
     * @tc.name       : testTelephonyContactQueryContactsByEmail3900
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3900";
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
            contact.queryContactsByEmail(context, '666666', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3100
     * @tc.name       : testTelephonyContactQueryContactsByEmail3100
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '000000@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4100
     * @tc.name       : testTelephonyContactQueryContactsByEmail4100
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4100";
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
            let promise = contact.queryContactsByEmail(context, '123214', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4800
     * @tc.name       : testTelephonyContactQueryContact4800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4800";
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
            contact.queryContact(context, '-1', (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4900
     * @tc.name       : testTelephonyContactQueryContact4900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4900";
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
            contact.queryContact(context, '-1', {
              holderId: -1,
              bundleName: "",
              displayName: ""
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_9900
     * @tc.name       : testTelephonyContactQueryContact9900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact9900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9900";
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
            contact.queryContact(context, '-1', {
              holderId: -1,
              bundleName: "",
              displayName: "phone"
            }, attr, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5000
     * @tc.name       : testTelephonyContactQueryContact5000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5000";
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
            contact.queryContact(context, '-1', {
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0100
     * @tc.name       : testTelephonyContactUpdateContact0100
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactUpdateContact0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        console.info(JSON.stringify(contactData))
        contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
          if (addErr) {
            console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                let phoneNumContact: contact.Contact = {
                  id: addData,
                  key: keyData,
                  emails: [{
                    email: "13800000001@email.com",
                    labelName: "自定义邮箱",
                    labelId: 1,
                    displayName: "emailDisplayName"
                  }]
                };
                contact.updateContact(context, phoneNumContact, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.emails !== undefined) {
                          let emails: contact.Email[] = resDate.emails
                          if (emails[0].email !== undefined) {
                            let email: string = emails[0].email;
                            ExpectTrue(email === "13800000001@email.com");
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0600
     * @tc.name       : testTelephonyContactUpdateContact0600
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
          if (addErr) {
            console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
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
                ExpectTrue(keyData.length > 0)
                contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  name: {
                    fullName: "小李部分更新",
                  },
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.name !== undefined) {
                          let name: contact.Name = resDate.name
                          ExpectTrue(name.fullName === "小李部分更新");
                          done();
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0900
     * @tc.name       : testTelephonyContactUpdateContact0900
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err: BusinessError, dataID: number) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(dataID)}`);
            ExpectTrue(dataID > 0);
            contact.queryKey(context, dataID, (err: BusinessError, data: string) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.updateContact(context, {
                  id: dataID,
                  key: data,
                  phoneNumbers: [{
                    phoneNumber: "13800000000", labelName: "自定义phoneNumbers0"
                  }, {
                    phoneNumber: "13800000001", labelName: "自定义phoneNumbers1"
                  }, {
                    phoneNumber: "13800000002", labelName: "自定义phoneNumbers2"
                  }, {
                    phoneNumber: "13800000003", labelName: "自定义phoneNumbers3"
                  }, {
                    phoneNumber: "13800000004", labelName: "自定义phoneNumbers4"
                  }, {
                    phoneNumber: "13800000005", labelName: "自定义phoneNumbers5"
                  }],
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    ExpectTrue(true);
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

  })
}

