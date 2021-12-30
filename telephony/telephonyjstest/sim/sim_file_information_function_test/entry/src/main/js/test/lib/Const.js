/**
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

export const OTHER_ABNORMAL = -2;
export const OTHER_ERRORS = -2;
export const GET_SIM_STATE_CHANGE = 'simStateChange';
export const CARD_NAME_ZERO = 'Card0';
export const TIMES_VALUE = {
  timeSpan: 5,
  testRunTime: 10
};
export const SIM_SET_STATE = 20000003;
export const HRIL_SIM_NOT_READY = '-1';
export const HRIL_SIM_NOT_INSERTED = 0;
export const HRIL_SIM_READY = '1';
export const TYPE_AND_INDEX = {
  type0: 0,
  type1: 1,
  type2: 2,
  type4: 4,
  index0: 0,
  index1: 1
};
export const CARD_NAME = {
  cardNameNull: '',
  cardName: '1234',
  cardNameYouXiao: '123@#ABCD',
  cardNameYouXiaoLong: '01234567890123456789_测@#$%ABCDE',
  nameYouXiao: '1',
  cardNumber: '1234',
  inputName: '012345678901234567890123456789qQ@',
  inputNullName: null,
  pinNumber: '123',
  pinNumberFour: '4321',
  pinNumberNine: '123456789',
  newPin: '1234',
  newPinThree: '123',
  newPinNine: '123456789',
  puk: '123',
  pukNine: '123456789',
  pukErr: '12345678',
  pukReserve: '87654321',
  oldPin: '1234',
  oldPinNine: '123456789'
};
export const OPERATOR_NUM_LENGTH = 5;
export const IMSI_LENGTH = 15;
export const ICC_LENGTH = 20;
export const SIM_SLOT_ID = {
  slotId0: 0,
  slotId1: 1,
  slotId2: 2,
  slotId4: 4,
  slotId11: -1
};
export const LOCK_SWITCH2 = {
  close: 0,
  open: 1
};
export const OPERATOR_CODE = {
  mobileCode1: '46000',
  mobileCode2: '46002',
  mobileCode3: '46004',
  mobileCode4: '46007',
  unicomCode1: '46004',
  unicomCode2: '46006',
  unicomCode3: '46009',
  telecomCode1: '46003',
  telecomCode2: '46005',
  telecomCode3: '46011',
};
export const CARD_INFO = {
  newCardName: '1234',
  newCardNumber: '1234'
};
export const ERR_PIN2 = '12345678';
export const PIN2 = '';
export const NOT_PIN2 = '';
export const PUK2 = '';
export const NOT_PUK2 = '';
export const PHONE_NUMBER_LENGTH = 11;