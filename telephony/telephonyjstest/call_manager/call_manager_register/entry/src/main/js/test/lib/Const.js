/**
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
export const AUTO_ACCEPT_NUMBER = '';

export const NOT_ACCEPT_NUMBER = '';
export const NULL_PHONE_NUMBER = '';
export const PHONE_NUMBER_LENGTH_11 = '';
export const PHONE_NUMBER_AREA_LAND = '';
export const PHONE_NUMBER_VOICE_MAIL = '';
export const PHONE_NUMBER_LONG = '';
export const PHONE_NUMBER_LENGTH_8 = '';
export const RIGHT_PASSWORD = '';
export const ERROR_PASSWORD = '';

export const BOUNDARY_NUMBER_INT = 2147483649;
export const TEST_RELY_NUMBER = 10; // test count for Reliability
export const TEST_PERF_COUNT = 20; // test count for Perfomace
export const PERF_GOAL_TIME = TEST_PERF_COUNT * 0.5;

export const CALL_STATUS_ACTIVE = 0;
export const CALL_STATUS_HOLDIN = 1;
export const CALL_STATUS_DIALING = 2;
export const CALL_STATUS_ALERTING = 3;
export const CALL_STATUS_INCOMING = 4;
export const CALL_STATUS_WAITING = 5;
export const CALL_STATUS_DISCONNECTED = 6;
export const CALL_STATUS_DISCONNECTING = 7;
export const CALL_STATUS_IDLE = 8;

export const TEL_CONFERENCE_IDLE = 0;
export const TEL_CONFERENCE_ACTIVE = 1;
export const TEL_CONFERENCE_DISCONNECTING = 2;
export const TEL_CONFERENCE_DISCONNECTED = 3;

export const DEVICE_EARPIECE = 0;
export const DEVICE_SPEAKER = 1;
export const DEVICE_WIRED_HEADSET = 2;
export const DEVICE_BLUETOOTH_SCO = 3;
export const DEVICE_INVALID = -1;
export const DEVICE_INVALID4 = 4;

export const RESTRICTION_MODE_DEACTIVATION = 0;
export const RESTRICTION_MODE_ACTIVATION = 1;
export const RESTRICTION_MODE_INVALID = -1;
export const RESTRICTION_MODE_INVALID2 = 2;

export const RESTRICTION_DISABLE = 0;
export const RESTRICTION_ENABLE = 1;

export const RESTRICTION_TYPE_ALL_INCOMING = 0;
export const RESTRICTION_TYPE_ALL_OUTGOING = 1;
export const RESTRICTION_TYPE_INTERNATIONAL = 2;
export const RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME = 3;
export const RESTRICTION_TYPE_ROAMING_INCOMING = 4;
export const RESTRICTION_TYPE_ALL_CALLS = 5;
export const RESTRICTION_TYPE_OUTGOING_SERVICES = 6;
export const RESTRICTION_TYPE_INCOMING_SERVICES = 7;
export const RESTRICTION_TYPE_INVALID = -1;
export const RESTRICTION_TYPE_INVALID8 = 8;

export const DEFAULT_SLOT_ID = 0;
export const SLOT_ID1 = 1;
export const SLOT_ID_INVALID = -1;
export const SLOT_ID_INVALID_2 = 2;
export const CALL_ID_NOT_EXIST = 999;
export const VIDEO_STATE_AUDIO = 0;
export const CALL_TYPE_CS = 0;

export const EVENT_START_DTMF_SUCCESS = 5;
export const EVENT_STOP_DTMF_SUCCESS = 7;

export const CALL_STATE_UNKNOWN = -1;
export const CALL_STATE_IDLE = 0;
export const CALL_STATE_RINGING = 1;
export const CALL_STATE_OFFHOOK = 2;

export const TIMEOUT_LENTH = 1000;

// call error code
export const CALL_MANAGER_NUMBER_NULL_NOTICE = '83951616';

export const CALLTRANSFER_SERVICE_ON = 1; // open
export const CALLTRANSFER_SERVICE_OFF = 0; // close

export const TRANSFERSETTING_ENABLE = 0;
export const TRANSFERSETTING_DISABLE = 1;
export const TRANSFERSETTING_REGISTRATION = 3; // open tran function
export const TRANSFERSETTING_ERASURE = 4; // close tran function
export const TRANSFER_INVALID = -1;
export const TRANSFER_INVALID5 = 5;
export const TRANSFER_INVALID2 = 2;

export const TRANSFER_DISABLE = 0; // tran is close
export const TRANSFER_ENABLE = 1; // tran is open

export const TRANSFER_TYPE_UNCONDITIONAL = 0; // unconditional tran
export const TRANSFER_TYPE_BUSY = 1; // tran busy
export const TRANSFER_TYPE_NO_REPLY = 2;// no response tran
export const TRANSFER_TYPE_NOT_REACHABLE = 3; // untouchable（no signal/shut down） tran
export const TRANSFER_TYPE_INVALID = -1;
export const TRANSFER_TYPE_INVALID4 = 4;

export const REACH_TIMES = 10;
export const AFTER_HANUP_TIMES = 5;
