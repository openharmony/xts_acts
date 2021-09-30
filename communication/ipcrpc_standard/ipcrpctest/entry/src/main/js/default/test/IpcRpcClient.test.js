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

import rpc from '@ohos.rpc'
import app from '@system.app'
import FA from '@ohos.ability.featureability'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const TAG = "[IpcRpcTest]";
const gBasicStubDesc = "Basic_Stub_Desc";
const gExtendStubDesc = "Extend_Stub_Desc";
const REMOTE_BUNDLE = "com.huawei.plrdtest.ipcrpcservice";
const REMOTE_ABILITY = "com.huawei.plrdtest.ipcrpcservice.MainAbility";
const REQUEST_SUCCESS_STR = "send request success";
const REQUEST_FAIL_STR = "send request fail";
const REQUEST_EXCEPTION_STR = "send request exception:";

const REQUEST_SUCCESS = 0;
const CODE_BASIC = 1;
const CODE_TRANS_BASIC = 2;
const CODE_TRANS_ARRAY = 3;
const CODE_TRANS_STRING = 4;

const CODE_GET_OBJECT = 10;
const CODE_GET_OBJECTS = 11;
const CODE_GET_OBJECTS_MIX = 12;
const CODE_GET_OBJECT_CALL = 13;
const CODE_GET_OBJECT_DESC = 14;

const CODE_GET_CALL_PID = 20;
const CODE_GET_CALL_UID = 21;
const CODE_CHECK_LOCAL_CALL = 22;

let gBasicStubProxy = undefined;
let gConnectRst = undefined;

function logInfo(logContent) {
    console.info(TAG + logContent);
}

