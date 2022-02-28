/**
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

import featureAbility from '@ohos.ability.featureAbility'
import {describe, expect, it} from 'deccjsunit/index.ets'

const URI_CONTACTS = 'dataability:///com.ohos.contactsdataability';
const contactUri = 'dataability:///com.ohos.contactsdataability/contacts/groups';

const INSERT_ONE = 'dataAbility_insert_test ';
const QUERY_TWO = 'dataAbility_query_test ';
const UPDATE_THREE = 'dataAbility_update_test ';
const DELETE_FOUR = 'dataAbility_delete_test ';

export default function dataAbilityHelperJsunit() {
    var dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_CONTACTS);
    var pacMap = {
        'group_name': 'test1',
        'ringtone_modify_time': 28
    };

    var pacMap_3 = {
        'group_name': 'test3',
        'ringtone_modify_time': 20
    };

    var pacMap_4 = {
        'group_name': 'test4',
        'ringtone_modify_time': 40
    };

    describe('appInfoTest', function () {
        console.log('-----------------------ScreenlockTest is starting-----------------------');

        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                return;
            }
        }

        /*
         * @tc.number: dataAbility_insert_test_001
         * @tc.name: call : Inserts a single data record into the database.
         * @tc.desc: Check the return value of the interface (by AsyncCallback)
         * @tc.level   0
         */
        it(INSERT_ONE + '001', 0, async function (done) {
            console.log(INSERT_ONE + '001  start......');
            dataAbilityHelper.call(contactUri, 'insert', '', pacMap, (err, data) => {
                if (err) {
                    console.error(INSERT_ONE + '001 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(INSERT_ONE + '001  succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                expect(typeof (data.result)).assertEqual("number");
                expect(data.result > 0).assertTrue();
            });
            done();
            console.log(INSERT_ONE + '001 end ......');
        });

        /*
         * @tc.number: dataAbility_insert_test_002
         * @tc.name: call : Inserts a single data record into the database.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(INSERT_ONE + '002', 0, async function (done) {
            console.log(INSERT_ONE + '002  start......');
            pacMap.group_name = 'test2';
            dataAbilityHelper.call(contactUri, 'insert', '', pacMap).then((data) => {
                console.info(INSERT_ONE + '002   succeeded   data: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                expect(typeof (data.result)).assertEqual("number");
                expect(data.result > 0).assertTrue();
            }).catch((error) => {
                console.error(INSERT_ONE + '002   error: ' + JSON.stringify(error));
            });
            done();
            console.log(INSERT_ONE + '002  end......');
        });

        /*
         * @tc.number: dataAbility_query_test_001
         * @tc.name: call : Queries data in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(QUERY_TWO + '001', 0, async function (done) {
            console.log(QUERY_TWO + '001 start......');
            let arg = "{\"equalTo\": \"group_name\"}";
            let pacMap = {
                "group_name": "test1",
                "columns": "group_name,ringtone_modify_time"
            };
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(QUERY_TWO + '001 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(QUERY_TWO + '001 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                expect(typeof (data.result)).assertEqual("string");
            });
            done();
            console.log(QUERY_TWO + '001 end......');
        });

        /*
         * @tc.number: dataAbility_query_test_002
         * @tc.name: call : Queries data in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(QUERY_TWO + '002', 0, async function (done) {
            console.log(QUERY_TWO + '002 start......');
            let arg = "{\"between\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': "15, 30",
                "columns": "group_name,ringtone_modify_time"
            };
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(QUERY_TWO + '002 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(QUERY_TWO + '002 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                expect(typeof (data.result)).assertEqual("string");
            });
            done();
            console.log(QUERY_TWO + '002 end......');
        });

        /*
         * @tc.number: dataAbility_query_test_003
         * @tc.name: call : Queries data in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(QUERY_TWO + '003', 0, async function (done) {
            console.log(QUERY_TWO + '003 start......');
            let arg = {
                'like': 'group_name'
            };
            let pacMap = {
                'group_name': '%test3%',
                'columns': 'group_name,ringtone_modify_time'
            };
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(QUERY_TWO + '003 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(QUERY_TWO + '003 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual('object');
                expect(typeof (data.result)).assertEqual('string');
            });
            done();
            console.log(QUERY_TWO + '003 end......');
        });

        /*
         * @tc.number: dataAbility_query_test_004
         * @tc.name: call : Queries data in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(QUERY_TWO + '004', 0, async function (done) {
            console.log(QUERY_TWO + '004 start......');
            let arg = {
                'greaterThanOrEqualTo': 'ringtone_modify_time'
            };
            let pacMap = {
                'ringtone_modify_time': 40,
                'columns': 'group_name,ringtone_modify_time'
            };
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(QUERY_TWO + '004 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(QUERY_TWO + '003 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual('object');
                expect(typeof (data.result)).assertEqual('string');
            });
            done();
            console.log(QUERY_TWO + '003 end......');
        });

        /*
         * @tc.number: dataAbility_update_test_001
         * @tc.name: call : Updates data records in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(UPDATE_THREE + '001', 0, async function (done) {
            console.log(UPDATE_THREE + '001 start......');
            let arg = "{\"equalTo\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': 28,
                'group_name': 'testupdata1'
            };
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(UPDATE_THREE + '001 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(UPDATE_THREE + '001 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                expect(typeof (data.result)).assertEqual("number");
                expect(data.result).assertEqual(0);
            });
            done();
            console.log(UPDATE_THREE + '001 end......');
        });

        /*
         * @tc.number: dataAbility_update_test_002
         * @tc.name: call : Updates data records in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(UPDATE_THREE + '002', 0, async function (done) {
            console.log(UPDATE_THREE + '002 start......');
            let arg = "{\"between\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': "15, 30",
                'group_name': 'testupdata2'
            };
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(UPDATE_THREE + '002 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(UPDATE_THREE + '002 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                expect(typeof (data.result)).assertEqual("number");
                expect(data.result).assertEqual(0);
            });
            done();
            console.log(UPDATE_THREE + '002 end......');
        });

        /*
         * @tc.number: dataAbility_update_test_003
         * @tc.name: call : Updates data records in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(UPDATE_THREE + '003', 0, async function (done) {
            console.log(UPDATE_THREE + '003 start......');
            let arg = {
                'contains': 'group_name'
            };
            let pacMap = {
                'group_name': 'ata2',
                'ringtone_modify_time': 100
            };
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(UPDATE_THREE + '003 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(UPDATE_THREE + '003 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual('object');
                expect(typeof (data.result)).assertEqual('number');
                expect(data.result).assertEqual(0);
            });
            done();
            console.log(UPDATE_THREE + '003 end......');
        });

        /*
         * @tc.number: dataAbility_update_test_004
         * @tc.name: call : Updates data records in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(UPDATE_THREE + '004', 0, async function (done) {
            console.log(UPDATE_THREE + '004 start......');
            let arg = {
                'lessThan': 'ringtone_modify_time'
            };
            let pacMap = {
                'ringtone_modify_time': 32,
                'group_name': 'testupdata2'
            };
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(UPDATE_THREE + '004 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(UPDATE_THREE + '004 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual('object');
                expect(typeof (data.result)).assertEqual('number');
                expect(data.result).assertEqual(0);
            });
            done();
            console.log(UPDATE_THREE + '004 end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_001
         * @tc.name: call : Deletes one or more data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */

        //insert one record1
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap, (err, data) => {
            if (err) {
                console.error('Operation failed1. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded1: ' + JSON.stringify(data));
        });

        it(DELETE_FOUR + '001', 0, async function (done) {
            console.log(DELETE_FOUR + '001 start......');
            let arg2 = "{\"equalTo\": \"group_name\"}";
            let pacMap2 = {
                'group_name': 'test1'
            };
            dataAbilityHelper.call(contactUri, 'delete', arg2, pacMap2, (err2, data2) => {
                if (err2) {
                    console.error(DELETE_FOUR + '001 error: ' + JSON.stringify(err2));
                    return;
                }
                console.info(DELETE_FOUR + '001 succeeded: ' + JSON.stringify(data2));
                expect(typeof (data2)).assertEqual("object");
                expect(typeof (data2.result)).assertEqual("number");
                expect(data2.result).assertEqual(0);
            });
            done();
            console.log(DELETE_FOUR + '001 end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_002
         * @tc.name: call : Deletes one or more data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(DELETE_FOUR + '002', 0, async function (done) {
            console.log(DELETE_FOUR + '002 start......');
            let arg = "{\"lessThan\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': 32,
            };
            dataAbilityHelper.call(contactUri, 'delete', arg, pacMap, (err, data) => {
                if (err) {
                    console.error(DELETE_FOUR + '002 error: ' + JSON.stringify(err));
                    return;
                }
                console.info(DELETE_FOUR + '002 succeeded: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                expect(typeof (data.result)).assertEqual("number");
                expect(data.result).assertEqual(0);
            });
            done();
            console.log(DELETE_FOUR + '002 end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_003
         * @tc.name: call : Deletes one or more data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */

        //insert one record3
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap_3, (err, data) => {
            if (err) {
                console.error('Operation failed3. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded3: ' + JSON.stringify(data));
        });

        it(DELETE_FOUR + '003', 0, async function (done) {
            console.log(DELETE_FOUR + '003 start......');
            let arg2 = {
                'like': 'group_name'
            };
            let pacMap2 = {
                'group_name': '%test3%'
            };
            dataAbilityHelper.call(contactUri, 'delete', arg2, pacMap2, (err2, data2) => {
                if (err2) {
                    console.error(DELETE_FOUR + '003 error: ' + JSON.stringify(err2));
                    return;
                }
                console.info(DELETE_FOUR + '003 delete succeeded: ' + JSON.stringify(data2));
                expect(typeof (data2)).assertEqual('object');
                expect(typeof (data2.result)).assertEqual('number');
                expect(data2.result).assertEqual(0);
            });
            done();
            console.log(DELETE_FOUR + '003 delete end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_004
         * @tc.name: call : Deletes one or more data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */

        //insert one record4
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap_4, (err, data) => {
            if (err) {
                console.error('Operation failed4. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded4: ' + JSON.stringify(data));
        });
        it(DELETE_FOUR + '004', 0, async function (done) {
            console.log(DELETE_FOUR + '004 start......');
            let arg2 = {
                'greaterThanOrEqualTo': 'ringtone_modify_time'
            };
            let pacMap2 = {
                'ringtone_modify_time': 40
            };
            dataAbilityHelper.call(contactUri, 'delete', arg2, pacMap2, (err2, data2) => {
                if (err2) {
                    console.error(DELETE_FOUR + '004 error: ' + JSON.stringify(err2));
                    return;
                }
                console.info(DELETE_FOUR + '004 delete succeeded: ' + JSON.stringify(data2));
                expect(typeof (data2)).assertEqual('object');
                expect(typeof (data2.result)).assertEqual('number');
                expect(data2.result).assertEqual(0);
            });
            done();
            console.log(DELETE_FOUR + '004 delete end......');
        });
    })
}

