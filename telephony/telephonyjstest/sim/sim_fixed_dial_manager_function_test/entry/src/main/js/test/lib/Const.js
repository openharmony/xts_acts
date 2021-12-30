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

export const SIM_SLOTID0 = 0;
export const SIM_SLOTID1 = 1;
export const SIM_SLOTID2 = 2;
export const SIM_SLOTID11 = -1;

export const CORRECT_PIN2 = '87968263';
export const INCORRECT_PIN2 = '1234';
export const INCORRECT_PIN2_REVERSE = '4321';
export const INCORRECT_PIN2_LEN3 = '123';
export const INCORRECT_PIN2_LEN9 = '123@#ABCD';

export const CORRECT_PUK2 = '06315781';
export const INCORRECT_PUK2 = '123456';
export const INCORRECT_PUK2_LEN3 = '123';
export const INCORRECT_PUK2_LEN8 = '12345678';
export const INCORRECT_PUK2_LEN9 = '123@#ABCD';

export const UNLOCKPIN2_STATE_CODE = { SUCCESS: 0, FAILURE: -1, EXCEPTION: -2 };
export const ALTERPIN2_STATE_CODE = { SUCCESS: 0, FAILURE: -1, EXCEPTION: -2 };
export const UNLOCKPUK2_STATE_CODE = { SUCCESS: 0, FAILURE: -1, EXCEPTION: -2 };