describe('ACTS_IpcRpc', function () {
    beforeAll(function () {
        logInfo("beforeAll start")
        gConnectRst = FA.connectAbility(
            {
                bundleName: REMOTE_BUNDLE,
                abilityName: REMOTE_ABILITY,
            },
            {
                onConnect: onConnectCallback,
                onDisconnect: onDisconnectCallback,
                onFailed: onFailedCallback,
            },
        );
        logInfo("beforeAll connectAbility:" + gConnectRst);
    })
    beforeEach(function () {
        logInfo("beforeEach")
    })
    afterAll(function () {
        logInfo("afterAll start")
        var result = FA.disconnectAbility(
            gConnectRst,
            (error, data) => {
                logInfo('afterAll disconnectAbility error:' + error.code + ",data: " + data)
            },
        );
    })
    afterEach(function () {
        logInfo("afterEach")
    })

    function onConnectCallback(element, remote){
        logInfo('onConnect element.deviceId:' + element.deviceId)
        logInfo('onConnect element.bundleName:' + element.bundleName)
        logInfo('onConnect element.abilityName:' + element.abilityName)
        logInfo('onConnect element.uri:' + element.uri)
        logInfo('onConnect element.shortName:' + element.shortName)
        logInfo('onConnect remote:' + remote);
        if (remote instanceof rpc.RemoteProxy) {
            logInfo('onConnect check remote object success');
            gBasicStubProxy = remote;
        } else {
            logInfo('onConnect check remote object fail');
        }
    }

    function onDisconnectCallback(element){
        logInfo('onDisconnect element.deviceId:' + element.deviceId)
        logInfo('onDisconnect element.bundleName:' + element.bundleName)
        logInfo('onDisconnect element.abilityName:' + element.abilityName)
        logInfo('onDisconnect element.uri:' + element.uri)
        logInfo('onDisconnect element.shortName:' + element.shortName)
    }

    function onFailedCallback(code){
        logInfo('onFailed errCode:' + code)
    }

    function requestBasic(option, add1, add2) {
        let data = new rpc.MessageParcel.create();
        let reply = new rpc.MessageParcel.create();
        let isOk = data.writeInt(add1);
        expect(isOk).assertTrue();
        isOk = data.writeInt(add2);
        expect(isOk).assertTrue();

        logInfo("start call sendRequest...");
        let rstFlag = true;
        gBasicStubProxy.sendRequest(CODE_BASIC, data, reply, option)
            .then(function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);
            if (errorCode === REQUEST_SUCCESS) {
                logInfo(REQUEST_SUCCESS_STR);
                let addResult = reply.readInt();
                let expectResult = add1 + add2;
                //expect(addResult).assertEqual(expectResult);
                if (addResult !== expectResult) {
                    logInfo("reply result != expect, result:" + addResult + ",expect:" + expectResult);
                    if (option.flags === TF_ASYNC) {
                        logInfo("option is async, expect not match")
                    } else {
                        rstFlag = false;
                    }
                } else {
                    logInfo("reply result = expect");
                    if (option.flags === TF_ASYNC) {
                        logInfo("option is async, expect not match")
                        rstFlag = false;
                    }
                }
            } else {
                logInfo(REQUEST_FAIL_STR);
                rstFlag = false;
            }
        })
            .catch(function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
            rstFlag = false;
        })
            .finally(() => {
            logInfo("finally...");
            data.reclaim();
            reply.reclaim();
        })
        return rstFlag;
    }

    /**
     * @tc.name basic,default option(sync)
     * @tc.number ACTS_IpcRpc_Basic_0100
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_Basic_0100', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();
        let option = new rpc.MessageOption();
        const add1 = -999;
        const add2 = 1000;
        let rst = requestBasic(option, add1, add2);
        expect(rst).assertTrue();
    })

    /**
     * @tc.name basic,sync option
     * @tc.number ACTS_IpcRpc_SyncOpt_0101
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_SyncOpt_0101', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();
        let option = new rpc.MessageOption(TF_SYNC, TF_WAIT_TIME);
        const add1 = 1000;
        const add2 = -1000;
        let rst = requestBasic(option, add1, add2);
        expect(rst).assertTrue();
    })

    /**
     * @tc.name basic,async option
     * @tc.number ACTS_IpcRpc_AsyncOpt_0102
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_AsyncOpt_0102', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();
        let option = new rpc.MessageOption(TF_ASYNC, TF_WAIT_TIME);
        const add1 = 1000;
        const add2 = 999;
        let rst = requestBasic(option, add1, add2);
        expect(rst).assertTrue();
    })

    /**
     * @tc.name trans basic data
     * @tc.number ACTS_IpcRpc_TransDataBasic_0200
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_TransDataBasic_0200', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.create();
        let reply = new rpc.MessageParcel.create();
        const wByte = 'b';
        const wChar = '字';
        const wShort = 65535;
        const wInt = 4294967296;
        const wLong = 18446744073709551615;
        const wBoolean = true;
        const wFloat = 12.665577;
        const wDouble = 12.66557788;
        let isOk = data.writeByte(wByte);
        expect(isOk).assertTrue();
        isOk = data.writeChar(wChar);
        expect(isOk).assertTrue();
        isOk = data.writeShort(wShort);
        expect(isOk).assertTrue();
        isOk = data.writeInt(wInt);
        expect(isOk).assertTrue();
        isOk = data.writeLong(wLong);
        expect(isOk).assertTrue();
        isOk = data.writeBoolean(wBoolean);
        expect(isOk).assertTrue();
        isOk = data.writeFloat(wFloat);
        expect(isOk).assertTrue();
        isOk = data.writeDouble(wDouble);
        expect(isOk).assertTrue();

        logInfo("start call sendRequest...");
        gBasicStubProxy.sendRequest(CODE_TRANS_BASIC, data, reply, option)
            .then(function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);
            if (errorCode === REQUEST_SUCCESS) {
                logInfo(REQUEST_SUCCESS_STR);
                let rDouble = reply.readDouble();
                expect(rDouble).assertEqual(wDouble);
                let rFloat = reply.readFloat();
                expect(rFloat).assertEqual(wFloat);
                let rBoolean = reply.readBoolean();
                expect(rBoolean).assertEqual(wBoolean);
                let rLong = reply.readLong();
                expect(rLong).assertEqual(wLong);
                let rInt = reply.readInt();
                expect(rInt).assertEqual(wInt);
                let rShort = reply.readShort();
                expect(rShort).assertEqual(wShort);
                let rChar = reply.readChar();
                expect(rChar).assertEqual(wChar);
                let rByte = reply.readByte();
                expect(rByte).assertEqual(wByte);
            } else {
                logInfo(REQUEST_FAIL_STR);
            }
        })
            .catch(function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally(() => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name trans array
     * @tc.number ACTS_IpcRpc_TransDataArray_0201
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_TransDataArray_0201', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.create();
        let reply = new rpc.MessageParcel.create();
        const intArray = [1, 3, 5, 7, 9];
        const floatArray = [1.1, 2.2, 3.3, 4.4, 5.5];
        const byteArray = new Int8Array([2, 4, 6, 8, 10]);
        let isOk = data.writeIntArray(intArray);
        expect(isOk).assertTrue();
        isOk = data.writeFloatArray(floatArray);
        expect(isOk).assertTrue();
        isOk = data.writeByteArray(byteArray);
        expect(isOk).assertTrue();

        gBasicStubProxy.sendRequest(CODE_TRANS_ARRAY, data, reply, option)
            .then(function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);
            if (errorCode === REQUEST_SUCCESS) {
                logInfo(REQUEST_SUCCESS_STR);
                let readByteArray = reply.readByteArray();
                logInfo("readByteArray:" + readByteArray);
                expect(readByteArray instanceof Array).assertTrue();
                expect(readByteArray.length === intArray.length).assertTrue();

                let readFloatArray = reply.readFloatArray();
                logInfo("readFloatArray:" + readFloatArray);
                expect(readFloatArray instanceof Array).assertTrue();
                expect(readFloatArray.length === floatArray.length).assertTrue();

                let readIntArray = reply.readIntArray();
                logInfo("readIntArray:" + readIntArray);
                expect(readIntArray instanceof Array).assertTrue();
                expect(readIntArray.length === intArray.length).assertTrue();
            } else {
                logInfo(REQUEST_FAIL_STR);
            }
        })
            .catch(function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally(() => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name trans string
     * @tc.number ACTS_IpcRpc_TransDataString_0202
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_TransDataString_0202', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.create();
        let reply = new rpc.MessageParcel.create();

        const str1 = "1234567890abcdefgh";
        const str2 = "!@@$$%^^&&**((()__+";
        let isOk = data.writeString(str1);
        expect(isOk).assertTrue();
        isOk = data.writeString(str2);
        expect(isOk).assertTrue();

        gBasicStubProxy.sendRequest(CODE_TRANS_STRING, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);
            let readStr1 = reply.readString();
            logInfo("readString 1:" + readStr1);
            expect(typeof readStr1 === 'string').assertTrue();
            expect(readStr1).assertEqual(str2);

            let readStr2 = reply.readString();
            logInfo("readString 2:" + readStr2);
            expect(typeof readStr2 === 'string').assertTrue();
            expect(readStr2).assertEqual(str1);
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name get basic object
     * @tc.number ACTS_IpcRpc_GetObject_0300
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetObject_0300', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.create();
        let reply = new rpc.MessageParcel.create();

        const strArray = ['get', 'remote', 'object'];
        let isOk = data.writeStringArray(strArray);
        expect(isOk).assertTrue();

        gBasicStubProxy.sendRequest(CODE_GET_OBJECT, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);
            let proxy = reply.readRemoteObject();
            logInfo("readRemoteObject:" + proxy);
            expect(proxy instanceof rpc.RemoteProxy).assertTrue();

            // check descriptor
            let desc = proxy.getInterfaceDescriptor();
            logInfo("proxy.getInterfaceDescriptor:" + desc);
            expect(desc).assertEqual(gBasicStubDesc);
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name get three basic objects
     * @tc.number ACTS_IpcRpc_GetObjects_0301
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetObjects_0301', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.create();
        let reply = new rpc.MessageParcel.create();

        const strArray = ['get', 'remote', 'object', 'array'];
        let isOk = data.writeStringArray(strArray);
        expect(isOk).assertTrue();

        gBasicStubProxy.sendRequest(CODE_GET_OBJECTS, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let proxy1 = reply.readRemoteObject();
            logInfo("readRemoteObject1:" + proxy1);
            expect(proxy1 instanceof rpc.RemoteProxy).assertTrue();
            let proxy1Desc = proxy1.getInterfaceDescriptor();
            logInfo("proxy1.getInterfaceDescriptor:" + proxy1Desc);
            expect(proxy1Desc).assertEqual(gBasicStubDesc);

            let proxy2 = reply.readRemoteObject();
            logInfo("readRemoteObject2:" + proxy2);
            expect(proxy2 instanceof rpc.RemoteProxy).assertTrue();
            let proxy2Desc = proxy2.getInterfaceDescriptor();
            logInfo("proxy2.getInterfaceDescriptor:" + proxy2Desc);
            expect(proxy2Desc).assertEqual(gBasicStubDesc);

            let proxy3 = reply.readRemoteObject();
            logInfo("readRemoteObject3:" + proxy3);
            expect(proxy3 instanceof rpc.RemoteProxy).assertTrue();
            let proxy3Desc = proxy3.getInterfaceDescriptor();
            logInfo("proxy3.getInterfaceDescriptor:" + proxy3Desc);
            expect(proxy3Desc).assertEqual(gBasicStubDesc);
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name get one basic and one extend object
     * @tc.number ACTS_IpcRpc_GetObjectsMix_0302
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetObjectsMix_0302', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.crete();
        let reply = new rpc.MessageParcel.crete();

        gBasicStubProxy.sendRequest(CODE_GET_OBJECTS_MIX, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let extendProxy = reply.readRemoteObject();
            logInfo("readRemoteObject[extend]:" + extendProxy);
            expect(extendProxy instanceof rpc.RemoteObject).assertTrue();
            let extendDesc = extendProxy.getInterfaceDescriptor();
            logInfo("getInterfaceDescriptor[extend]:" + extendDesc);
            expect(extendDesc).assertEqual(gExtendStubDesc);

            let basicProxy = reply.readRemoteObject();
            logInfo("readRemoteObject[basic]:" + basicProxy);
            expect(basicProxy instanceof rpc.RemoteObject).assertTrue();
            let basicDesc = basicProxy.getInterfaceDescriptor();
            logInfo("getInterfaceDescriptor[basic]:" + basicDesc);
            expect(basicDesc).assertEqual(gBasicStubDesc);
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name get extend proxy and call
     * @tc.number ACTS_IpcRpc_GetObjectAndCall_0303
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetObjectAndCall_0303', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.create();
        let reply = new rpc.MessageParcel.create();
        let proxy = undefined;
        gBasicStubProxy.sendRequest(CODE_GET_OBJECT_CALL, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            proxy = reply.readRemoteObject();
            logInfo("readRemoteObject:" + proxy);
            expect(proxy instanceof rpc.RemoteProxy).assertTrue();
            let desc = proxy.getInterfaceDescriptor();
            logInfo("proxy.getInterfaceDescriptor:" + desc);
            expect(desc).assertEqual(gBasicStubDesc);
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })

        //call by proxy
        expect(proxy != undefined).assertTrue();
        let dataProxy = new rpc.MessageParcel.create();
        let replyProxy = new rpc.MessageParcel.create();
        let sub1 = 222;
        let sub2 = 222.111;
        dataProxy.writeInt(sub1);
        dataProxy.writeFloat(sub2);
        proxy.sendRequest(CODE_BASIC, dataProxy, replyProxy, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let addResult = reply.readFloat();
            let expectResult = sub1 - sub2;
            logInfo("readFloat sub result:" + addResult);
            expect(addResult).assertEqual(expectResult);
        })
            .catch( function (e) {
            logInfo("[read object]" + REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            dataProxy.reclaim();
            replyProxy.reclaim();
        })
    })

    /**
     * @tc.name get interface descriptor
     * @tc.number ACTS_IpcRpc_GetDescFromRemote_0304
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetDescFromRemote_0304', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.crete();
        let reply = new rpc.MessageParcel.crete();

        gBasicStubProxy.sendRequest(CODE_GET_OBJECT_DESC, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let basicDesc = reply.readString();
            logInfo("readString[basic]:" + basicDesc);
            expect(basicDesc).assertEqual(gBasicStubDesc);

            let extendDesc = reply.readString();
            logInfo("readString[extend]:" + extendDesc);
            expect(extendDesc).assertEqual(gExtendStubDesc);
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name test attach and get local interface
     * @tc.number ACTS_IpcRpc_AttachAndGet_0305
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_AttachAndGet_0305', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.crete();
        let reply = new rpc.MessageParcel.crete();

        gBasicStubProxy.sendRequest(CODE_GET_OBJECT, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let proxy = reply.readRemoteObject();
            logInfo("readRemoteObject:" + proxy);
            expect(proxy instanceof rpc.RemoteProxy).assertTrue();
            let desc = proxy.getInterfaceDescriptor();
            logInfo("proxy.getInterfaceDescriptor:" + desc);
            expect(desc).assertEqual(gBasicStubDesc);

            // attach and query
            let newDesc = "new interface desc";
            proxy.attachLocalInterface(proxy, newDesc);
            let queryObject = proxy.queryLocalInterface(newDesc);
            expect(queryObject instanceof rpc.RemoteProxy).assertTrue();
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name test get calling uid
     * @tc.number ACTS_IpcRpc_GetCallingUid_0400
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetCallingUid_0400', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.crete();
        let reply = new rpc.MessageParcel.crete();

        gBasicStubProxy.sendRequest(CODE_GET_CALL_UID, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let uid = reply.readInt();
            logInfo("get Uid readInt:" + uid);
            expect(typeof uid === 'number').assertTrue();
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name test get calling pid
     * @tc.number ACTS_IpcRpc_GetCallingPid_0401
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetCallingPid_0401', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.crete();
        let reply = new rpc.MessageParcel.crete();

        gBasicStubProxy.sendRequest(CODE_GET_CALL_PID, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let uid = reply.readInt();
            logInfo("get Pid readInt:" + uid);
            expect(typeof uid === 'number').assertTrue();
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })

    /**
     * @tc.name test check is local calling
     * @tc.number ACTS_IpcRpc_GetCallingPid_0402
     * @tc.desc ipc/rpc function test
     */
    it('ACTS_IpcRpc_GetCallingPid_0402', 0, function () {
        expect(gBasicStubProxy != undefined).assertTrue();

        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel.crete();
        let reply = new rpc.MessageParcel.crete();

        gBasicStubProxy.sendRequest(CODE_CHECK_LOCAL_CALL, data, reply, option)
            .then( function (errorCode) {
            expect(errorCode).assertEqual(REQUEST_SUCCESS);

            let isLocalCall = reply.readBoolean();
            logInfo("get is local calling:" + isLocalCall);
            expect(isLocalCall).assertFalse();
        })
            .catch( function (e) {
            logInfo(REQUEST_EXCEPTION_STR + e);
        })
            .finally( () => {
            data.reclaim();
            reply.reclaim();
        })
    })
})
