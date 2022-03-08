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
const contactUri2 = 'dataability:///com.ohos.contactsdataability/contacts/groups2';
import Utils from './Utils';

const INSERT_ONE = 'dataAbility_insert_test ';
const QUERY_TWO = 'dataAbility_query_test ';
const UPDATE_THREE = 'dataAbility_update_test ';
const DELETE_FOUR = 'dataAbility_delete_test ';

export default function DataAbilityJsunit() {
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

        /*
         * @tc.number: dataAbility_insert_test_001
         * @tc.name: call : Inserts a single data record into the database.
         * @tc.desc: Check the return value of the interface (by AsyncCallback)
         * @tc.level   0
         */
        it(INSERT_ONE + '001', 0, async function (done) {
            let details;
            let wrong;
            console.log(INSERT_ONE + '001  start......');
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'insert', '', pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(INSERT_ONE + '001', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(INSERT_ONE + '001 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(INSERT_ONE + '001   succeeded   data: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 1) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong;
            console.log(INSERT_ONE + '002  start......');
            pacMap.group_name = 'test2';
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'insert', '', pacMap).then((data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(INSERT_ONE + '002', timeOldStamp, timeNewStamp);
                details = data;
                console.info(INSERT_ONE + '002   succeeded   data: ' + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.error(INSERT_ONE + '002   error: ' + JSON.stringify(error));
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 1) : expectDetails(wrong, true, 2);
            done();
            console.log(INSERT_ONE + '002  end......');
        });

        /*
         * @tc.number: dataAbility_insert_test_003
         * @tc.name: call : Inserts a incorrect uri data record into the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(INSERT_ONE + '003', 0, async function (done) {
            let details;
            let wrong;
            console.log(INSERT_ONE + '003 start......');
            dataAbilityHelper.call(contactUri2, 'insert', '', pacMap).then((data) => {
                details = data
                console.info(INSERT_ONE + '003 succeeded: ' + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.error(INSERT_ONE + '003 error: ' + JSON.stringify(error));
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 1) : expectDetails(wrong, true, 2);
            done();
            console.log(INSERT_ONE + '003  end......');
        });

        /*
         * @tc.number: dataAbility_insert_test_004
         * @tc.name: call : Inserts a null uri data record into the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(INSERT_ONE + '004', 0, async function (done) {
            let details;
            let wrong;
            console.log(INSERT_ONE + '004 start......');
            dataAbilityHelper.call('', 'insert', '', pacMap).then((data) => {
                details = data;
                console.info(INSERT_ONE + '004  succeeded: ' + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.error(INSERT_ONE + '004  error: ' + JSON.stringify(error));
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 1) : expectDetails(wrong, true, 2);
            done();
            console.log(INSERT_ONE + '004  end......');
        });

        /*
         * @tc.number: dataAbility_insert_test_005
         * @tc.name: call : Inserts a null methold data record into the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(INSERT_ONE + '005', 0, async function (done) {
            let details;
            let wrong;
            console.log(INSERT_ONE + '005 start......');
            let pacMap = {
                'group_name': 'test4',
                'ringtone_modify_time': 28
            };
            dataAbilityHelper.call(contactUri, "", "", pacMap).then((data) => {
                details = data;
                console.info(INSERT_ONE + '005 succeeded: ' + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.error(INSERT_ONE + '005 error: ' + JSON.stringify(error));
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 1) : expectDetails(wrong, true, 2);
            done();
            console.log(INSERT_ONE + '005 end......');
        });

        /*
         * @tc.number: dataAbility_query_test_001
         * @tc.name: call : Queries data in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(QUERY_TWO + '001', 0, async function (done) {
            let details;
            let wrong;
            console.log(QUERY_TWO + '001 start......');
            let arg = "{\"equalTo\": \"group_name\"}";
            let pacMap = {
                "group_name": "test1",
                "columns": "group_name,ringtone_modify_time"
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(QUERY_TWO + '001', timeOldStamp, timeNewStamp);
                wrong = err;
                if (wrong) {
                    console.error(QUERY_TWO + '001 error: ' + JSON.stringify(wrong));
                } else {
                    details = data;
                    console.info(QUERY_TWO + '001 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, false, 4) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong;
            console.log(QUERY_TWO + '002 start......');
            let arg = "{\"between\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': "15, 30",
                "columns": "group_name,ringtone_modify_time"
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(QUERY_TWO + '002', timeOldStamp, timeNewStamp);
                wrong = err;
                if (wrong) {
                    console.error(QUERY_TWO + '002 error: ' + JSON.stringify(wrong));
                } else {
                    details = data;
                    console.info(QUERY_TWO + '002 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, false, 4) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong;
            console.log(QUERY_TWO + '003 start......');
            let arg = {
                'like': 'group_name'
            };
            let pacMap = {
                'group_name': '%test%',
                'columns': 'group_name,ringtone_modify_time'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(QUERY_TWO + '003', timeOldStamp, timeNewStamp);
                wrong = err;
                if (wrong) {
                    console.error(QUERY_TWO + '003 error: ' + JSON.stringify(wrong));
                } else {
                    details = data;
                    console.info(QUERY_TWO + '003 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, false, 4) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong;
            console.log(QUERY_TWO + '004 start......');
            let arg = {
                'greaterThanOrEqualTo': 'ringtone_modify_time'
            };
            let pacMap = {
                'ringtone_modify_time': 20,
                'columns': 'group_name,ringtone_modify_time'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'query', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(QUERY_TWO + '004', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(QUERY_TWO + '004 error: ' + JSON.stringify(err));
                    return;
                } else {
                    details = data;
                    console.info(QUERY_TWO + '004 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, false, 4) : expectDetails(wrong, true, 2);
            done();
            console.log(QUERY_TWO + '004 end......');
        });

        /*
         * @tc.number: dataAbility_query_test_005
         * @tc.name: call : Queries abnormal data in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(QUERY_TWO + '005', 0, async function (done) {
            let details;
            let wrong;
            let pacMap = {
                'ringtone_modify_time': 20,
                'columns': 'group_name,ringtone_modify_time'
            };
            console.log(INSERT_ONE + '003 start......');
            dataAbilityHelper.call(contactUri2, 'query', '', pacMap).then((data) => {
                details = data
                console.info(QUERY_TWO + '005 succeeded: ' + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.error(QUERY_TWO + '005 error: ' + JSON.stringify(error));
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, false, 4) : expectDetails(wrong, true, 2);
            done();
            console.log(QUERY_TWO + '005  end......');
        });

        /*
         * @tc.number: dataAbility_query_test_006
         * @tc.name: call : Queries abnormal data in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(QUERY_TWO + '006', 0, async function (done) {
            let details;
            let wrong;
            let pacMap = {
                'ringtone_modify_time': 20,
                'columns': 'group_name,ringtone_modify_time'
            };
            console.log(QUERY_TWO + '004 start......');
            dataAbilityHelper.call('', 'query', '', pacMap).then((data) => {
                details = data;
                console.info(QUERY_TWO + '006  succeeded: ' + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.error(QUERY_TWO + '006  error: ' + JSON.stringify(error));
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, false, 4) : expectDetails(wrong, true, 2);
            done();
            console.log(QUERY_TWO + '006  end......');
        });

        /*
         * @tc.number: dataAbility_update_test_001
         * @tc.name: call : Updates data records in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(UPDATE_THREE + '001', 0, async function (done) {
            let details;
            let wrong;
            console.log(UPDATE_THREE + '001 start......');
            let arg = "{\"equalTo\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': 28,
                'group_name': 'testupdata1'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(UPDATE_THREE + '001', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(UPDATE_THREE + '001 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(UPDATE_THREE + '001 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong;
            console.log(UPDATE_THREE + '002 start......');
            let arg = "{\"between\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': "15, 30",
                'group_name': 'testupdata2'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(UPDATE_THREE + '002', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(UPDATE_THREE + '002 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(UPDATE_THREE + '002 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong;
            console.log(UPDATE_THREE + '003 start......');
            let arg = {
                'contains': 'group_name'
            };
            let pacMap = {
                'group_name': 'ata2',
                'ringtone_modify_time': 100
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(UPDATE_THREE + '003', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(UPDATE_THREE + '003 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(UPDATE_THREE + '003 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong;
            console.log(UPDATE_THREE + '004 start......');
            let arg = {
                'lessThan': 'ringtone_modify_time'
            };
            let pacMap = {
                'ringtone_modify_time': 32,
                'group_name': 'testupdata2'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'update', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(UPDATE_THREE + '004', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(UPDATE_THREE + '004 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(UPDATE_THREE + '004 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(UPDATE_THREE + '004 end......');
        });

        /*
         * @tc.number: dataAbility_update_test_005
         * @tc.name: call : Updates abnormal data records in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(UPDATE_THREE + '005', 0, async function (done) {
            let details;
            let wrong;
            console.log(UPDATE_THREE + '005 start......');

            let pacMap = {
                'ringtone_modify_time': 32,
                'group_name': 'testupdata2'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri2, 'update', '', pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(UPDATE_THREE + '005', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(UPDATE_THREE + '005 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(UPDATE_THREE + '005 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(UPDATE_THREE + '005 end......');
        });

        /*
         * @tc.number: dataAbility_update_test_006
         * @tc.name: call : Updates abnormal data records in the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        it(UPDATE_THREE + '006', 0, async function (done) {
            let details;
            let wrong;
            console.log(UPDATE_THREE + '006 start......');
            let pacMap = {
                'ringtone_modify_time': 32,
                'group_name': 'testupdata2'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call('', 'update', '', pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(UPDATE_THREE + '006', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(UPDATE_THREE + '006 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(UPDATE_THREE + '006 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(UPDATE_THREE + '006 end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_001
         * @tc.name: call : Deletes one or more data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap, (err, data) => {
            if (err) {
                console.error('Operation failed1. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded1: ' + JSON.stringify(data));
        });
        it(DELETE_FOUR + '001', 0, async function (done) {
            let details;
            let wrong;
            console.log(DELETE_FOUR + '001 start......');
            let arg2 = "{\"equalTo\": \"group_name\"}";
            let pacMap2 = {
                'group_name': 'test1'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'delete', arg2, pacMap2, (err2, data2) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(DELETE_FOUR + '001', timeOldStamp, timeNewStamp);
                if (err2) {
                    wrong = err2;
                    console.error(DELETE_FOUR + '001 error: ' + JSON.stringify(err2));
                } else {
                    details = data2;
                    console.info(DELETE_FOUR + '001 succeeded: ' + JSON.stringify(data2));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
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
            let details;
            let wrong
            console.log(DELETE_FOUR + '002 start......');
            let arg = "{\"lessThan\": \"ringtone_modify_time\"}";
            let pacMap = {
                'ringtone_modify_time': 32,
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'delete', arg, pacMap, (err, data) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(DELETE_FOUR + '002', timeOldStamp, timeNewStamp);
                if (err) {
                    wrong = err;
                    console.error(DELETE_FOUR + '002 error: ' + JSON.stringify(err));
                } else {
                    details = data;
                    console.info(DELETE_FOUR + '002 succeeded: ' + JSON.stringify(data));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(DELETE_FOUR + '002 end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_003
         * @tc.name: call : Deletes one or more data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap_3, (err, data) => {
            if (err) {
                console.error('Operation failed3. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded3: ' + JSON.stringify(data));
        });
        it(DELETE_FOUR + '003', 0, async function (done) {
            let details;
            let wrong;
            console.log(DELETE_FOUR + '003 start......');
            let arg2 = {
                'like': 'group_name'
            };
            let pacMap2 = {
                'group_name': '%test%'
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'delete', arg2, pacMap2, (err2, data2) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(DELETE_FOUR + '003', timeOldStamp, timeNewStamp);
                if (err2) {
                    wrong = err2;
                    console.error(DELETE_FOUR + '003 error: ' + JSON.stringify(err2));
                } else {
                    details = data2;
                    console.info(DELETE_FOUR + '003 delete succeeded: ' + JSON.stringify(data2));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(DELETE_FOUR + '003 delete end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_004
         * @tc.name: call : Deletes one or more data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap_4, (err, data) => {
            if (err) {
                console.error('Operation failed4. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded4: ' + JSON.stringify(data));
        });
        it(DELETE_FOUR + '004', 0, async function (done) {
            let details;
            let wrong;
            console.log(DELETE_FOUR + '004 start......');
            let arg2 = {
                'greaterThanOrEqualTo': 'ringtone_modify_time'
            };
            let pacMap2 = {
                'ringtone_modify_time': 40
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri, 'delete', arg2, pacMap2, (err2, data2) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(DELETE_FOUR + '004', timeOldStamp, timeNewStamp);
                if (err2) {
                    wrong = err2;
                    console.error(DELETE_FOUR + '004 error: ' + JSON.stringify(err2));
                } else {
                    details = data2;
                    console.info(DELETE_FOUR + '004 delete succeeded: ' + JSON.stringify(data2));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(DELETE_FOUR + '004 delete end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_005
         * @tc.name: call : Deletes abnormal data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap_4, (err, data) => {
            if (err) {
                console.error('Operation failed4. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded5: ' + JSON.stringify(data));
        });
        it(DELETE_FOUR + '005', 0, async function (done) {
            let details;
            let wrong;
            console.log(DELETE_FOUR + '005 start......');
            let pacMap2 = {
                'ringtone_modify_time': 40
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call(contactUri2, 'delete', '', pacMap2, (err2, data2) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(DELETE_FOUR + '005', timeOldStamp, timeNewStamp);
                if (err2) {
                    wrong = err2;
                    console.error(DELETE_FOUR + '005 error: ' + JSON.stringify(err2));
                } else {
                    details = data2;
                    console.info(DELETE_FOUR + '005 delete succeeded: ' + JSON.stringify(data2));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(DELETE_FOUR + '005 delete end......');
        });

        /*
         * @tc.number: dataAbility_delete_test_006
         * @tc.name: call : Deletes abnormal data records from the database.
         * @tc.desc: Check the return value of the interface
         * @tc.level   0
         */
        dataAbilityHelper.call(contactUri, 'insert', '', pacMap_4, (err, data) => {
            if (err) {
                console.error('Operation failed4. Cause: ' + JSON.stringify(err));
                return;
            }
            console.info('Operation succeeded4: ' + JSON.stringify(data));
        });
        it(DELETE_FOUR + '006', 0, async function (done) {
            let details;
            let wrong;
            console.log(DELETE_FOUR + '006 start......');
            let pacMap2 = {
                'ringtone_modify_time': 40
            };
            var timeOldStamp = await Utils.getNowTime();
            dataAbilityHelper.call('', 'delete', '', pacMap2, (err2, data2) => {
                var timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime(DELETE_FOUR + '006', timeOldStamp, timeNewStamp);
                if (err2) {
                    wrong = err2;
                    console.error(DELETE_FOUR + '006 error: ' + JSON.stringify(err2));
                } else {
                    details = data2;
                    console.info(DELETE_FOUR + '006 delete succeeded: ' + JSON.stringify(data2));
                }
            });
            await Utils.sleep(1000);
            details != null ? expectDetails(details, true, 3) : expectDetails(wrong, true, 2);
            done();
            console.log(DELETE_FOUR + '006 delete end......');
        });
    })

    function expectDetails(data, isTrue, keyStatus) {
        if (data != -1) {
            expect(typeof (data)).assertEqual("object");
            expect(typeof (data.result)).assertEqual(isTrue ? 'number' : 'string');
        }
        switch (keyStatus) {
            case 1:
                expect(data.result > 0).assertTrue();
                break

            case 2:
                expect(data == -1).assertTrue();
                break

            case 3:
                expect(data.result).assertEqual(0);
                break
        }
    }
}