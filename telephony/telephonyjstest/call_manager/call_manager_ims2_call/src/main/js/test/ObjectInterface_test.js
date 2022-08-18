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

import contactsapi from "@ohos.contact";
import {afterAll, afterEach, beforeAll, beforeEach, describe, expect, it} from '@ohos/hypium'

export default function ObjectInterfaceTest() {
    describe('ObjectInterfaceTest', function () {
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                return;
            }
        }
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
            console.info("contactData.key" + (contactData.key=="0"));
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
            +(contactData.postalAddresses.city != null));
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
            + contactData.relations.labelName +(contactData.relations.labelName === null));
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

    });
}