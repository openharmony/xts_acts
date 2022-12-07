/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import contactsapi from "@ohos.contact";
import sms from '@ohos.telephony.sms';
import featureAbility from "@ohos.ability.featureAbility";
import {afterAll, afterEach, beforeAll, describe, expect, it} from '@ohos/hypium';
import {UiComponent,UiDriver,Component,Driver,UiWindow,ON,BY} from '@ohos.uitest'

export default function ObjectInterfaceTest() {

  describe('ObjectInterfaceTest', function () {
    
    function sleep(numberMillis) {
      var now = new Date();
      var exitTime = now.getTime() + numberMillis;
      while (true) {
        now = new Date();
        if (now.getTime() > exitTime);
        return;
      }
    }

    async function driveFn() {
      console.info("come in driveFn");
      let driver = await UiDriver.create();
      console.info("driver is " + JSON.stringify(driver));
      sleep(2000);
      let button = await driver.findComponent(BY.text('允许'));
      console.info("button is " + JSON.stringify(button));
      await button.click();
      sleep(5000);
    }

    beforeAll(async function () {
      var permissions = ["ohos.permission.WRITE_CONTACTS","ohos.permission.READ_CONTACTS"];
      featureAbility.getContext().requestPermissionsFromUser(permissions, 0, () => {
        console.info("start requestPermissionsFromUser");
      });
      for(let i=0; i<2; i++){
        await driveFn();
        console.log("get user_grant permission");
      }
    });

    var contactData = {
      id: 0,
      key: "0",
      contactAttributes: {
        attributes: [contactsapi.Attribute.ATTR_CONTACT_EVENT, contactsapi.Attribute.ATTR_EMAIL,
        contactsapi.Attribute.ATTR_GROUP_MEMBERSHIP,
        contactsapi.Attribute.ATTR_IM, contactsapi.Attribute.ATTR_NAME, contactsapi.Attribute.ATTR_NICKNAME,
        contactsapi.Attribute.ATTR_NOTE, contactsapi.Attribute.ATTR_ORGANIZATION, contactsapi.Attribute.ATTR_PHONE,
        contactsapi.Attribute.ATTR_PORTRAIT, contactsapi.Attribute.ATTR_POSTAL_ADDRESS,
        contactsapi.Attribute.ATTR_RELATION,
        contactsapi.Attribute.ATTR_SIP_ADDRESS, contactsapi.Attribute.ATTR_WEBSITE]
      },
      emails: [{
                 email: "email", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
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
                       phoneNumber: "183", labelName: "自定义phoneNumbers", labelId: 4
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

    var gRawContactId;
    var gGroup;


    it("contactsApi_contactdata_test_100", 0, async function (done) {
      console.info("contactData.id" + contactData.id);
      console.info("contactData.id" + (contactData.id == 0));
      expect(contactData.id == 0).assertTrue();
      console.info("contactData.key" + contactData.key);
      console.info("contactData.key" + (contactData.key == "0"));
      expect(contactData.key).assertEqual("0");
      console.info("contactData.contactAttributes" + contactData.contactAttributes);
      console.info("contactData.contactAttributes" + (contactData.contactAttributes != null));
      expect(contactData.contactAttributes != null).assertTrue();
      console.info("contactData.emails" + contactData.emails);
      expect(contactData.emails != null).assertTrue();
      expect(contactData.events != null).assertTrue();
      expect(contactData.groups != null).assertTrue();
      expect(contactData.imAddresses != null).assertTrue();
      done();
    });

    it("contactsApi_contactdata_test_200", 0, async function (done) {
      expect(contactData.phoneNumbers != null).assertTrue();
      expect(contactData.portrait != null).assertTrue();
      expect(contactData.postalAddresses != null).assertTrue();
      expect(contactData.relations != null).assertTrue();
      expect(contactData.sipAddresses != null).assertTrue();
      expect(contactData.websites != null).assertTrue();
      expect(contactData.name != null).assertTrue();
      expect(contactData.nickName != null).assertTrue();
      expect(contactData.note != null).assertTrue();
      expect(contactData.organization != null).assertTrue();
      expect(contactData.contactAttributes.attributes != null).assertTrue();
      done();
    });

    it("contactsApi_contactdata_test_300", 0, async function (done) {
      expect(contactData.emails.email === null).assertFalse();
      expect(contactData.emails.labelName === null).assertFalse();
      console.info("contactData.emails.labelId == 1" + contactData.emails.labelId);
      expect(contactData.emails.labelId != 0).assertTrue();
      expect(contactData.emails.displayName === null).assertFalse();
      expect(contactData.events.eventDate === null).assertFalse();
      expect(contactData.events.labelName === null).assertFalse();
      expect(contactData.events.labelId != 0).assertTrue();
      expect(contactData.groups.groupId != 0).assertTrue();
      expect(contactData.groups.title === null).assertFalse();
      done();
    });
    it("contactsApi_contactdata_test_400", 0, async function (done) {
      expect(contactData.imAddresses.imAddress === null).assertFalse();
      expect(contactData.imAddresses.labelName === null).assertFalse();
      expect(contactData.imAddresses.labelId != 0).assertTrue();
      expect(contactData.name.familyName === null).assertFalse();
      expect(contactData.name.familyNamePhonetic === null).assertFalse();
      expect(contactData.name.fullName === null).assertFalse();
      expect(contactData.name.givenName === null).assertFalse();
      expect(contactData.name.givenNamePhonetic === null).assertFalse();
      expect(contactData.name.middleName === null).assertFalse();
      expect(contactData.name.middleNamePhonetic === null).assertFalse();
      expect(contactData.name.namePrefix === null).assertFalse();
      expect(contactData.name.nameSuffix === null).assertFalse();
      done();
    });

    it("contactsApi_contactdata_test_500", 0, async function (done) {
      expect(contactData.nickName.nickName === null).assertFalse();
      expect(contactData.note.noteContent === null).assertFalse();
      expect(contactData.organization.name === null).assertFalse();
      expect(contactData.organization.title === null).assertFalse();
      expect(contactData.phoneNumbers.labelId != 0).assertTrue();
      expect(contactData.phoneNumbers.labelName === null).assertFalse();
      expect(contactData.phoneNumbers.phoneNumber === null).assertFalse();
      expect(contactData.portrait.uri === null).assertFalse();
      done();
    });

    it("contactsApi_contactdata_test_600", 0, async function (done) {
      console.info("contactData.postalAddresses.city != null"
      + contactData.postalAddresses.city
      + (contactData.postalAddresses.city != null));
      expect(contactData.postalAddresses.city === null).assertFalse();
      expect(contactData.postalAddresses.country === null).assertFalse();
      expect(contactData.postalAddresses.labelName === null).assertFalse();
      expect(contactData.postalAddresses.neighborhood === null).assertFalse();
      expect(contactData.postalAddresses.pobox === null).assertFalse();
      expect(contactData.postalAddresses.postalAddress === null).assertFalse();
      expect(contactData.postalAddresses.postcode === null).assertFalse();
      expect(contactData.postalAddresses.region === null).assertFalse();
      expect(contactData.postalAddresses.street === null).assertFalse();
      expect(contactData.postalAddresses.labelId != 0).assertTrue();
      done();
    });

    it("contactsApi_contactdata_test_700", 0, async function (done) {
      console.info("contactData.relations.labelName != null"
      + contactData.relations.labelName + (contactData.relations.labelName === null));
      expect(contactData.relations.labelId != 0).assertTrue();
      expect(contactData.relations.labelName === null).assertFalse();
      expect(contactData.relations.relationName === null).assertFalse();
      expect(contactData.sipAddresses.labelId != 0).assertTrue();
      expect(contactData.sipAddresses.labelName === null).assertFalse();
      expect(contactData.sipAddresses.sipAddress === null).assertFalse();
      expect(contactData.websites.website === null).assertFalse();
      done();
    });


    it("contactsApi_contactdata_test_800", 0, async function (done) {
      expect(contactsapi.Contact.INVALID_CONTACT_ID == -1).assertTrue();
      expect(contactsapi.Attribute.ATTR_CONTACT_EVENT ==
      contactData.contactAttributes.attributes[0]).assertTrue();
      expect(contactsapi.Attribute.ATTR_EMAIL == contactData.contactAttributes.attributes[1]).assertTrue();
      expect(contactsapi.Attribute.ATTR_GROUP_MEMBERSHIP ==
      contactData.contactAttributes.attributes[2]).assertTrue();
      expect(contactsapi.Attribute.ATTR_IM == contactData.contactAttributes.attributes[3]).assertTrue();
      expect(contactsapi.Attribute.ATTR_NAME == contactData.contactAttributes.attributes[4]).assertTrue();
      expect(contactsapi.Attribute.ATTR_NICKNAME == contactData.contactAttributes.attributes[5]).assertTrue();
      expect(contactsapi.Attribute.ATTR_NOTE == contactData.contactAttributes.attributes[6]).assertTrue();
      expect(contactsapi.Attribute.ATTR_ORGANIZATION == contactData.contactAttributes.attributes[7]).assertTrue();
      expect(contactsapi.Attribute.ATTR_PHONE == contactData.contactAttributes.attributes[8]).assertTrue();
      expect(contactsapi.Attribute.ATTR_PORTRAIT == contactData.contactAttributes.attributes[9]).assertTrue();
      expect(contactsapi.Attribute.ATTR_POSTAL_ADDRESS ==
      contactData.contactAttributes.attributes[10]).assertTrue();
      expect(contactsapi.Attribute.ATTR_RELATION == contactData.contactAttributes.attributes[11]).assertTrue();
      expect(contactsapi.Attribute.ATTR_SIP_ADDRESS == contactData.contactAttributes.attributes[12]).assertTrue();
      expect(contactsapi.Attribute.ATTR_WEBSITE == contactData.contactAttributes.attributes[13]).assertTrue();
      done();
    });

    it("contactsApi_contactdata_test_900", 0, async function (done) {
      expect(contactsapi.Email.CUSTOM_LABEL == 0).assertTrue();
      expect(contactsapi.Email.EMAIL_HOME == 1).assertTrue();
      expect(contactsapi.Email.EMAIL_WORK == 2).assertTrue();
      expect(contactsapi.Email.EMAIL_OTHER == 3).assertTrue();
      expect(contactsapi.Email.INVALID_LABEL_ID == -1).assertTrue();
      expect(contactsapi.Event.CUSTOM_LABEL == 0).assertTrue();
      expect(contactsapi.Event.EVENT_ANNIVERSARY == 1).assertTrue();
      expect(contactsapi.Event.EVENT_OTHER == 2).assertTrue();
      expect(contactsapi.Event.EVENT_BIRTHDAY == 3).assertTrue();
      expect(contactsapi.Email.INVALID_LABEL_ID == -1).assertTrue();
      expect(contactsapi.ImAddress.CUSTOM_LABEL == -1).assertTrue();
      expect(contactsapi.ImAddress.IM_AIM == 0).assertTrue();
      expect(contactsapi.ImAddress.IM_MSN == 1).assertTrue();
      expect(contactsapi.ImAddress.IM_YAHOO == 2).assertTrue();
      expect(contactsapi.ImAddress.IM_SKYPE == 3).assertTrue();
      expect(contactsapi.ImAddress.IM_QQ == 4).assertTrue();
      expect(contactsapi.ImAddress.IM_ICQ == 6).assertTrue();
      expect(contactsapi.ImAddress.IM_JABBER == 7).assertTrue();
      expect(contactsapi.ImAddress.INVALID_LABEL_ID == -2).assertTrue();
      done();
    });

    it("contactsApi_contactdata_test_1000", 0, async function (done) {
      expect(contactsapi.PhoneNumber.CUSTOM_LABEL == 0).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_HOME == 1).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_MOBILE == 2).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_WORK == 3).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_FAX_WORK == 4).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_FAX_HOME == 5).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_PAGER == 6).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_OTHER == 7).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_CALLBACK == 8).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_CAR == 9).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_COMPANY_MAIN == 10).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_ISDN == 11).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_MAIN == 12).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_OTHER_FAX == 13).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_RADIO == 14).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_TELEX == 15).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_TTY_TDD == 16).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_WORK_MOBILE == 17).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_WORK_PAGER == 18).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_ASSISTANT == 19).assertTrue();
      expect(contactsapi.PhoneNumber.NUM_MMS == 20).assertTrue();
      expect(contactsapi.PhoneNumber.INVALID_LABEL_ID == -1).assertTrue();
      expect(contactsapi.PostalAddress.CUSTOM_LABEL == 0).assertTrue();
      expect(contactsapi.PostalAddress.ADDR_HOME == 1).assertTrue();
      expect(contactsapi.PostalAddress.ADDR_WORK == 2).assertTrue();
      expect(contactsapi.PostalAddress.ADDR_OTHER == 3).assertTrue();
      expect(contactsapi.PostalAddress.INVALID_LABEL_ID == -1).assertTrue();
      done();
    });

    it("contactsApi_contactdata_test_1100", 0, async function (done) {
      expect(contactsapi.Relation.CUSTOM_LABEL == 0).assertTrue();
      expect(contactsapi.Relation.RELATION_ASSISTANT == 1).assertTrue();
      expect(contactsapi.Relation.RELATION_BROTHER == 2).assertTrue();
      expect(contactsapi.Relation.RELATION_CHILD == 3).assertTrue();
      expect(contactsapi.Relation.RELATION_DOMESTIC_PARTNER == 4).assertTrue();
      expect(contactsapi.Relation.RELATION_FATHER == 5).assertTrue();
      expect(contactsapi.Relation.RELATION_FRIEND == 6).assertTrue();
      expect(contactsapi.Relation.RELATION_MANAGER == 7).assertTrue();
      expect(contactsapi.Relation.RELATION_MOTHER == 8).assertTrue();
      expect(contactsapi.Relation.RELATION_PARENT == 9).assertTrue();
      expect(contactsapi.Relation.RELATION_PARTNER == 10).assertTrue();
      expect(contactsapi.Relation.RELATION_REFERRED_BY == 11).assertTrue();
      expect(contactsapi.Relation.RELATION_RELATIVE == 12).assertTrue();
      expect(contactsapi.Relation.RELATION_SISTER == 13).assertTrue();
      expect(contactsapi.Relation.RELATION_SPOUSE == 14).assertTrue();
      expect(contactsapi.Relation.INVALID_LABEL_ID == -1).assertTrue();
      expect(contactsapi.SipAddress.CUSTOM_LABEL == 0).assertTrue();
      expect(contactsapi.SipAddress.SIP_HOME == 1).assertTrue();
      expect(contactsapi.SipAddress.SIP_WORK == 2).assertTrue();
      expect(contactsapi.SipAddress.SIP_OTHER == 3).assertTrue();
      expect(contactsapi.SipAddress.INVALID_LABEL_ID == -1).assertTrue();
      done();
    });

    /**
 * @tc.number
 * @tc.name    Insert contact information
 * @tc.desc    Function test
 */
    it("contactsApi_insert_test_100", 0, async function (done) {
      try {
        var rawContactId = await contactsapi.addContact(contactData);
        console.info("contactsApi_insert_test_100 : rawContactId = " + rawContactId);
        gRawContactId = rawContactId;
        expect(gRawContactId > 0).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_insert_test_100 : raw_contact insert error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_delete_test_200
 * @tc.name    Delete contact information
 * @tc.desc    Function test
 */
    it("contactsApi_delete_test_200", 0, async function (done) {
      var deleteId = gRawContactId;
      try {
        var deleteCode = await contactsapi.deleteContact(deleteId);
        var gDelete = deleteCode;
        console.info("contactsApi_delete_test_200 : deleteCode = " + deleteCode);
        expect(gDelete == 0 || gDelete == -1).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_delete_test_200 : delete error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_update_test_300
 * @tc.name    Update contact information
 * @tc.desc    Function test
 */
    it("contactsApi_update_test_300", 0, async function (done) {
      var rawContactId = await contactsapi.addContact(contactData);
      console.info("contactsApi_insert_test_300 : rawContactId = " + rawContactId);
      gRawContactId = rawContactId;
      expect(rawContactId > 0).assertTrue();

      var updateValues = {
        id: gRawContactId, name: {
          fullName: "小红"
        }
      };
      var condition = {
        attributes: [6]
      }
      try {
        var updateCode = await contactsapi.updateContact(updateValues, condition);
        console.info("contactsApi_update_test_300 : updateCode = " + updateCode);
        expect(updateCode == 0).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_update_test_300 : update error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_contact_test_400
 * @tc.name    Query contacts information
 * @tc.desc    Function test
 */
    it("contactsApi_query_contact_test_400", 0, async function (done) {
      var queryId = await contactsapi.addContact(contactData);
      console.info("contactsApi_query_contact_test_400 : queryId = " + queryId);
      expect(queryId > 0).assertTrue();

      try {
        var resultSet = await contactsapi.queryContact(queryId);
        console.info("contactsApi_query_contact_test_400 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_contact_test_400 query error = " + error);
        expect().assertFalse();
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_contact_test_500
 * @tc.name    Query contacts information
 * @tc.desc    Function test
 */
    it("contactsApi_query_contact_test_500", 0, async function (done) {
      var queryId = gRawContactId;
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      expect(holder.bundleName === null).assertFalse();
      expect(holder.displayName === null).assertFalse();
      expect(holder.holderId != 0).assertTrue();
      try {
        var findKey = contactsapi.queryKey(queryId);
        var resultSet = await contactsapi.queryContact(findKey, holder);
        console.info("contactsApi_query_contact_test_500 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet === null).assertFalse();
        done();
      } catch (error) {
        console.info("contactsApi_query_contact_test_500 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_contact_test_600
 * @tc.name    Query contacts information
 * @tc.desc    Function test
 */
    it("contactsApi_query_contact_test_600", 0, async function (done) {
      var queryId = gRawContactId;
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      };
      var ContactAttributes = {
        attributes: [1, 5, 6]
      }
      try {
        var findKey = contactsapi.queryKey(queryId);
        var resultSet = await contactsapi.queryContact(findKey, holder, ContactAttributes);
        console.info("contactsApi_query_contact_test_600 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet === null).assertFalse();
        done();
      } catch (error) {
        console.info("contactsApi_query_contact_test_600 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_contacts_test_700
 * @tc.name    Query contacts information
 * @tc.desc    Function test
 */
    it("contactsApi_query_contacts_test_700", 0, async function (done) {
      try {
        var resultSet = await contactsapi.queryContacts();
        console.info("contactsApi_query_contacts_test_700 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_contacts_test_700 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_contacts_test_800
 * @tc.name    Query contacts information
 * @tc.desc    Function test
 */
    it("contactsApi_query_contacts_test_800", 0, async function (done) {
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      try {
        var resultSet = await contactsapi.queryContacts(holder);
        console.info("contactsApi_query_contacts_test_800 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_contacts_test_800 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_contacts_test_900
 * @tc.name    Query contacts information
 * @tc.desc    Function test
 */
    it("contactsApi_query_contacts_test_900", 0, async function (done) {
      var ContactAttributes = {
        attributes: [1, 5, 6]
      }
      try {
        var resultSet = await contactsapi.queryContacts(ContactAttributes);
        console.info("contactsApi_query_contacts_test_900 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_contacts_test_900 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_contacts_test_1000
 * @tc.name    Query contacts information
 * @tc.desc    Function test
 */
    it("contactsApi_query_contacts_test_1000", 0, async function (done) {
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      };
      var ContactAttributes = {
        attributes: [1, 5, 6]
      }
      try {
        var resultSet = await contactsapi.queryContacts(holder, ContactAttributes);
        console.info("contactsApi_query_contacts_test_1000 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_contacts_test_1000 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_email_test_1100
 * @tc.name    Query email information
 * @tc.desc    Function test
 */
    it("contactsApi_query_email_test_1100", 0, async function (done) {
      var email = "email";
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      try {
        var resultSet = await contactsapi.queryContactsByEmail(email, holder);
        console.info("contactsApi_query_email_test_1100 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_email_test_1100 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_email_test_1200
 * @tc.name    Query email information
 * @tc.desc    Function test
 */
    it("contactsApi_query_email_test_1200", 0, async function (done) {
      var email = "email";
      try {
        var resultSet = await contactsapi.queryContactsByEmail(email);
        console.info("contactsApi_query_email_test_1200 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_email_test_1200 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_email_test_1300
 * @tc.name    Query email information
 * @tc.desc    Function test
 */
    it("contactsApi_query_email_test_1300", 0, async function (done) {
      var email = "email";
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      };
      var ContactAttributes = {
        attributes: [1, 5, 6]
      }
      try {
        var resultSet = await contactsapi.queryContactsByEmail(email, holder, ContactAttributes);
        console.info("contactsApi_query_email_test_1300 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_email_test_1300 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_email_test_1400
 * @tc.name    Query email information
 * @tc.desc    Function test
 */
    it("contactsApi_query_email_test_1400", 0, async function (done) {
      var email = "email";
      var ContactAttributes = {
        attributes: [1, 5, 6]
      }
      try {
        var resultSet = await contactsapi.queryContactsByEmail(email, ContactAttributes);
        console.info("contactsApi_query_email_test_1400 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_email_test_1400 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_phoneNumber_test_1500
 * @tc.name    Query phoneNumber information
 * @tc.desc    Function test
 */
    it("contactsApi_query_phoneNumber_test_1500", 0, async function (done) {
      var phoneNumber = "183";
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      try {
        var resultSet = await contactsapi.queryContactsByPhoneNumber(phoneNumber, holder);
        console.info("contactsApi_query_phoneNumber_test_1500 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_phoneNumber_test_1500 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_phoneNumber_test_1600
 * @tc.name    Query phoneNumber information
 * @tc.desc    Function test
 */
    it("contactsApi_query_phoneNumber_test_1600", 0, async function (done) {
      var phoneNumber = "183";
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      };
      var ContactAttributes = {
        attributes: [1, 5, 6]
      }
      try {
        var resultSet = await contactsapi.queryContactsByPhoneNumber(phoneNumber, holder, ContactAttributes);
        console.info("contactsApi_query_phoneNumber_test_1600 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_phoneNumber_test_1600 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_phoneNumber_test_1700
 * @tc.name    Query phoneNumber information
 * @tc.desc    Function test
 */
    it("contactsApi_query_phoneNumber_test_1700", 0, async function (done) {
      var phoneNumber = "183";
      try {
        var resultSet = await contactsapi.queryContactsByPhoneNumber(phoneNumber);
        console.info("contactsApi_query_phoneNumber_test_1700 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_phoneNumber_test_1700 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_phoneNumber_test_1800
 * @tc.name    Query phoneNumber information
 * @tc.desc    Function test
 */
    it("contactsApi_query_phoneNumber_test_1800", 0, async function (done) {
      var phoneNumber = "183";
      var ContactAttributes = {
        attributes: [1, 5, 6]
      }
      try {
        var resultSet = await contactsapi.queryContactsByPhoneNumber(phoneNumber, ContactAttributes);
        console.info("contactsApi_query_phoneNumber_test_1800 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_phoneNumber_test_1800 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_group_test_1900
 * @tc.name    Query group
 * @tc.desc    Function test
 */
    it("contactsApi_query_group_test_1900", 0, async function (done) {
      try {
        var resultSet = await contactsapi.queryGroups();
        console.info("contactsApi_query_group_test_1900 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_group_test_1900 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_group_test_2000
 * @tc.name    Query group
 * @tc.desc    Function test
 */
    it("contactsApi_query_group_test_2000", 0, async function (done) {
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      try {
        var resultSet = await contactsapi.queryGroups(holder);
        console.info("contactsApi_query_group_test_2000 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_group_test_2000 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_holders_test_2200
 * @tc.name    Query holders information
 * @tc.desc    Function test
 */
    it("contactsApi_query_holders_test_2200", 0, async function (done) {
      try {
        var resultSet = await contactsapi.queryHolders();
        console.info("contactsApi_query_holders_test_2200 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet != null).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_holders_test_2200 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_key_test_2300
 * @tc.name    Query key information
 * @tc.desc    Function test
 */
    it("contactsApi_query_key_test_2300", 0, async function (done) {
      var idtest = gRawContactId;
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      try {
        var resultSet = await contactsapi.queryKey(idtest, holder);
        console.info("contactsApi_query_key_test_2300 : query resultSet = " + JSON.stringify(resultSet));
        expect(JSON.stringify(resultSet) === null).assertFalse();
        done();
      } catch (error) {
        console.info("contactsApi_query_key_test_2300 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_key_test_2400
 * @tc.name    Query key information
 * @tc.desc    Function test
 */
    it("contactsApi_query_key_test_2400", 0, async function (done) {
      var idtest = gRawContactId;
      console.info("contactsApi_query_key_test_2400 : query gRawContactId = " + idtest);
      try {
        var resultSet = await contactsapi.queryKey(idtest);
        console.info("contactsApi_query_key_test_2400 : query resultSet = " + JSON.stringify(resultSet));
        expect(JSON.stringify(resultSet) === null).assertFalse();
        done();
      } catch (error) {
        console.info("contactsApi_query_key_test_2400 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_query_mycard_test_2500
 * @tc.name    Query mycard information
 * @tc.desc    Function test
 */
    it("contactsApi_query_mycard_test_2500", 0, async function (done) {
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      try {
        var resultSet = await contactsapi.queryMyCard(holder);
        console.info("contactsApi_query_mycard_test_2500 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_mycard_test_2500 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_isMyCard_test_2600
 * @tc.name    Query mycard exist
 * @tc.desc    Function test
 */
    it("contactsApi_isMyCard_test_2600", 0, async function (done) {
      var id = 1;
      try {
        var isExist = await contactsapi.isMyCard(id);
        console.info("contactsApi_isMyCard_test_2600 : query isExist = " + isExist);
        expect(isExist == 0).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_isMyCard_test_2600 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  contactsApi_isLocalContact_test_2700
 * @tc.name    Query isLocalContact exist
 * @tc.desc    Function test
 */
    it("contactsApi_isLocalContact_test_2700", 0, async function (done) {
      var id = gRawContactId;
      try {
        var isExist = await contactsapi.isLocalContact(id);
        console.info("logMessage contactsApi_isLocalContact_test_2700 isExist = " + isExist);
        expect(isExist != -1).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_isLocalContact_test_2700 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_insert_test_2800
 * @tc.name    contactsApi_insert error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_insert_test_2800", 0, async function (done) {
      var contactDataError = {};
      try {
        var rawContactId = await contactsapi.addContact(contactDataError);
        console.info("abnormal_contactsApi_insert_test_2800 : rawContactId = " + rawContactId);
        expect(rawContactId == -1).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_insert_test_100 : raw_contact insert error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_update_test_3000
 * @tc.name    contactsApi_update error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_update_test_3000", 0, async function (done) {
      var rawContactId = -1;
      var updateValues = {
        id: rawContactId, name: {
          fullName: "小红"
        }
      };
      var condition = {
        attributes: [6]
      }
      try {
        var updateCode = await contactsapi.updateContact(updateValues, condition);
        console.info("abnormal_contactsApi_update_test_3000 : updateCode = " + updateCode);
        expect(updateCode === 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_update_test_3000 : update error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_query_contact_test_3100
 * @tc.name    contactsApi_query_contact error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_query_contact_test_3100", 0, async function (done) {
      var queryId = "-1";
      try {
        var resultSet = await contactsapi.queryContact(queryId);
        if (resultSet == null) {
          console.info("abnormal_contactsApi_query_contact_test_3100 is null");
        }
        if (resultSet == undefined) {
          console.info("abnormal_contactsApi_query_contact_test_3100 is undefined");
        }
        console.info("abnormal_contactsApi_query_contact_test_3100 : updateCode = " + JSON.stringify(resultSet));
        expect(resultSet == undefined).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_query_contact_test_3100 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_query_contacts_test_3200
 * @tc.name    contactsApi_query_contacts error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_query_contacts_test_3200", 0, async function (done) {
      var ContactAttributes = {
        attributes: [100]
      }
      try {
        var resultSet = await contactsapi.queryContacts(ContactAttributes);
        if (resultSet == null) {
          console.info("abnormal_contactsApi_query_contacts_test_3200 is null");
        }
        if (resultSet == undefined) {
          console.info("abnormal_contactsApi_query_contacts_test_3200 is undefined");
        }
        console.info(
          "abnormal_contactsApi_query_contacts_test_3200 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_query_contacts_test_3200 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_query_email_test_3300
 * @tc.name    contactsApi_query_email error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_query_email_test_3300", 0, async function (done) {
      var email = "email2222";
      try {
        var resultSet = await contactsapi.queryContactsByEmail(email);
        console.info("abnormal_contactsApi_query_email_test_3300 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_query_email_test_3300 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_query_phoneNumber_test_3400
 * @tc.name    contactsApi_query_phoneNumber error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_query_phoneNumber_test_3400", 0, async function (done) {
      var phoneNumber = "19999999";
      try {
        var resultSet = await contactsapi.queryContactsByPhoneNumber(phoneNumber);
        console.info(
          "abnormal_contactsApi_query_phoneNumber_test_3400 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_query_phoneNumber_test_3400 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_query_group_test_3500
 * @tc.name    contactsApi_query_group error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_query_group_test_3500", 0, async function (done) {
      var holder = {
        bundleName: "com.ohos.contacts2", displayName: "phone2", holderId: 2
      }
      try {
        var resultSet = await contactsapi.queryGroups(holder);
        console.info("abnormal_contactsApi_query_group_test_3500 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_query_group_test_2000 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_query_key_test_3600
 * @tc.name    contactsApi_query_key error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_query_key_test_3600", 0, async function (done) {
      var idtest = -1;
      try {
        var resultSet = await contactsapi.queryKey(idtest);
        console.info("abnormal_contactsApi_query_key_test_3600 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_query_key_test_3600 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_query_mycard_test_3700
 * @tc.name    contactsApi_query_mycard error
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_query_mycard_test_3700", 0, async function (done) {
      var ContactAttributes = {
        attributes: [100]
      };
      try {
        var resultSet = await contactsapi.queryMyCard(ContactAttributes);
        console.info(
          "abnormal_contactsApi_query_mycard_test_3700 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_query_mycard_test_3700 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_isMyCard_test_3800
 * @tc.name    isMyCard is not exist
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_isMyCard_test_3800", 0, async function (done) {
      var id = 999;
      try {
        var isExist = await contactsapi.isMyCard(id);
        console.info("abnormal_contactsApi_isMyCard_test_3800 : query isExist = " + isExist);
        expect(isExist == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_isMyCard_test_3800 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
 * @tc.number  abnormal_contactsApi_isLocalContact_test_3900
 * @tc.name    contactsApi_isLocalContact is not exist
 * @tc.desc    Function test
 */
    it("abnormal_contactsApi_isLocalContact_test_3900", 0, async function (done) {
      var id = 999;
      try {
        var isExist = await contactsapi.isLocalContact(id);
        console.info("abnormal_contactsApi_isLocalContact_test_3900 : query isExist = " + isExist);
        expect(isExist == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_isLocalContact_test_3900 query error = " + error);
        done();
      }
      sleep(500);
    });

    it("contactsApi_addContact_test_100", 0, async function (done) {
      contactsapi.addContact(contactData, (err, data) => {
        if (err) {
          done();
          return;
        }
        expect(JSON.stringify(data) != -1).assertTrue();
        done();
      });
      sleep(500);
    });

    it("contactsApi_deleteContact_test_100", 0, async function (done) {
      contactsapi.deleteContact('xxx', (err) => {
        if (err) {
          expect(JSON.stringify(err) == -1).assertTrue();
          done();
          return;
        }
        expect(false).assertTrue();
        done();
      });

      sleep(500);
    });


    it("contactsApi_queryContact_test_100", 0, async function (done) {
      contactsapi.queryContact('xxx', (err, data) => {
        if (err) {
          expect(false).assertTrue();
          done();
          return;
        }
        expect(JSON.stringify(data) == undefined).assertTrue();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContact_test_200", 0, async function (done) {
      contactsapi.queryContact('xxx', {
        holderId: 0
      }, (err, data) => {
        if (err) {
          expect(false).assertTrue();
          done();
          return;
        }
        expect(JSON.stringify(data) == undefined).assertTrue();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContact_test_300", 0, async function (done) {
      contactsapi.queryContact('xxx', {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(false).assertTrue();
          done();
          return;
        }
        expect(JSON.stringify(data) == undefined).assertTrue();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContact_test_400", 0, async function (done) {
      contactsapi.queryContact('xxx', {
        holderId: 0
      }, {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(false).assertTrue();
          done();
          return;
        }
        expect(JSON.stringify(data) == undefined).assertTrue();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContact_test_500", 0, async function (done) {
      let promise = contactsapi.queryContact('xxx', {
        holderId: 0
      }, {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      });
      promise.then((data) => {
        expect(JSON.stringify(data) == undefined).assertTrue();
        done();
      }).catch((err) => {
        expect(false).assertTrue();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContacts_test_100", 0, async function (done) {
      contactsapi.queryContacts((err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContacts_test_200", 0, async function (done) {
      contactsapi.queryContacts({
        holderId: 0
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContacts_test_300", 0, async function (done) {
      contactsapi.queryContacts({
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryContacts_test_400", 0, async function (done) {
      contactsapi.queryContacts({
        holderId: 0
      }, {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryContacts_test_500", 0, async function (done) {
      let promise = contactsapi.queryContacts({
        holderId: 0
      }, {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      });
      promise.then((data) => {
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      }).catch((err) => {
        expect(false).assertTrue();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContactsByPhoneNumber_test_000", 0, async function (done) {
      contactsapi.queryContactsByPhoneNumber('138xxxxxxxx', (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContactsByPhoneNumber_test_100", 0, async function (done) {
      contactsapi.queryContactsByPhoneNumber('138xxxxxxxx', {
        holderId: 0
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContactsByPhoneNumber_test_200", 0, async function (done) {
      contactsapi.queryContactsByPhoneNumber('138xxxxxxxx', {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContactsByPhoneNumber_test_300", 0, async function (done) {
      contactsapi.queryContactsByPhoneNumber('138xxxxxxxx', {
        holderId: 0
      }, {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryContactsByEmail_test_100", 0, async function (done) {
      contactsapi.queryContactsByEmail('xxx@email.com', (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryContactsByEmail_test_200", 0, async function (done) {
      contactsapi.queryContactsByEmail('xxx@email.com', {
        holderId: 0
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryContactsByEmail_test_300", 0, async function (done) {
      contactsapi.queryContactsByEmail('xxx@email.com', {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryContactsByEmail_test_400", 0, async function (done) {
      contactsapi.queryContactsByEmail('xxx@email.com', {
        holderId: 0
      }, {
        attributes: ["ATTR_EMAIL", "ATTR_NAME"]
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryGroups_test_100", 0, async function (done) {
      contactsapi.queryGroups((err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryGroups_test_200", 0, async function (done) {
      contactsapi.queryGroups({
        holderId: 0
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryHolders_test_100", 0, async function (done) {
      contactsapi.queryHolders((err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryKey_test_100", 0, async function (done) {
      contactsapi.queryKey( /*id*/
        1, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_queryKey_test_200", 0, async function (done) {
      contactsapi.queryKey( /*id*/
        1, {
        holderId: 1
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryMyCard_test_100", 0, async function (done) {
      contactsapi.queryMyCard((err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });


    it("contactsApi_queryMyCard_test_200", 0, async function (done) {
      contactsapi.queryMyCard({
        attributes: ['ATTR_EMAIL', 'ATTR_NAME']
      }, (err, data) => {
        if (err) {
          expect(JSON.stringify(data) === null).assertFalse();
          done();
          return;
        }
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      });
      sleep(500);
    });

    it("contactsApi_updateContact_test_100", 0, async function (done) {
      contactsapi.updateContact({
        name: {
          fullName: 'xxx'
        },
        phoneNumbers: [{
                         phoneNumber: '138xxxxxxxx'
                       }]
      }, (err) => {
        if (err) {
          expect(true).assertTrue();
          done();
          return;
        }
        console.info('updateContact success');
        done();
      });
      sleep(500);
    });

    it("contactsApi_updateContact_test_200", 0, async function (done) {
      contactsapi.updateContact({
        fullName: {
          fullName: 'xxx'
        },
        phoneNumbers: [{
                         phoneNumber: '138xxxxxxxx'
                       }]
      }, {
        attributes: ['ATTR_EMAIL', 'ATTR_NAME']
      }, (err) => {
        if (err) {
          expect(true).assertTrue();
          done();
          return;
        }
        console.info('updateContact success');
        done();
      });
      sleep(500);
    });

    it("contactsApi_isLocalContact_test_100", 0, async function (done) {
      contactsapi.isLocalContact( /*id*/
        1, (err, data) => {
        if (err) {
          expect(false).assertTrue();
          done();
          return;
        }
        done();
      });
      sleep(500);
    });

    it("contactsApi_isMyCard_test_100", 0, async function (done) {
      contactsapi.isMyCard( /*id*/
        1, (err, data) => {
        if (err) {
          expect(false).assertTrue();
          done();
          return;
        }
        done();
      });
      sleep(500);
    });

    it("contactsApi_sendMessage_test_100", 0, async function (done) {
      let sendCallback = function (err, data) {
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      }
      let deliveryCallback = function (err, data) {
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      }
      let slotId = 0;
      let content = '短信内容';
      let destinationHost = '+861xxxxxxxxxx';
      let serviceCenter = '+861xxxxxxxxxx';
      let destinationPort = 1000;
      let options = {
        slotId,
        content,
        destinationHost,
        serviceCenter,
        destinationPort,
        sendCallback,
        deliveryCallback
      };
      sms.sendMessage(options);
      done();
      sleep(500);
    });

    it("contactsApi_selectContact_test_100", 0, async function (done) {
      contactsapi.selectContact((err, data) => {
        expect(JSON.stringify(data) === null).assertFalse();
        done();
        sleep(500);
      });
    });

    it("contactsApi_selectContact_test_200", 0, async function (done) {
      let promise = contactsapi.selectContact();
      promise.then((data) => {
        expect(JSON.stringify(data) === null).assertFalse();
        done();
        sleep(500);
      }).catch((err) => {
        done();
      });
    });
  });
}