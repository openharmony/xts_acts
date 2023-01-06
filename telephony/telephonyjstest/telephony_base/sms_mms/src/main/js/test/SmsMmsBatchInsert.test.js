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

import featureAbility from "@ohos.ability.featureAbility";
import { describe, expect, it, beforeEach } from '@ohos/hypium';

export default function SmsMmsBatchInsert() {
    describe('SmsMmsBatchInsert', function () {

        const URL_DAH = "dataability:///com.ohos.smsmmsability";
        const URL_INFO = "dataability:///com.ohos.smsmmsability/sms_mms/sms_mms_info";
        const URL_INFO_ERR = "dataability:///com.ohos.smsmmsability/sms_mms/sms_mms_infos";
        const DAHelper = featureAbility.acquireDataAbilityHelper(URL_DAH);
        let smsMmsInfo = {
            "receiver_number": "134XXXXXXXX", //接收方号码  TEXT
            "sender_number": "135XXXXXXXX", //发送方号码  TEXT
            "is_sender": 1, //是否是发送方  0 - 接收方  1 - 发送方  integer
            "msg_type": 0, //消息类型  0主题、1图片、2视频、3音频、4文本、5名片 integer
            "sms_type": 1, //短息类型  0-普通，1-通知  integer
            "start_time": "1659506935398", //启始时间  TEXT
            "end_time": "1659506935399", //结束时间  TEXT
            "msg_state": 0, //消息状态   0：成功 ，1 ：失败 ， 2 ： 发送中... integer
            "msg_title": "message title", //消息标题  TEXT
            "msg_content": "The test text message content", //消息内容  TEXT
            "operator_service_number": "123456", //操作员服务号码  TEXT
            "is_lock": 0, //是否锁定  0-否，1-是  integer
            "is_collect": 0, //是否收藏  0-未收藏，1-已收藏  integer
            "is_read": 0, // 是否读取  0-已读，1-未读  integer
            "session_type": 0, //会话类型  0 - 普通  1 - 广播  2 - 群发  integer
            "retry_number": 0, //重试次数  integer
            "session_id": -1, //会话Id  integer
            "group_id": 1, //群组ID  integer
            "device_id": -1, //设备id integer
            "is_subsection": 0, //是否分支  0 - 否  1 - 是  integer
            "is_send_report": 1, //是否发送报告  0 - 否  1 - 是  integer
            "msg_code": 0
        }; //消息码  integer

        let smsMmsInfoErr = {
            "receiver_number_s": "134XXXXXXXX", //接收方号码  TEXT
            "sender_number": "135XXXXXXXX", //发送方号码  TEXT
            "is_sender_s": 1, //是否是发送方  0 - 接收方  1 - 发送方  integer
            "msg_type": 0, //消息类型  0主题、1图片、2视频、3音频、4文本、5名片 integer
            "sms_type": 1, //短息类型  0-普通，1-通知  integer
            "start_time": "1659506935398", //启始时间  TEXT
            "end_time": "1659506935399", //结束时间  TEXT
            "msg_state": 0, //消息状态   0：成功 ，1 ：失败 ， 2 ： 发送中... integer
            "msg_title": "message title", //消息标题  TEXT
            "msg_content": "The err test text message content", //消息内容  TEXT
            "operator_service_number": "123456", //操作员服务号码  TEXT
            "is_lock": 0, //是否锁定  0-否，1-是  integer
            "is_collect": 0, //是否收藏  0-未收藏，1-已收藏  integer
            "is_read": 0, // 是否读取  0-已读，1-未读  integer
            "session_type": 0, //会话类型  0 - 普通  1 - 广播  2 - 群发  integer
            "retry_number": 0, //重试次数  integer
            "session_id": -1, //会话Id  integer
            "group_id": 1, //群组ID  integer
            "device_id": -1, //设备id integer
            "is_subsection": 0, //是否分支  0 - 否  1 - 是  integer
            "is_send_report": 1, //是否发送报告  0 - 否  1 - 是  integer
            "msg_code": 0
        }; //消息码  integer

        beforeEach(async function () {
            if (DAHelper == null) {
                console.log('beforeEach get DAHelper fail.');
                return;
            }
            try {
                let dataQuery = await DAHelper.query(URL_INFO);
                console.log('beforeEach query Success, data: ' + JSON.stringify(dataQuery.rowCount));
                if (dataQuery.rowCount !== 0) {
                    let dataDel = await DAHelper.delete(URL_INFO);
                    console.log('beforeEach delete Success, data: ' + JSON.stringify(dataDel));
                }
            } catch (err) {
                console.log('beforeEach test fail, err : ' + JSON.stringify(err));
                return;
            }
        });

        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime){
                    return;
                }
            }
        }

        function ExpectTrue(data) {
            try {
                expect(data).assertTrue();
            } catch (err) {
                console.log('assertion failure');
            }
        }

        function ExpectFalse() {
            try {
                expect().assertFail();
            } catch (err) {
                console.log('assertion failure');
            }
        }

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Async_0100
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Async_0100', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Async_0100';
            let valuesBuckets = [];
            let num = 1;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfo;
            }
            DAHelper.batchInsert(URL_INFO, valuesBuckets, (data, err) => {
                if (err) {
                    console.log(CASE_NAME + ' batchInsert fail, err : ' + JSON.stringify(err));
                    ExpectFalse();
                    done();
                    return;
                }
                ExpectTrue(data.code === 0);
                console.log(CASE_NAME + ' batchInsert Success, data:' + JSON.stringify(data));
            });
            sleep(100);
            try {
                let data = await DAHelper.query(URL_INFO);
                ExpectTrue(data.rowCount === num);
                console.log(CASE_NAME + ' query Success, data: ' + JSON.stringify(data.rowCount));
                done();
            } catch (err) {
                console.log(CASE_NAME + ' query fail, err: ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Async_0200
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Async_0200', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Async_0200';
            let valuesBuckets = [];
            let num = 1;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfo;
            }
            DAHelper.batchInsert(URL_INFO_ERR, valuesBuckets, (data, err) => {
                if (err) {
                    console.log(CASE_NAME + ' batchInsert Success, err : ' + JSON.stringify(err));
                    ExpectTrue(true);
                    done();
                    return;
                }
                ExpectFalse();
                console.log(CASE_NAME + ' batchInsert failed, data:' + JSON.stringify(data));
                done();
            });
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Async_0300
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Async_0300', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Async_0300';
            let valuesBuckets = [];
            DAHelper.batchInsert(URL_INFO, valuesBuckets, (data, err) => {
                if (err) {
                    console.log(CASE_NAME + ' batchInsert fail, err : ' + JSON.stringify(err));
                    ExpectFalse();
                    done();
                    return;
                }
                ExpectTrue(data.code === 0);
                console.log(CASE_NAME + ' batchInsert Success, data:' + JSON.stringify(data));
            });
            sleep(100);
            try {
                let data = await DAHelper.query(URL_INFO);
                ExpectTrue(data.rowCount === 0);
                console.log(CASE_NAME + ' query Success, data: ' + JSON.stringify(data.rowCount));
                done();
            } catch (err) {
                console.log(CASE_NAME + ' query fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Async_0400
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Async_0400', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Async_0400';
            let valuesBuckets = [];
            let num = 248;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfo;
            }
            DAHelper.batchInsert(URL_INFO, valuesBuckets, (data, err) => {
                if (err) {
                    console.log(CASE_NAME + ' batchInsert fail, err : ' + JSON.stringify(err));
                    ExpectFalse();
                }
                ExpectTrue(data.code === 0);
                console.log(CASE_NAME + ' batchInsert Success, data:' + JSON.stringify(data));
            });
            sleep(2000);
            try {
                let data = await DAHelper.query(URL_INFO);
                ExpectTrue(data.rowCount === num);
                console.log(CASE_NAME + ' query Success, data:' + JSON.stringify(data.rowCount));
                done();
            } catch (err) {
                console.log(CASE_NAME + ' query fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Async_0500
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Async_0500', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Async_0500';
            let valuesBuckets = [];
            let num = 1;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfoErr;
            }
            DAHelper.batchInsert(URL_INFO, valuesBuckets, (data, err) => {
                if (err) {
                    console.log(CASE_NAME + ' batchInsert Success, err : ' + JSON.stringify(err));
                    ExpectTrue(true);
                    done();
                    return;
                }
                ExpectFalse();
                console.log(CASE_NAME + ' batchInsert failed, data:' + JSON.stringify(data));
                done();
            });
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Promise_0100
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Promise_0100', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Promise_0100';
            let valuesBuckets = [];
            let num = 1;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfo;
            }
            try {
                let data = await DAHelper.batchInsert(URL_INFO, valuesBuckets);
                ExpectTrue(data === 0);
                console.log(CASE_NAME + ' batchInsert Success, data:' + JSON.stringify(data));
            } catch (err) {
                console.log(CASE_NAME + ' batchInsert fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
            try {
                let data = await DAHelper.query(URL_INFO);
                ExpectTrue(data.rowCount === num);
                console.log(CASE_NAME + ' query Success, data:' + JSON.stringify(data.rowCount));
                done();
            } catch (err) {
                console.log(CASE_NAME + ' query fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Promise_0200
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Promise_0200', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Promise_0200';
            let valuesBuckets = [];
            let num = 1;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfo;
            }
            try {
                let data = await DAHelper.batchInsert(URL_INFO_ERR, valuesBuckets);
                ExpectTrue(data === -1);
                console.log(CASE_NAME + ' batchInsert Success, data:' + JSON.stringify(data));
                done();
                return;
            } catch (err) {
                console.log(CASE_NAME + ' batchInsert failed, err : ' + JSON.stringify(err));
                ExpectTrue(true);
                done();
            }
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Promise_0300
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Promise_0300', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Promise_0300';
            let valuesBuckets = [];
            try {
                let data = await DAHelper.batchInsert(URL_INFO, valuesBuckets);
                ExpectTrue(data === 0);
                console.log(CASE_NAME + ' batchInsert Success, data:' + JSON.stringify(data));
            } catch (err) {
                console.log(CASE_NAME + ' batchInsert fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
            sleep(100);
            try {
                let data = await DAHelper.query(URL_INFO);
                ExpectTrue(data.rowCount === 0);
                console.log(CASE_NAME + ' query Success, data:' + JSON.stringify(data.rowCount));
                done();
            } catch (err) {
                console.log(CASE_NAME + ' query fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Promise_0400
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Promise_0400', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Promise_0400';
            let valuesBuckets = [];
            let num = 100;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfo;
            }
            try {
                let data = await DAHelper.batchInsert(URL_INFO, valuesBuckets);
                ExpectTrue(data === 0);
                console.log(CASE_NAME + ' batchInsert Success, data:' + JSON.stringify(data));
            } catch (err) {
                console.log(CASE_NAME + ' batchInsert fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
            sleep(100);
            try {
                let data = await DAHelper.query(URL_INFO);
                ExpectTrue(data.rowCount === num);
                console.log(CASE_NAME + ' query Success, data:' + JSON.stringify(data.rowCount));
                done();
            } catch (err) {
                console.log(CASE_NAME + ' query fail, err : ' + JSON.stringify(err));
                ExpectFalse();
                done();
                return;
            }
        });

        /*
         * @tc.number  Telephony_SmsMms_batchInsert_Promise_0500
         * @tc.name
         * @tc.desc    Function test
         */
        it('Telephony_SmsMms_batchInsert_Promise_0500', 0, async function (done) {
            const CASE_NAME = 'Telephony_SmsMms_batchInsert_Promise_0500';
            let valuesBuckets = [];
            let num = 1;
            for (let i = 0; i < num; i++) {
                valuesBuckets[i] = smsMmsInfoErr;
            }
            try {
                let data = await DAHelper.batchInsert(URL_INFO, valuesBuckets);
                ExpectTrue(data === -1);
                console.log(CASE_NAME + ' batchInsert Success , data:' + JSON.stringify(data));
                done();
                return;
            } catch (err) {
                console.log(CASE_NAME + ' batchInsert failed, err : ' + JSON.stringify(err));
                ExpectTrue(true);
                done();
            }
        });
    });
}