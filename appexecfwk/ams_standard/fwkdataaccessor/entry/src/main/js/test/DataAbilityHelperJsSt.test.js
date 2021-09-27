/*
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
import featureAbility from '@ohos.ability.featureAbility'
import ohos_data_ability from '@ohos.data.dataability'
import bundle from '@ohos.bundle'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsDataAbilityHelperTest', function () {
    let bundleName = "com.ix.verify.act";
    //let abilityName = "VerifyActDataAbility";
    //let dataAbilityUri = ("dataability:///com.ohos.amsst.AppDataC.AmsStDataAbilityDataC1");
    let dataAbilityUri = ("dataability:///com.ix.VerifyActDataAbility");

    let DAHelper;
    let g_setTimeout = 10

    /*
    * @tc.number: bms_getJsAbility_0100
    * @tc.name: test the multi js ability
    * @tc.desc: 1.install a js hap which has an ability with full domain name
    *           2.check the ability name by the interface of getBundleInfo
    */
    it('bms_installAbility_0100', 0, async function (done) {
        console.info('bms_installAbility_0100====<begin');
        try{
            await install(['/system/vendor/amsStDataAbility.hap']);
            let data = await bundle.getBundleInfo(bundleName, 1);
            console.debug("=bms_installAbility_0100 getBundleInfo data====>"
            + (" json data【") + JSON.stringify(data)+ (" 】;"));
            //expect(data.abilityInfo.length).assertEqual(1);
            done();
        }catch(err) {
            console.error('=bms_installAbility_0100 install catch(err)====>:'+err);
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.info('=bms_installAbility_0100====> setTimeout');
        }, g_setTimeout)
        console.log('bms_installAbility_0100====<end')
    })
    async function install(bundlePath) {
        try{
            var installer = await bundle.getBundleInstaller();
            installer.install(bundlePath, {
                param: {
                    userId: 0,
                    installFlag: 1,
                    isKeepData: false
                }
            }, onReceiveInstallEvent);

            function onReceiveInstallEvent(err, data) {
                console.debug("=bms_installAbility_0100 onReceiveInstallEvent err,data====>"
                + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;"));
                expect(typeof err).assertEqual('object');
                expect(err.code).assertEqual(0);
                expect(typeof data).assertEqual('object');
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
            }
        }catch(err) {
            console.error('=bms_installAbility_0100 getBundleInstaller catch(err)====>:'+err);
            expect(false).assertTrue();
        }
    }

/*
* @tc.number: ACTS_GetDataAbilityHelper_0100
* @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
* @tc.desc: Check the return value of the interface ()
*/
    it('ACTS_GetDataAbilityHelper_0100',0, async function (done) {
        console.log('ACTS_GetDataAbilityHelper_0100====<begin');
        console.debug("=ACTS_GetDataAbilityHelper_0100 dataAbilityUri====>"
        + (" json dataAbilityUri 【") + JSON.stringify(dataAbilityUri)+ (" 】; ====>"))
        let ret = false;
        try{
            var abilityHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri)
//                .then(function (data) {
//                console.debug("=ACTS_GetDataAbilityHelper_0100 then data====>"
//                + (" json data 【") + JSON.stringify(data)+ (" 】; ====>")+data);
//                expect(typeof(data)).assertEqual("object");
//                console.log('=ACTS_GetDataAbilityHelper_0100 promise JSON.stringify([object])====>:' + JSON.stringify(promise)+","+promise);
//                ret = true;
//                done()
//            }).catch(function (err){
//                console.debug("=ACTS_GetDataAbilityHelper_0100 catch err====>"
//                + ("json err 【") + JSON.stringify(err) + (" 】 ====>")+err);
//                console.log('=ACTS_GetDataAbilityHelper_0100 promise====>:' + JSON.stringify(promise))
//                ret = false;
//                done();
//            });
            DAHelper = abilityHelper;
            ret = true;
            done()
        }catch(err) {
            console.error('=ACTS_GetDataAbilityHelper_0100 getDataAbilityHelper catch(err)====>:'+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_GetDataAbilityHelper_0100====<end')
    })

///*
//* @tc.number: ACTS_GetDataAbilityHelper_0200
//* @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
//* @tc.desc: Check the return value of the interface (by AsyncCallback)
//*/
//    it('ACTS_GetDataAbilityHelper_0200', 0, async function (done) {
//        console.log('ACTS_GetDataAbilityHelper_0200====<begin');
//        let ret = false;
//        try{
//            var asyncCallback = await featureAbility.acquireDataAbilityHelper(dataAbilityUri,
//            function (err,data){
//                    console.debug("===========ACTS_GetDataAbilityHelper_0200===========>getDataAbilityHelperCallback_0200 err,data=======>"
//                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;"));
//                    expect(typeof(asyncCallback)).assertEqual("object");
//                    DAHelper = data;
//                    console.log('=ACTS_GetDataAbilityHelper_0200 asyncCallback err data====>:' + JSON.stringify(asyncCallback))
//                    console.log('=ACTS_GetDataAbilityHelper_0200 DAHelper JSON.stringify([object])====>:' + JSON.stringify(DAHelper));
//                    ret = true;
//                    done();
//                }
//            );
//        }catch(err) {
//            console.error('=ACTS_GetDataAbilityHelper_0200 getDataAbilityHelper catch(err)====>:'+err);
//            ret = false;
//            done();
//        }
//        console.log('=ACTS_GetDataAbilityHelper_0200 asyncCallback ====>:' + JSON.stringify(asyncCallback))
//
//
//        setTimeout(function(){
//            expect(ret).assertTrue();
//        }, g_setTimeout);
//        console.log('ACTS_GetDataAbilityHelper_0200====<end')
//
//    })

/*
* @tc.number: ACTS_Insert_0100
* @tc.name: Insert : Indicates the path of the data to operate
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_Insert_0100', 0, async function (done) {
        console.log('ACTS_Insert_0100====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('Insert_0100 DAHelper ====>: ' + JSON.stringify(DAHelper)+","+ DAHelper)
        let valueBucket
        try{
            DAHelper.insert(dataAbilityUri,valueBucket)
            .then(function (data){
                console.debug("=ACTS_Insert_0100====insert Promise then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】"));
                expect(typeof(data)).assertEqual("number");
                expect(data).assertEqual(1);
                ret = true;
                done();
            }).catch(function (err){
                console.debug("=ACTS_Insert_0100====insert Promise catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false;
                done();
            });
        }catch(err) {
            console.error('=ACTS_Insert_0100 insert Promise catch(err)====>:'+err);
            ret = false;
            done();
        }

        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_Insert_0100====<end');

    })

/*
* @tc.number: ACTS_Insert_0200
* @tc.name: Insert : Indicates the path of the data to operate
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_Insert_0200', 0, async function (done) {
        console.log('ACTS_Insert_0200====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        let valueBucket
        try{
            var asyncCallback = await DAHelper.insert(dataAbilityUri,valueBucket,
                (err,data)=>{
                    console.debug("=ACTS_Insert_0200 insert AsyncCallback err,data=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;"));
                    expect(typeof(data)).assertEqual("number");
                    expect(data).assertEqual(1);
                    console.log('=ACTS_Insert_0200 asyncCallback ====>:' + JSON.stringify(asyncCallback))
                    ret = true;
                    done();
                }
            );
        }catch(err) {
            console.error('=ACTS_Insert_0200 insert AsyncCallback catch(err)====>:'+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_Insert_0200====<end');

    })

/*
* @tc.number: ACTS_Insert_0300
* @tc.name: Insert : Indicates the path of the data to operate
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_Insert_0300', 0, async function (done) {
        console.log('ACTS_Insert_0300====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('Insert_0300 DAHelper ====<: ' + JSON.stringify(DAHelper)+","+ DAHelper)
        const valueBucket = {
            "name": "ACTS_Insert_0300_rose",
            "age": 22,
            "salary": 200.5,
            "blobType": "u8",
        }
        try{
            var Promise = DAHelper.insert(dataAbilityUri,valueBucket)
                .then((data) => {
                console.debug("=ACTS_Insert_0300====insert Promise then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】"));
                expect(typeof(data)).assertEqual("number");
                expect(data).assertEqual(1);
                ret = true;
                done();
            }).catch((err)=>{
                console.debug("=ACTS_Insert_0300====insert Promise catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                //debugAnsErrorCodePrint(err.code);
                ret = false;
                done();
            });
        }catch(err) {
            console.error('=ACTS_Insert_0300 insert Promise catch(err)====>:'+err);
            ret = false;
            done();
        }

        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_Insert_0300====<end');
    })

/*
* @tc.number: ACTS_Insert_0400
* @tc.name: Insert : Indicates the path of the data to operate
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_Insert_0400', 0, async function (done) {
        console.log('ACTS_Insert_0400====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        const valueBucket = {
            "name": "ACTS_Insert_0400_rose1",
            "age": 221,
            "salary": 20.5,
            "blobType": "u8",
        }
        try{
            var asyncCallback = await DAHelper.insert(dataAbilityUri,valueBucket,
                (err,data)=>{
                    console.debug("=ACTS_Insert_0400 insert AsyncCallback err,data====>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;"));
                    expect(typeof(data)).assertEqual("number");
                    expect(data).assertEqual(1);
                    ret = true;
                    done();
                }
            );
        }catch(err) {
            console.error('=ACTS_Insert_0400 insert AsyncCallback catch(err)====>:'+err);
            ret = false
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_Insert_0400====<end');
    })

/*
* @tc.number: ACTS_BatchInsert_0100
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_0100', 0, async function (done) {
        console.log('ACTS_BatchInsert_0100====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucket;
        try{
            DAHelper.batchInsert(
                dataAbilityUri,
                valueBucket
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0100 BatchInsert Promise then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】; ====>"));
                expect(typeof(data)).assertEqual("number");
                ret = true;
                done();
            }).catch((err)=>{
                console.debug("=ACTS_BatchInsert_0100 BatchInsert Promise catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        }catch(err) {
            console.error('=ACTS_BatchInsert_0100 batchInsert AsyncCallback catch(err)====>:'+err);
            ret = false
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_BatchInsert_0100====<end');
    })

/*
* @tc.number: ACTS_BatchInsert_0200
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_BatchInsert_0200', 0, async function (done) {
        console.log('ACTS_BatchInsert_0200====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucket;
        try{
            await DAHelper.batchInsert(
                dataAbilityUri,
                valueBucket,
                (err,data) => {
                    console.debug("=ACTS_BatchInsert_0200 batchInsert AsyncCallback err,data=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;"));
                    expect(typeof(data)).assertEqual("number");
                    ret = true;
                    done();
                },
            );
        }catch(err) {
            console.error('=ACTS_BatchInsert_0200 batchInsert AsyncCallback catch(err)====>:'+err);
            ret = false
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_BatchInsert_0200====<end');
    })

/*
* @tc.number: ACTS_BatchInsert_0300
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_0300', 0, async function (done) {
        console.log('ACTS_BatchInsert_0300====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({},{},{})
        try{
            DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0300 BatchInsert Promise then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】; ====>"));
                expect(typeof(data)).assertEqual("number");
                ret = true;
                done();
            }).catch((err)=>{
                console.debug("=ACTS_BatchInsert_0300 BatchInsert Promise catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        }catch(err) {
            console.error('=ACTS_BatchInsert_0300 batchInsert AsyncCallback catch(err)====>:'+err);
            ret = false
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_BatchInsert_0300====<end');
    })

/*
* @tc.number: ACTS_BatchInsert_0400
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_BatchInsert_0400', 0, async function (done) {
        console.log('ACTS_BatchInsert_0400====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({},{},{})
        try{
            await DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
                (err,data) => {
                    console.debug("=ACTS_BatchInsert_0400 batchInsert AsyncCallback err,data====>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;"));
                    expect(typeof(data)).assertEqual("number");
                    ret = true
                    done();
                },
            );
        }catch(err) {
            console.error('=ACTS_BatchInsert_0400 batchInsert AsyncCallback catch(err)====>:'+err);
            ret = false
            done();
        }

        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_BatchInsert_0400====<end');
    })

    /*
* @tc.number: ACTS_BatchInsert_0500
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_0500', 0, async function (done) {
        console.log('ACTS_BatchInsert_0500====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try{
            const valueBucket = {
                "name": "ACTS_BatchInsert_0500_roe1",
                "age": 21,
                "salary": 20.5,
            }
            var valueBucketArray = new Array({"name": "BatchInsert_0500_roe11", "age": 21, "salary": 20.5, },
                {"name": "BatchInsert_0500_roe12", "age": 21, "salary": 20.5, },
                {"name": "BatchInsert_0500_roe13", "age": 21, "salary": 20.5, })

            DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0500 BatchInsert Promise then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】"));
                expect(typeof(data)).assertEqual("number");
                ret = true
                done();
            }).catch((err)=>{
                console.debug("=ACTS_BatchInsert_0500 BatchInsert Promise catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        }catch(err) {
            console.error('=ACTS_BatchInsert_0500 batchInsert AsyncCallback catch(err)====>:'+err);
            ret = false
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_BatchInsert_0500====<end');
    })

/*
* @tc.number: ACTS_BatchInsert_0600
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_BatchInsert_0600', 0, async function (done) {
        console.log('ACTS_BatchInsert_0600====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        const valueBucket = {
            "name": "BatchInsert_0600_roe1",
            "age": 21,
            "salary": 20.5,
        }
        var valueBucketArray = new Array({"name": "BatchInsert_0600_roe11", "age": 21, "salary": 20.5, },
            {"name": "BatchInsert_0600_roe12", "age": 21, "salary": 20.5, },
            {"name": "BatchInsert_0600_roe13", "age": 21, "salary": 20.5, })
        try{
            await DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
                (err,data) => {
                    console.debug("=ACTS_BatchInsert_0600 batchInsert AsyncCallback err,data====>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;"));
                    expect(typeof(data)).assertEqual("number");
                    ret = true
                    done();
                },
            );
        }catch(err) {
            console.error('=ACTS_BatchInsert_0600 batchInsert AsyncCallback catch(err)====>:'+err);
            ret = false
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_BatchInsert_0600====<end');
    })

    /*
* @tc.number: ACTS_ExecuteBatch_0100
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_ExecuteBatch_0100', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0100====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0100_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                        {
                            uri: dataAbilityUri,
                            type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                            valuesBucket: valuesBucket,
                            predicates: null,
                            expectedCount:1,
                            PredicatesBackReferences: {},
                            interrupted:true,
                        }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_0100 executeBatch then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】"));
                ret = true
                done();
            }).catch((err)=>{
                console.debug("=ACTS_ExecuteBatch_0100 executeBatch catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0100 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0100====<end');
    })

/*
* @tc.number: ACTS_ExecuteBatch_0200
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_ExecuteBatch_0200', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0200====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0200_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valuesBucket,
                        predicates: null,
                        expectedCount:1,
                        PredicatesBackReferences: {},
                        interrupted:true,
                    }
                ],
                (err,data)=>{
                    console.debug("=ACTS_ExecuteBatch_0200 executeBatch err,data====>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;")+ data.length);
                    ret = true
                    done();
                }
            );
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0200 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0200====<end');
    })

    /*
* @tc.number: ACTS_ExecuteBatch_0300
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_ExecuteBatch_0300', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0300====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0300_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                        {
                            uri: dataAbilityUri,
                            type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                            valuesBucket: valuesBucket,
                            predicates: null,
                            expectedCount:1,
                            PredicatesBackReferences: {},
                            interrupted:true,
                        }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_0300 executeBatch then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】"));
                ret = true
                done();
            }).catch((err)=>{
                console.debug("=ACTS_ExecuteBatch_0300 executeBatch catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0300 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0300====<end');
    })

    /*
* @tc.number: ACTS_ExecuteBatch_0400
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_ExecuteBatch_0400', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0400====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0400_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                        {
                            uri: dataAbilityUri,
                            type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                            valuesBucket: valuesBucket,
                            predicates: null,
                            expectedCount:1,
                            PredicatesBackReferences: {},
                            interrupted:true,
                        }
                ],
                (err,data)=>{
                    console.debug("=ACTS_ExecuteBatch_0400 executeBatch err,data====>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;")+ data.length);
                    ret = true
                    done();
                }
            );
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0400 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0400====<end');
    })

    /*
* @tc.number: ACTS_ExecuteBatch_0500
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_ExecuteBatch_0500', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0500====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0500_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                        {
                            uri: dataAbilityUri,
                            type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                            valuesBucket: valuesBucket,
                            predicates: null,
                            expectedCount:1,
                            PredicatesBackReferences: {},
                            interrupted:true,
                        }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_0500 executeBatch then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】"));
                ret = true
                done();
            }).catch((err)=>{
                console.debug("=ACTS_ExecuteBatch_0500 executeBatch catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0500 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0500====<end');
    })

    /*
* @tc.number: ACTS_ExecuteBatch_0600
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_ExecuteBatch_0600', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0600====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0600_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                        {
                            uri: dataAbilityUri,
                            type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                            valuesBucket: valuesBucket,
                            predicates: null,
                            expectedCount:1,
                            PredicatesBackReferences: {},
                            interrupted:true,
                        }
                ],
                (err,data)=>{
                    console.debug("=ACTS_ExecuteBatch_0600 executeBatch err,data====>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;")+ data.length);
                    ret = true
                    done();
                }
            );
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0600 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0600====<end');
    })

    /*
* @tc.number: ACTS_ExecuteBatch_0700
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_ExecuteBatch_0700', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0700====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0700_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                        {
                            uri: dataAbilityUri,
                            type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                            valuesBucket: valuesBucket,
                            predicates: null,
                            expectedCount:1,
                            PredicatesBackReferences: {},
                            interrupted:true,
                        }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_0700 executeBatch then data====>"
                + ("json data 【") + JSON.stringify(data)+ (" 】"));
                ret = true
                done();
            }).catch((err)=>{
                console.debug("=ACTS_ExecuteBatch_0700 executeBatch catch err ====>"
                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0700 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0700====<end');
    })

    /*
* @tc.number: ACTS_ExecuteBatch_0800
* @tc.name: ExecuteBatch : Preforms batch operations on the database
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_ExecuteBatch_0800', 0, async function (done) {
        console.log('ACTS_ExecuteBatch_0800====<begin');
        let ret = false;
        expect(typeof(DAHelper)).assertEqual("object");
        try{
            const valuesBucket = {
                "name": "ACTS_ExecuteBatch_0800_rose",
                "age": 22,
                "salary": 200.5,
                "blobType": "u8",
            }
            DAHelper.executeBatch(dataAbilityUri,
                [
                        {
                            uri: dataAbilityUri,
                            type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                            valuesBucket: valuesBucket,
                            predicates: null,
                            expectedCount:1,
                            PredicatesBackReferences: {},
                            interrupted:true,
                        }
                ],
                (err,data)=>{
                    console.debug("=ACTS_ExecuteBatch_0800 executeBatch err,data====>"
                    + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)+ (" 】;")+ data.length);
                    ret = true
                    done();
                }
            );
        }catch(err) {
            console.error('=ACTS_ExecuteBatch_0800 catch(err)====>:'
            + ("json err 【") + JSON.stringify(err) + (" 】 ,")+err);
            ret = false;
            done();
        }
        setTimeout(function(){
            expect(ret).assertTrue();
        }, g_setTimeout);
        console.log('ACTS_ExecuteBatch_0800====<end');
    })

    /*
    * @tc.number: bms_uninstallAbility_0100
    * @tc.name: test the multi js ability
    * @tc.desc: 1.install a js hap with two ability
    *           2.check the ability name by the interface of getBundleInfo
    */
    it('bms_uninstallAbility_0100', 0, async function (done) {
        console.info('bms_uninstallAbility_0100====< begin');
        try{
            await uninstall(bundleName);
            done();
        }catch(err) {
            console.error('=bms_uninstallAbility_0100 uninstall catch(err)====>:'+err);
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.info('bms_uninstallAbility_0100====< setTimeout');
        }, g_setTimeout)
        console.info('bms_uninstallAbility_0100====< end');
    })
    async function uninstall(bundleName)
    {
        try{
            var installer = await bundle.getBundleInstaller();
            installer.uninstall(bundleName, {
                param: {
                    userId: 0,
                    installFlag: 1,
                    isKeepData: false
                }
            }, onReceiveUninstallEvent);

            function onReceiveUninstallEvent(err, data) {
                console.info('========uninstall Finish========');
                expect(typeof err).assertEqual('object');
                expect(err.code).assertEqual(0);
                expect(typeof data).assertEqual('object');
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
            }
        }catch(err) {
            console.error('=bms_uninstallAbility_0100 onReceiveUninstallEvent catch(err)====>:'+err);
            expect(false).assertTrue();
        }
    }
})