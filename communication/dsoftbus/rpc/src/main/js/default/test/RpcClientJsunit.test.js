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

import rpc from '@ohos.rpc'
import fileio from '@ohos.fileio';
import FA from '@ohos.ability.featureability'
import {describe, expect, it} from 'deccjsunit/index'

var gIRemoteObject = undefined;

describe('ActsRpcClientJsTest', function(){
    console.log("-----------------------SUB_Softbus_IPC_MessageParce_Test is starting-----------------------");

    const CODE_WRITE_BYTEARRAY = 1;
    const CODE_WRITE_INTARRAY = 2;
    const CODE_WRITE_FLOATARRAY = 3;
    const CODE_WRITE_SHORT = 4;
    const CODE_WRITE_LONG = 5;
    const CODE_WRITE_DOUBLE = 6;
    const CODE_WRITE_BOOLEAN = 7;
    const CODE_WRITE_CHAR = 8;
    const CODE_WRITE_STRING = 9;
    const CODE_WRITE_BYTE = 10;
    const CODE_WRITE_INT = 11;
    const CODE_WRITE_FLOAT = 12;
    const CODE_WRITE_RAWDATA = 13;
    const CODE_WRITE_REMOTEOBJECT = 14;
    const CODE_WRITE_SEQUENCEABLE = 15;
    const CODE_WRITE_NOEXCEPTION = 16;
    const CODE_WRITE_SEQUENCEABLEARRAY = 17;
    const CODE_WRITE_REMOTEOBJECTARRAY = 18;

    const CODE_ALL_TYPE = 20;
    const CODE_ALL_ARRAY_TYPE = 21;
    const CODE_WRITEINT8_ASHMEM = 22;
    const CODE_WRITESEQUENCEABLE = 23
    const CODE_IPCSKELETON = 24;


    function connectAbility() {
        let want = {
            "bundleName":"ohos.rpc.test.server",
            "abilityName": "ohos.rpc.test.server.ServiceAbility",
        };
        let connect = {
            onConnect:function (elementName, remoteProxy) {
                console.log('RpcClient: onConnect called, instance of proxy: ' + (remoteProxy instanceof rpc.RemoteProxy))
                gIRemoteObject = remoteProxy

            },
            onDisconnect:function (elementName) {
                console.log("RpcClient: onDisconnect")
            },
            onFailed:function () {
                console.log("RpcClient: onFailed")
                gIRemoteObject = null
            }
        };
        FA.connectAbility(want, connect)
        return new Promise((resolve, reject) =>{
            console.log("start connect local ability, wait 5 seconds")
            setTimeout(()=>{
                console.log("resolve proxy: " + gIRemoteObject)
                resolve(gIRemoteObject)
            }, 5000)
        })
    }

    function sleep(numberMillis)
    {
        var now = new Date();
        var exitTime = now.getTime() + numberMillis;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime)
            return;
        }
    }

    class TestRemoteObject extends rpc.RemoteObject {
        constructor(descriptor) {
            super(descriptor);
        }
    }

    class MyDeathRecipient {
        constructor(gIRemoteObject, done) {
            this.gIRemoteObject = gIRemoteObject
            this.done = done
        }

        onRemoteDied() {
            console.info("server died")
            expect(this.proxy.removeDeathRecipient(this, 0)).assertTrue()
            let _done = this.done
            setTimeout(function() {
                _done()
            }, 1000)
        }
    }

    class TestAbility extends rpc.RemoteObject {
        asObject() {
            return this;
        }
    }

    class TestAbilityStub extends rpc.RemoteObject {
        constructor(descriptor) {
            super(descriptor)
        }
    }

    class TestListener extends rpc.RemoteObject {
        constructor(descriptor, checkResult) {
            super(descriptor);
            this.checkResult = checkResult
        }
        onRemoteRequest(code, data, reply, option) {
            let result = false
            if (code  == 1) {
                console.log("onRemoteRequest called, descriptor: " + this.getInterfaceDescriptor())
                result = true
            } else {
                console.log("unknown code: " + code)
            }
            let _checkResult = this.checkResult
            let _num = data.readInt()
            let _str = data.readString()
            setTimeout(function(){
                _checkResult(_num, _str)
            }, 2*1000);
            return result
        }
    }

    class MySequenceable {
        constructor(num, string) {
            this.num = num;
            this.str = string;
        }
        marshalling(messageParcel) {
            messageParcel.writeInt(this.num);
            messageParcel.writeString(this.str);
            return true;
        }
        unmarshalling(messageParcel) {
            this.num = messageParcel.readInt();
            this.str = messageParcel.readString();
            return true;
        }
    }

    class Stub extends rpc.RemoteObject {
        onRemoteRequest(code, data, reply, option) {
            let callerPid = rpc.IPCSkeleton.getCallingPid();
            console.log("RpcServer: getCallingPid result: " + callerPid);
            let callerUid = rpc.IPCSkeleton.getCallingUid();
            console.log("RpcServer: getCallingUid result: " + callerUid);
            let callerDeviceID  = rpc.IPCSkeleton.getCallingDeviceID();
            console.log("RpcServer: getCallingUid result: " + callerDeviceID );
            let localDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
            console.log("RpcServer: localDeviceID is: " + localDeviceID);
            return true;
        }
    }

    beforeAll(async function (done) {
        console.info('beforeAll called')
        await connectAbility().then((remote) => {
            console.log("got remote proxy: " + remote)
        }).catch((err) => {
            console.log("got exception: " + err)
        })
        done()
        console.log("beforeAll done")
    })

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_3600
     * @tc.name    Call the writebytearray interface, write the array to the messageparcel instance,
     *             and call readbytearray to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_3600", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_3600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_3600: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            let ByteArrayVar = new Int8Array([1, 2, 3, 4, 5]);
            var writeShortArrayResult = data.writeByteArray(ByteArrayVar);
            console.log("SUB_Softbus_IPC_MessageParcel_3600: run writeShortArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_3600: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_3600: run sendRequest success, result is " + result);
                expect(result == true).assertTrue();

                var shortArryDataReply = result.reply.readByteArray();
                console.log("SUB_Softbus_IPC_MessageParcel_3600: run readByteArray is success, result is "
                             + shortArryDataReply);
                expect(shortArryDataReply[0] == ByteArrayVar[0]).assertTrue();
                expect(shortArryDataReply[1] == ByteArrayVar[1]).assertTrue();
                expect(shortArryDataReply[2] == ByteArrayVar[2]).assertTrue();
                expect(shortArryDataReply[3] == ByteArrayVar[3]).assertTrue();
                expect(shortArryDataReply[4] == ByteArrayVar[4]).assertTrue();
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_3600: error " +error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_3600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_3700
     * @tc.name    Call the writebytearray interface, write the array to the messageparcel instance,
     *             and call readbytearray (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_3700", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_3700---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_3700: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            let ByteArrayVar = new Int8Array([1, 2, 3, 4, 5]);
            var writeShortArrayResult = data.writeByteArray(ByteArrayVar);
            console.log("SUB_Softbus_IPC_MessageParcel_3700: run writeShortArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_3700: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BYTEARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_3700: run sendRequest success, result is " + result.errCode);

                var newArr = []
                result.reply.readByteArray(newArr);
                console.log("SUB_Softbus_IPC_MessageParcel_3700: run readByteArray is success, result is "
                + shortArryDataReply);
                expect(newArr[0] == ByteArrayVar[0]).assertTrue()
                expect(newArr[1] == ByteArrayVar[1]).assertTrue()
                expect(newArr[2] == ByteArrayVar[2]).assertTrue()
                expect(newArr[3] == ByteArrayVar[3]).assertTrue()
                expect(newArr[4] == ByteArrayVar[4]).assertTrue()
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_3700: error " +error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_3700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_3800
     * @tc.name    Writebytearray interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_3800", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_3800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_3800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            let ByteArrayVar = new Int8Array([-128, 0, 1, 2, 127]);
            var writeShortArrayResult = data.writeByteArray(ByteArrayVar);
            console.log("SUB_Softbus_IPC_MessageParcel_3800: run writeShortArray success, result is "
                         + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            var resultByte = data.readByteArray();
            console.log("SUB_Softbus_IPC_MessageParcel_3800: run readByteArray success, result is " + resultByte);
            expect(resultByte[0] == ByteArrayVar[0]).assertTrue();
            expect(resultByte[1] == ByteArrayVar[1]).assertTrue();
            expect(resultByte[2] == ByteArrayVar[2]).assertTrue();

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_3800: error " +error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_3800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_3900
     * @tc.name    Writebytearray interface, illegal value validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_3900", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_3900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_3900: create object successfully.");

            let ByteArrayVar = new Int8Array([-129, 0, 1, 2, 127]);
            var writeShortArrayResult = data.writeByteArray(ByteArrayVar);
            console.log("SUB_Softbus_IPC_MessageParcel_3900: run writeShortArray success, result is "
                         + writeShortArrayResult);
            expect(writeShortArrayResult == false).assertTrue();

            var shortArryData2 = new Int8Array([-128, 0, 1, 2, 128]);
            var writeShortArrayResult2 = data.writeByteArray(shortArryData2);
            console.log("SUB_Softbus_IPC_MessageParcel_3900: run writeShortArray success, writeShortArrayResult2 is "
                         + writeShortArrayResult2);
            expect(writeShortArrayResult == false).assertTrue();
            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_3900: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_3900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4000
     * @tc.name    Call the writeintarray interface, write the array to the messageparcel instance,
     *             and call readintarray to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4000", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4000: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var intArryData = [100, 111, 112];
            var writeShortArrayResult = data.writeIntArray(intArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4000: run writeShortArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_4000: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_4000: run sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var shortArryDataReply = result.reply.readByteArray();
                console.log("SUB_Softbus_IPC_MessageParcel_4000: run readByteArray is success, result is "
                + shortArryDataReply);
                expect(shortArryDataReply[0] == intArryData[0]).assertTrue();
                expect(shortArryDataReply[1] == intArryData[1]).assertTrue();
                expect(shortArryDataReply[2] == intArryData[2]).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4000: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4100
     * @tc.name    Call the writeintarray interface, write the array to the messageparcel instance,
     *             and call readintarray (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4100", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4100: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var intArryData = [100, 111, 112];
            var writeShortArrayResult = data.writeIntArray(intArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4100: run writeShortArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_4100: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INTARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_4100: run sendRequest success, result is " + result.errCode);
                expect(result == true).assertTrue();

                var newArr = []
                result.reply.readIntArray(newArr);
                console.log("SUB_Softbus_IPC_MessageParcel_4100: run readIntArray is success, intArryDataReply is "
                + newArr);
                expect(newArr[0] == intArryData[0]).assertTrue();
                expect(newArr[1] == intArryData[1]).assertTrue();
                expect(newArr[2] == intArryData[2]).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4100: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4200
     * @tc.name    Writeintarray interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4200", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4200: create object successfully.");

            var intArryData = [-2147483648, 0, 1, 2, 2147483647];
            var writeShortArrayResult = data.writeIntArray(intArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4200: run writeShortArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            var intArryDataReply = data.readIntArray();
            console.log("SUB_Softbus_IPC_MessageParcel_4200: run readIntArray is success, intArryDataReply is "
                + intArryDataReply);
            expect(intArryDataReply[0] == intArryData[0]).assertTrue();
            expect(intArryDataReply[1] == intArryData[1]).assertTrue();
            expect(intArryDataReply[2] == intArryData[2]).assertTrue();
            expect(intArryDataReply[3] == intArryData[3]).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4200: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4300
     * @tc.name    Writeintarray interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4300", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4300: create object successfully.");

            var intArryData = [-2147483649, 0, 1, 2, 2147483647];
            var writeShortArrayResult = data.writeIntArray(intArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4300: run writeShortArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == false).assertTrue();

            var intArryData = [-2147483648, 0, 1, 2, 2147483648];
            var writeShortArrayResult = data.writeIntArray(intArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4300: run writeShortArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == false).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4300: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4400
     * @tc.name    Call the writefloatarray interface, write the array to the messageparcel instance,
     *             and call readfloatarray to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4400", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4400: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var floatArryData = [1.2, 1.3, 1.4];
            var writeShortArrayResult = data.writeFloatArray(floatArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4400: run writeFloatArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();


            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_4400: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_4400: run sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var floatArryDataReply = result.reply.readFloatArray();
                console.log("SUB_Softbus_IPC_MessageParcel_4400: run readFloatArray is success, floatArryDataReply is "
                + floatArryDataReply);
                expect(floatArryDataReply[0] == floatArryData[0]).assertTrue();
                expect(floatArryDataReply[1] == floatArryData[1]).assertTrue();
                expect(floatArryDataReply[2] == floatArryData[2]).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4400: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4500
     * @tc.name    Call the writefloatarray interface, write the array to the messageparcel instance,
     *             and call readfloatarray (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4500", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4500---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4500: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var floatArryData = [1.2, 1.3, 1.4]
            var writeShortArrayResult = data.writeFloatArray(floatArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4500: run writeFloatArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_4500: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_FLOATARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_4500: run sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var newArr = []
                result.reply.readFloatArray(newArr);
                console.log("SUB_Softbus_IPC_MessageParcel_4500: run readFloatArray is success, floatArryDataReply is "
                + newArr);
                expect(newArr[0] == floatArryData[0]).assertTrue();
                expect(newArr[1] == floatArryData[1]).assertTrue();
                expect(newArr[2] == floatArryData[2]).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4500: error " +error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4600
     * @tc.name    Writefloatarray interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4600", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4600: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var floatArryData = [-3.40E+38, 1.3, 3.40E+38];
            var writeShortArrayResult = data.writeFloatArray(floatArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4600: run writeFloatArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == true).assertTrue();

            var newArr = []
            data.readFloatArray(newArr);
            console.log("SUB_Softbus_IPC_MessageParcel_4600: run readFloatArray is success, floatArryDataReply is "
                + newArr);
            expect(newArr[0] == floatArryData[0]).assertTrue();
            expect(newArr[1] == floatArryData[1]).assertTrue();
            expect(newArr[2] == floatArryData[2]).assertTrue();

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4600: error " +error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4700
     * @tc.name    Writefloatarray interface, illegal value validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4700", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4700---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4700: create object successfully.");

            var floatArryData = [-4.40E+38, 1.3, 3.40E+38];
            var writeShortArrayResult = data.writeFloatArray(floatArryData);
            console.log("SUB_Softbus_IPC_MessageParcel_4700: run writeFloatArray success, result is "
            + writeShortArrayResult);
            expect(writeShortArrayResult == false).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4700: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4800
     * @tc.name    Call the writeShort interface to write the short integer data to the messageparcel instance,
     *             and call readshort to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4800", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var short = 8;
            var writeShor = data.writeShort(short);
            console.log("SUB_Softbus_IPC_MessageParcel_4800: run writeShort success, writeShor is " + writeShor);
            expect(writeShor == true).assertTrue();


            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_4800: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_4800: run sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var readShort = result.reply.readShort();
                console.log("SUB_Softbus_IPC_MessageParcel_4800: run readFloatArray is success, readShort is "
                + readShort);
                expect(readShort == short).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4800: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_4900
     * @tc.name    Call the writeShort interface to write short integer data into the messageparcel instance,
     *             and call readshort (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4900", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4900: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var short = 8;
            var writeShor = data.writeShort(short);
            console.log("SUB_Softbus_IPC_MessageParcel_4900: run writeShort success, writeShor is " + writeShor);
            expect(writeShor == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_4900: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_SHORT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_4900: run sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var newCon;
                result.reply.readShort(newCon);
                console.log("SUB_Softbus_IPC_MessageParcel_4900: run readFloatArray is success, readShort is "
                + readShort);
                expect(newCon == short).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4900: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5000
     * @tc.name    WriteShort interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5000", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5000: create object successfully.");

            var short2 = 32767;
            var writeShor2 = data.writeShort(short2);
            console.log("SUB_Softbus_IPC_MessageParcel_5000: run writeShort success, writeShor2 is " +writeShor2);
            expect(writeShor2 == true).assertTrue();

            var readShort = data.readShort();
            console.log("SUB_Softbus_IPC_MessageParcel_5000: run readFloatArray is success, readShort is "
                + readShort);
            expect(readShort == short2).assertTrue();

            data.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5000: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5100
     * @tc.name    WriteShort interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5100", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5100: create object successfully.");

            var short = -32769;
            var writeShor = data.writeShort(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5100: run writeShort success, writeShor is " +writeShor);
            expect(writeShor == false).assertTrue();

            var short2 = 32768;
            var writeShor2 = data.writeShort(short2);
            console.log("SUB_Softbus_IPC_MessageParcel_5100: run writeShort success, writeShor2 is " +writeShor2);
            expect(writeShor2 == false).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5100: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5200
     * @tc.name    Call writelong interface to write long integer data to messageparcel instance
     *             and call readlong to read data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5200", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5200: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var short = 10000;
            var writelong = data.writeLong(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5200: run writeLong success, writelong is " + writelong);
            expect(writelong == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5200: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_5200: run sendRequest success, result is " 
                             + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var readlong = result.reply.readLong();
                console.log("SUB_Softbus_IPC_MessageParcel_5200: run readLong is success, readlong is " + readlong);
                expect(readShort == short).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5200: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5300
     * @tc.name    Call writelong interface to write long integer data into messageparcel instance and
     *             call readlong (datain: number []) to read data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5300", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5300: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var short = 10000;
            var writelong = data.writeLong(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5300: run writeLong success, writelong is " + writelong);
            expect(writelong == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5300: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(code, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_5300: run sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var readLongData;
                result.reply.readLong(readLongData);
                console.log("SUB_Softbus_IPC_MessageParcel_5300: run readLong is success, readlong is " + readLongData);
                expect(readLongData == short).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5300: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5400
     * @tc.name    Writelong interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5400", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5400: create object successfully.");

            var short = 2147483647;
            var writelong = data.writeLong(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5400: run writeLong success, writelong is " + writelong);
            expect(writelong == true).assertTrue();

            var readlong = data.readLong();
            console.log("SUB_Softbus_IPC_MessageParcel_5400: run readLong is success, readlong is " + readlong);
            expect(readlong == short).assertTrue();

            data.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5400: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5500
     * @tc.name    Writelong interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5500", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5500---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5500: create object successfully.");

            var short = 2147483648;
            var writelong = data.writeLong(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5500: run writeLong success, writelong is " +writelong);
            expect(writelong == false).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5500: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5600
     * @tc.name    Call the parallel interface to read and write data to the double instance
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5600", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5600: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 10.2;
            var result = data.writeDouble(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5600:run writeDouble success, result is " + result);
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5600: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    console.log("SUB_Softbus_IPC_MessageParcel_5600: run sendRequest success, result is "
                                 + result.errCode);
                    var replyReadResult = reply.readDouble();
                    console.log("SUB_Softbus_IPC_MessageParcel_5600: run replyReadResult is success," +
                    "replyReadResult is " + replyReadResult);
                    expect(replyReadResult == token).assertTrue();
                });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5600:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5700
     * @tc.name    Call the writedouble interface, write the data to the messageparcel instance,
     *             and call readdouble (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5700", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5700---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5700: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 11.1;
            var result = data.writeDouble(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5700:run writeDouble success, result is " + result);
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5700: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_5700: run sendRequest success, result is " 
                             + result.errCode);
                var newArray = 0;
                result.reply.readDoubleArray(newArray);
                expect(newArray == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5700:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5800
     * @tc.name    Writedouble interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5800", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5800: create object successfully.");
            var token = 1.79E+308;
            var result = data.writeDouble(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5800:run writeDouble success, result is " + result);
            expect(result == true).assertTrue();
            var readresult = data.readDouble();
            console.log("SUB_Softbus_IPC_MessageParcel_5800:run readDouble success, result is " + readresult);
            expect(readresult == token).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5800:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5900
     * @tc.name    Writedouble interface, illegal value validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5900", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5900: create object successfully.");

            var flag = false;
            var token = "1.79E+465312156";
            var result = data.writeDouble(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5900:run writeDouble success, result is " + result);

            flag = true;
            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5900:error = " + error);
            expect(flag == false).assertTrue();
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6000
     * @tc.name    Call the writeboolean interface to write the data to the messageparcel instance,
     *             and call readboolean to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6000", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6000: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = true;
            var result = data.writeBoolean(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6000:run writeBoolean success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6000: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6000: run sendRequest success, result is " 
                             + result.errCode);
                var replyReadResult = result.reply.readBoolean();
                console.log("SUB_Softbus_IPC_MessageParcel_6000: run readBoolean is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6000:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6100
     * @tc.name    Call the writeboolean interface, write the data to the messageparcel instance,
     *             and call readboolean (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6100", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6100: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = true;
            var result = data.writeBoolean(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6100:run writeBoolean success, result is " + result);
            expect(result == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6100: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6100: sendRequest success, result is " + result.errCode);
                var newReadResult = false;
                reply.readBoolean(newReadResult);
                expect(newReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6100:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6200
     * @tc.name    Writeboolean interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6200", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6200: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 9;
            var result = data.writeBoolean(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6200:run writeBoolean success, result is " + result);
            expect(result == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6200:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6300
     * @tc.name    Call the writechar interface to write the data to the messageparcel instance,
     *             and call readchar to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6300", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6300: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 'a';
            var result = data.writeChar(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6300:run writeChar success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6300: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6300: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readChar();
                console.log("SUB_Softbus_IPC_MessageParcel_6300: run readChar is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6300:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6400
     * @tc.name    Call the writechar interface, write the data to the messageparcel instance,
     *             and call readchar (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6400", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6400: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 'a';
            var result = data.writeChar(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6400:run writeChar success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6400: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6400: run sendRequest success, result is " + result);
                var newReadResult
                result.reply.readChar(newReadResult);
                expect(newReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6400:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6500
     * @tc.name    Writechar interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6500", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6500---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6500: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 'ades';
            var result = data.writeChar(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6500:run writeChar success, result is " + result);
            expect(result == false).assertTrue()
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6500:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6600
     * @tc.name    Call the writestring interface, write the data to the messageparcel instance,
     *             and call readstring (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6600", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6600: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 'aaqa';
            var result = data.writeString(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6600:run writeString success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6600: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6600: run sendRequest success, result is " + result);
                var newReadResult;
                reply.readString(newReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6600:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6700
     * @tc.name    Call the writestring interface to write the data to the messageparcel instance,
     *             and call readstring() to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6700", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6700---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6700: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 'weqea';
            var result = data.writeString(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6700:run writeString success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6700: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6700: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readString();
                console.log("SUB_Softbus_IPC_MessageParcel_6700: run readString is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6700:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6800
     * @tc.name    Writestring interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6800", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 123;
            var result = data.writeString(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6800:run writeString success, result is " + result);
            expect(result == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6800:error = " + error);
        }
        sleep(2000)
        data.reclaim();
        reply.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6900
     * @tc.name    Call the writebyte interface to write data to the messageparcel instance,
     *             and call readbyte to read data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6900", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6900: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 2;
            var result = data.writeByte(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6900:run writeByte success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6900: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6900: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readByte();
                console.log("SUB_Softbus_IPC_MessageParcel_6900: run readByte is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6900:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7000
     * @tc.name    Call the writebyte interface, write the data to the messageparcel instance,
     *             and call readbyte (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7000", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7000: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 2;
            var result = data.writeByte(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7000:run writeByte success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7000: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7000: run sendRequest success, result is " + result);
                var newReadResult = 1
                result.reply.readByte(newReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7000:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7100
     * @tc.name    Writebyte interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7100", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7100: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 127;
            var result = data.writeByte(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7100:run writeByte success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7100: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7100: run sendRequest success, result is " + result);
                var replyReadResult = reply.readByte();
                console.log("SUB_Softbus_IPC_MessageParcel_7100: run readByte is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7100:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7200
     * @tc.name    Writebyte interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7200", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7200: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 128;
            var result = data.writeByte(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7200:run writeByte success, result is " + result);
            expect(result == false).assertTrue();

            var token2 = -129;
            var result2 = data.writeByte(token2);
            console.log("SUB_Softbus_IPC_MessageParcel_7200:run writeByte success, result is " + result2);
            expect(result2 == false).assertTrue();
            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7200:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7300
     * @tc.name    Call the writeint interface to write the data to the messageparcel instance,
     *             and call readint to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7300", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7300: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 2;
            var result = data.writeInt(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7300:run writeInt success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7300: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7300: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readInt();
                console.log("SUB_Softbus_IPC_MessageParcel_7300: run readInt is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7300:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7400
     * @tc.name    Call the writeint interface, write the data to the messageparcel instance,
     *             and call readint (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7400", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7400: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 10;
            var result = data.writeInt(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7400:run writeInt success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7400: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7400: run sendRequest success, result is " + result);
                expect(result == true).assertTrue();
                var newReadResult = 0
                result.reply.readInt(newReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7400:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7500
     * @tc.name    Writeint interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7500", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7500---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7500: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 2147483647;
            var result = data.writeInt(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7500:run writeInt success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7500: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7500: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readInt();
                console.log("SUB_Softbus_IPC_MessageParcel_7500: run readInt is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7500:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7600
     * @tc.name    Writeint interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7600", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7600: create object successfully.");

            var token = 2147483648;
            var result = data.writeInt(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7600:run writeInt success, result is " + result);
            expect(result == false).assertTrue();

            var token2 = -2147483649;
            var result2 = data.writeInt(token2);
            console.log("SUB_Softbus_IPC_MessageParcel_7600:run writeInt success, result is " + result2);
            expect(result2 == false).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7600:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7700
     * @tc.name    Call the writefloat interface to write data to the messageparcel instance,
     *             and call readfloat to read data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7700", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7700---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7700: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 2.2;
            var result = data.writeFloat(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7700:run writeDouble success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7700: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7700: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readFloat();
                console.log("SUB_Softbus_IPC_MessageParcel_7700: run readFloat is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7700:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7800
     * @tc.name    Call the writefloat interface, write the data to the messageparcel instance,
     *             and call readfloat (datain: number []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7800", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 2.4;
            var result = data.writeFloat(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7800:run writeFloat success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7800: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7800: run sendRequest success, result is " + result);
                var newReadResult = 1.2
                result.reply.readFloat(newReadResult);
                expect(newReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7800:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7900
     * @tc.name    Writefloat interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7900", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7900: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            //            var token = -3.4E-38;
            var token = 3.4E+38;
            var result = data.writeFloat(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7900:run writeFloat success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7900: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7900: run sendRequest success, result is " + result);
                var newReadResult = 1.2
                result.reply.readFloat(newReadResult);
                expect(newReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7900:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8000
     * @tc.name    Writefloat interface, illegal value validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8000", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8000: create object successfully.");

            var token = 'a';
            var result = data.writeFloat(token);
            console.log("SUB_Softbus_IPC_MessageParcel_8000:run writeFloat success, result is " + result);
            expect(result == false).assertTrue();
            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8000:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8100
     * @tc.name    Test messageparcel to deliver rawdata data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8100", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8100: create object successfully.");

            var Capacity = data.getRawDataCapacity()
            console.log("SUB_Softbus_IPC_MessageParcel_8100:run Capacity success, Capacity is " + Capacity);

            var rawdata = new Int8Array([1, 2, 3])
            var result = data.writeRawData(rawdata, rawdata.length);
            console.log("SUB_Softbus_IPC_MessageParcel_8100:run writeRawData success, result is " + result);
            expect(result == true).assertTrue();
            var newReadResult = data.readRawData(rawdata.length)
            console.log("SUB_Softbus_IPC_MessageParcel_8100:run readRawData success, result is " + newReadResult);
            expect(newReadResult[0] == rawdata[0]).assertTrue();
            expect(newReadResult[1] == rawdata[1]).assertTrue();
            expect(newReadResult[2] == rawdata[2]).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8100:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8200
     * @tc.name    Illegal value passed in from writerawdata interface
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8200", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8200: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var Capacity = data.getRawDataCapacity()
            console.log("SUB_Softbus_IPC_MessageParcel_8200:run Capacity success, result is " + Capacity);
            var token = new Int8Array([2,1,4,3,129]) ;
            var result = data.writeRawData(token, token.length);
            console.log("SUB_Softbus_IPC_MessageParcel_8200:run writeRawData success, result is " + result);
            expect(result == false).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_8200: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_RAWDATA, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_8200: run sendRequest success, result is " +  result);
                var newReadResult = []
                result.reply.readRawData(newReadResult);
                expect(newReadResult[0] == token[0]).assertTrue();
                expect(newReadResult[1] == token[1]).assertTrue();
                expect(newReadResult[2] == token[2]).assertTrue();
                expect(newReadResult[3] == token[3]).assertTrue();
                expect(newReadResult[4] == token[4]).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8200:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8300
     * @tc.name    Call the writeremoteobject interface to serialize the remote object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8300", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8300: create object successfully.");

            let testRemoteObject = new TestRemoteObject("testObject");
            var result = data.writeRemoteObject(testRemoteObject);
            console.log("SUB_Softbus_IPC_MessageParcel_8300: result is " + result);
            expect(result == true).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8300:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8400
     * @tc.name    Call the writeremoteobject interface to serialize the remote object and pass in the empty object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8400", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8400: create object successfully.");

            var token = {}
            var result = data.writeRemoteObject(token);
            console.log("SUB_Softbus_IPC_MessageParcel_8400: result is " + result);
            expect(result == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8300:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8500
     * @tc.name    Call the writesequenceable interface to write the custom serialized
     *             object to the messageparcel instance
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8500", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8500---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8500: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            let sequenceable = new MySequenceable(1, "aaa");
            let result = data.writeSequenceable(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            let ret = new MySequenceable(0, "");
            let result2 = data.readSequenceable(ret);
            console.log("RpcClient: readSequenceable is " + result2);
            expect(result == result2).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8500:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8600
     * @tc.name    After the server finishes processing, write noexception first before writing the result,
     *             and the client calls readexception to judge whether the server is abnormal
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8600", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8600: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var result = data.writeNoException();
            console.log("SUB_Softbus_IPC_MessageParcel_8600 result is" + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_8600: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_8600: run sendRequest success, result is " + result);
                var readResult = result.reply.readException()
                console.log("RpcClient: readResult is " + readResult);
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8600:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8700
     * @tc.name    If the data on the server is abnormal, the client calls readexception
     *             to judge whether the server is abnormal
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8700", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8700---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8700: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = new MySequenceable(1, "aaa");
            var result = data.writeSequenceable(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_8600: gIRemoteObject is undefined");
            }
            await  gIRemoteObject.sendRequest(CODE_WRITE_NOEXCEPTION, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_8700: run sendRequest success, result is " + result);
                var ReadResult = result.reply.readException();
                console.log("SUB_Softbus_IPC_MessageParcel_8700: run ReadResult result is " + ReadResult);
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8700:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8800
     * @tc.name    Serializable object marshaling and unmarshalling test
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8800", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = new MySequenceable(1, "aaa");
            var result = data.writeSequenceable(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_8800: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_8800: run sendRequest success, result is " + result);
                var s = new MySequenceable(null,null)
                result.reply.readSequenceable(s);
                console.log("SUB_Softbus_IPC_MessageParcel_8800: run readSequenceable is success," +
                "result is " + s);
                expect(s == sequenceable).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8800:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_8900
     * @tc.name    Non serializable object marshaling test
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_8900", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_8900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_8900: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = new MySequenceable(1, "aaa");
            var result = data.writeSequenceable(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_8900: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_8900: run sendRequest success, result is " + result);
                var s = new MySequenceable(null,null)
                var replyReadResult = reply.readSequenceable(s);
                console.log("SUB_Softbus_IPC_MessageParcel_8900: run readSequenceable is success," +
                "result is " + replyReadResult);
                expect(reply.replyReadResult).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_8900:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_8900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9000
     * @tc.name    The server did not send a serializable object, and the client was ungrouped
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9000", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9000: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = 10;
            var result = data.writeInt(sequenceable);
            console.log("RpcClient: writeInt is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_9000: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_9000: run sendRequest success, result is " + result);
                var s = new MySequenceable(0,null)
                var replyReadResult = result.reply.readSequenceable(s);
                console.log("SUB_Softbus_IPC_MessageParcel_9000: run readShortArray is success," +
                "result is " + replyReadResult);
                expect(reply.replyReadResult).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9000:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9100
     * @tc.name    Call the writesequenceable interface to write the custom serialized object to the
     *             messageparcel instance, and call readsequenceable to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9100", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9100: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = new MySequenceable(0, "aaa");
            var result = data.writeSequenceable(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_9100: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_9100: run sendRequest success, result is " + result);
                var s = new MySequenceable(null,null)
                var replyReadResult = result.reply.readSequenceable(s);
                console.log("SUB_Softbus_IPC_MessageParcel_9100: run readSequenceable is success," +
                "result is " + replyReadResult);
                expect(reply.replyReadResult).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9100:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9200
     * @tc.name    Call the writesequenceablearray interface to write the custom serialized object to the
     *             messageparcel instance, and call readsequenceablearray to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9200", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9200: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = [new MySequenceable(1, "aaa"),
            new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")];
            var result = data.writeSequenceableArray(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_9200: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_9200: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readSequenceableArray();
                console.log("SUB_Softbus_IPC_MessageParcel_9200: run readShortArray is success," +
                "result is " + replyReadResult);
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9200:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9300
     * @tc.name    Call the writesequenceablearray interface to write the custom serialized object to the
     *             messageparcel instance, and call readsequenceablearray to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9300", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9300: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = [new MySequenceable(1, "aaa"),
            new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")];
            var result = data.writeSequenceableArray(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_9300: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_SEQUENCEABLEARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_9300: run sendRequest success, result is " + result);
                var s = [new MySequenceable(null, null),
                new MySequenceable(null, null), new MySequenceable(null, null)]
                var replyReadResult = reply.readSequenceableArray(s);
                console.log("SUB_Softbus_IPC_MessageParcel_9300: run readSequenceableArray is success," +
                "result is " + replyReadResult);
                expect(reply.replyReadResult).assertTrue();
                for (let i = 0; i < s.length; i++) {
                    expect(s[i].str).assertEqual(sequenceable[i].str)
                    expect(s[i].num).assertEqual(sequenceable[i].num)
                }
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9300:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9400
     * @tc.name    Call the writesequenceablearray interface to write the custom
     *             serialized object to the messageparcel instance
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9400", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9400: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var sequenceable = [new MySequenceable(1, "aaa"),
            new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")];
            var result = data.writeSequenceableArray(sequenceable);
            console.log("RpcClient: writeSequenceable is " + result);
            expect(result == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9400:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9500
     * @tc.name    Call the writeremoteobjectarray interface to write the object array to the messageparcel
     *             instance, and call readremoteobjectarray to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9500", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9500---------------------------");
        try{
            let count = 0
            function checkResult(num, str) {
                expect(num).assertEqual(123)
                expect(str).assertEqual("rpcListenerTest")
                count++
                console.info("check result done, count: " + count)
                if (count == 3) {
                    done()
                }
            }
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9500: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var TestRemoteObject = [new TestRemoteObject("rpcListener", checkResult),
            new TestRemoteObject("rpcListener2", checkResult),
            new TestRemoteObject("rpcListener3", checkResult)];
            var result = data.writeRemoteObjectArray(TestRemoteObject);
            console.log("RpcClient: writeRemoteObjectArray is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_9500: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECTARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_9500: run sendRequest success, result is " + result);
                var replyReadResult = result.reply.readRemoteObjectArray();
                console.log("SUB_Softbus_IPC_MessageParcel_9500: run readRemoteObjectArray" +
                "result is " + replyReadResult);
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9300:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9600
     * @tc.name    Call the writeremoteobjectarray interface to write the object array to the messageparcel instance,
     *             and call readremoteobjectarray (objects: iremoteobject []) to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9600", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9600: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var TestRemoteObject = [new TestRemoteObject("rpcListener", checkResult),
            new TestRemoteObject("rpcListener2", checkResult),
            new TestRemoteObject("rpcListener3", checkResult)];
            var result = data.writeRemoteObjectArray(TestRemoteObject);
            console.log("RpcClient: writeRemoteObjectArray is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_9600: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECTARRAY, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_9600: run sendRequest success, result is " + result);
                var s = [new TestRemoteObject(null, null), new TestRemoteObject(null, null),
                new TestRemoteObject(null, null)]
                var replyReadResult = result.reply.readSequenceableArray(s);
                console.log("SUB_Softbus_IPC_MessageParcel_9600: run readSequenceableArray," +
                "result is " + replyReadResult);
                expect(reply.replyReadResult).assertTrue();
                for (let i = 0; i < s.length; i++) {
                    expect(s[i].str).assertEqual(TestRemoteObject[i].str)
                    expect(s[i].num).assertEqual(TestRemoteObject[i].num)
                }
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9600:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_9700
     * @tc.name    Test messageparcel delivery file descriptor object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_9700", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_9700---------------------------");
        let context = FA.getContext()
        await context.getFilesDir()
            .then(async function(path) {
                console.info("data: " + path)
                expect(path != null).assertTrue()
                let basePath = path;
                let filePath = basePath + "/test1.txt";
                let fd = fileio.openSync(filePath, 0o2| 0o100 | 0o2000, 0o666);
                console.info("open file, fd: " + fd)
                expect(fd >= 0).assertTrue()
                let str = "HELLO RPC"
                let bytesWr = fileio.writeSync(fd, str);
                console.log("SUB_Softbus_IPC_IRemoteObject_9700 bytesWr is" + bytesWr);
                let option = new rpc.MessageOption()
                let data = rpc.MessageParcel.create()
                let reply = rpc.MessageParcel.create()
                let result = data.containFileDescriptors()
                expect(result == true).assertTrue()
                let writeInt = data.writeInt(bytesWr)
                console.log("The result is :" + writeInt)
                expect(writeInt == true).assertTrue()
                let writeFileDescriptor = data.writeFileDescriptor(fd)
                console.log("The result is :" + writeFileDescriptor)
                expect(writeFileDescriptor == true).assertTrue()
                let result1 = data.containFileDescriptors()
                console.log("containFileDescriptors result1 is " + result1)
                expect(data.containFileDescriptors()).assertTrue()
                await gIRemoteObject.sendRequest(9, data, reply, option)
                    .then(function(result) {
                        console.info("sendRequest done, error code: " + result.errCode)
                        expect(result.errCode).assertEqual(0)
                        let buf = new ArrayBuffer(str.length * 2);
                        let bytesRd = fileio.readSync(fd, buf, {position:0,});
                        let fdResult = reply.readFileDescriptor()
                        console.log("The result is ：" + fdResult)
                        let content = String.fromCharCode.apply(null, new Uint8Array(buf));
                        console.log("bytes read: " + bytesRd + ", content: " + content + ", length: " + content.length);
                        expect(content).assertEqual(str + str)
                        let dupFd = rpc.MessageParcel.dupFileDescriptor(fd);
                        let buf2 = new ArrayBuffer(str.length * 2);
                        let byteRd2 = fileio.readSync(dupFd, buf2, {position:0,});
                        let content2 = String.fromCharCode.apply(null, new Uint8Array(buf2));
                        console.log("dupFd bytes read: " + byteRd2 + ", content2: " + content2);
                        expect(content2).assertEqual(str + str)
                        rpc.MessageParcel.closeFileDescriptor(fd);
                        rpc.MessageParcel.closeFileDescriptor(dupFd);
                    })
                try {
                    console.info("after close fd, write again")
                    fileio.writeSync(fd, str)
                    expect(0).assertEqual(1) // should not go here
                } catch(e) {
                    console.error("got exception: " + e)
                }
            })
        done()
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_9700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9800
     * @tc.name    Test messageparcel to deliver the reply message received in promise across processes
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9800", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            expect(data.writeByte(2)).assertTrue()
            expect(data.writeShort(3)).assertTrue()
            expect(data.writeInt(4)).assertTrue()
            expect(data.writeLong(5)).assertTrue()
            expect(data.writeFloat(1.2)).assertTrue()
            expect(data.writeDouble(10.2)).assertTrue()
            expect(data.writeBoolean(true)).assertTrue()
            expect(data.writeChar('a')).assertTrue()
            expect(data.writeString("HelloWorld")).assertTrue()
            expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue()

            await gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option).then((result) => {
                console.info("sendRequest done, error code: " + result.errCode)
                expect(result.errCode).assertEqual(0)
                expect(result.reply.readByte()).assertEqual(2)
                expect(result.reply.readShort()).assertEqual(3)
                expect(result.reply.readInt()).assertEqual(4)
                expect(result.reply.readLong()).assertEqual(5)
                expect(result.reply.readFloat()).assertEqual(1.2)
                expect(result.reply.readDouble()).assertEqual(10.2)
                expect(result.reply.readBoolean()).assertTrue()
                expect(result.reply.readChar()).assertEqual('a')
                expect(result.reply.readString()).assertEqual("HelloWorld")
                let s = new MySequenceable(null, null)
                expect(result.reply.readSequenceable(s)).assertTrue()
                expect(s.num).assertEqual(1)
                expect(s.str).assertEqual("aaa")
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9800:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_9900
     * @tc.name    Test the cross process delivery of messageparcel and receive the reply message
     *             in the callback function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_9900", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_9900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            expect(data.writeByte(2)).assertTrue()
            expect(data.writeShort(3)).assertTrue()
            expect(data.writeInt(4)).assertTrue()
            expect(data.writeLong(5)).assertTrue()
            expect(data.writeFloat(1.2)).assertTrue()
            expect(data.writeDouble(10.2)).assertTrue()
            expect(data.writeBoolean(true)).assertTrue()
            expect(data.writeChar('a')).assertTrue()
            expect(data.writeString("HelloWorld")).assertTrue()
            expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue()

            gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option,(err, result) => {
                console.info("sendRequest done, error code: " + result.errCode)
                expect(result.errCode).assertEqual(0)
                expect(result.reply.readByte()).assertEqual(2)
                expect(result.reply.readShort()).assertEqual(3)
                expect(result.reply.readInt()).assertEqual(4)
                expect(result.reply.readLong()).assertEqual(5)
                expect(result.reply.readFloat()).assertEqual(1.2)
                expect(result.reply.readDouble()).assertEqual(10.2)
                expect(result.reply.readBoolean()).assertTrue()
                expect(result.reply.readChar()).assertEqual('a')
                expect(result.reply.readString()).assertEqual("HelloWorld")
                let s = new MySequenceable(null, null)
                expect(result.reply.readSequenceable(s)).assertTrue()
                expect(s.num).assertEqual(1)
                expect(s.str).assertEqual("aaa")
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_9900:error = " + error);
        }
        sleep(2000)
        data.reclaim();
        reply.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_9900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_10000
     * @tc.name    Test the cross process transmission of messageparcel.
     *             After receiving the reply message in promise, read various types of arrays in order
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_10000", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_10000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            expect(data.writeByteArray([1, 2, 3])).assertTrue()
            expect(data.writeShortArray([4, 5, 6])).assertTrue()
            expect(data.writeIntArray([7, 8, 9])).assertTrue()
            expect(data.writeLongArray([10, 11, 12])).assertTrue()
            expect(data.writeFloatArray([1.1, 1.2, 1.3])).assertTrue()
            expect(data.writeDoubleArray([2.1, 2.2, 2.3])).assertTrue()
            expect(data.writeBooleanArray([true, true, false])).assertTrue()
            expect(data.writeCharArray(['a', 'b', 'c'])).assertTrue()
            expect(data.writeStringArray(['abc', 'seggg'])).assertTrue()
            let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")]
            expect(data.writeSequenceableArray(a)).assertTrue()
            gIRemoteObject.sendRequest(CODE_ALL_ARRAY_TYPE, data, reply, option,(err, result) => {
                expect(result.errCode).assertEqual(0)
                assertArrayElementEqual(result.reply.readByteArray(), [1, 2, 3])
                assertArrayElementEqual(result.reply.readShortArray(), [4, 5, 6])
                assertArrayElementEqual(result.reply.readIntArray(), [7, 8, 9])
                assertArrayElementEqual(result.reply.readLongArray(), [10, 11, 12])
                assertArrayElementEqual(result.reply.readFloatArray(), [1.1, 1.2, 1.3])
                assertArrayElementEqual(result.reply.readDoubleArray(), [2.1, 2.2, 2.3])
                assertArrayElementEqual(result.reply.readBooleanArray(), [true, true, false])
                assertArrayElementEqual(result.reply.readCharArray(), ['a', 'b', 'c'])
                assertArrayElementEqual(result.reply.readStringArray(), ['abc', 'seggg'])
                let b = [new MySequenceable(null, null), new MySequenceable(null, null), 
                    new MySequenceable(null, null)]
                result.reply.readSequenceableArray(b)
                for (let i = 0; i < b.length; i++) {
                    expect(b[i].str).assertEqual(a[i].str)
                    expect(b[i].num).assertEqual(a[i].num)
                }
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_10000:error = " + error);
        }
        sleep(2000)
        data.reclaim();
        reply.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_10000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_11000
     * @tc.name    Test messageparcel cross process delivery. After receiving the reply message in promise,
     *             the client constructs an empty array in sequence and reads the data from the reply message
     *             into the corresponding array
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_11000", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_11000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_9800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            expect(data.writeByteArray([1, 2, 3])).assertTrue()
            expect(data.writeShortArray([4, 5, 6])).assertTrue()
            expect(data.writeIntArray([7, 8, 9])).assertTrue()
            expect(data.writeLongArray([10, 11, 12])).assertTrue()
            expect(data.writeFloatArray([1.1, 1.2, 1.3])).assertTrue()
            expect(data.writeDoubleArray([2.1, 2.2, 2.3])).assertTrue()
            expect(data.writeBooleanArray([true, true, false])).assertTrue()
            expect(data.writeCharArray(['a', 'b', 'c'])).assertTrue()
            expect(data.writeStringArray(['abc', 'seggg'])).assertTrue()
            let a = [new MySequenceable(1, "aaa"), new MySequenceable(2, "bbb"), new MySequenceable(3, "ccc")]
            expect(data.writeSequenceableArray(a)).assertTrue()
            await gIRemoteObject.sendRequest(CODE_ALL_ARRAY_TYPE, data, reply, option).then((result) => {
                expect(result.errCode).assertEqual(0)
                assertArrayElementEqual(result.reply.readByteArray(), [1, 2, 3])
                assertArrayElementEqual(result.reply.readShortArray(), [4, 5, 6])
                assertArrayElementEqual(result.reply.readIntArray(), [7, 8, 9])
                assertArrayElementEqual(result.reply.readLongArray(), [10, 11, 12])
                assertArrayElementEqual(result.reply.readFloatArray(), [1.1, 1.2, 1.3])
                assertArrayElementEqual(result.reply.readDoubleArray(), [2.1, 2.2, 2.3])
                assertArrayElementEqual(result.reply.readBooleanArray(), [true, true, false])
                assertArrayElementEqual(result.reply.readCharArray(), ['a', 'b', 'c'])
                assertArrayElementEqual(result.reply.readStringArray(), ['abc', 'seggg'])
                let b = [new MySequenceable(null, null), new MySequenceable(null, null), 
                    new MySequenceable(null, null)]
                result.reply.readSequenceableArray(b)
                for (let i = 0; i < b.length; i++) {
                    expect(b[i].str).assertEqual(a[i].str)
                    expect(b[i].num).assertEqual(a[i].num)
                }
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_11000:error = " + error);
        }
        sleep(2000)
        data.reclaim();
        reply.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_11000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_10200
     * @tc.name    Test messageparcel to pass an object of type iremoteobject across processes
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Softbus_IPC_MessageParcel_10200', 0, async function(done) {
        console.info("SUB_Softbus_IPC_MessageParcel_10200")
        function checkResult(num, str) {
            expect(num).assertEqual(123)
            expect(str).assertEqual("rpcListenerTest")
            done()
        }
        let option = new rpc.MessageOption()
        let data = rpc.MessageParcel.create()
        let reply = rpc.MessageParcel.create()
        let listener = new TestListener("rpcListener", checkResult)
        let result = data.writeRemoteObject(listener)
        expect(result == true).assertTrue()
        console.info("SUB_Softbus_IPC_MessageParcel_10200 result is:" + result)
        expect(data.writeInt(123)).assertTrue()
        expect(data.writeString("rpcListenerTest")).assertTrue()
        let ReadResult = data.readRemoteObject()
        console.log("SUB_Softbus_IPC_MessageParcel_10200 ReadResult is:" + ReadResult)
        await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECT , data, reply, option)
            .then(function(result) {
                console.info("sendRequest done, error code: " + result.errCode)
                expect(result.errCode).assertEqual(0)
                result.reply.readException()
            })
            .catch(function(e) {
                console.error("send request got exception: " + e)
                expect(0).assertEqual(1)
            })
            .finally(() => {
                data.reclaim()
                reply.reclaim()
                console.log("test done")
            })
    })

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_10300
     * @tc.name    Test messageparcel to pass an array of iremoteobject objects across processes
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Softbus_IPC_MessageParcel_10300', 0, async function(done) {
        console.info("SUB_Softbus_IPC_MessageParcel_10300")

        function checkResult(num, str) {
            expect(num).assertEqual(123)
            expect(str).assertEqual("rpcListenerTest")
            done()
        }
        let option = new rpc.MessageOption()
        let data = rpc.MessageParcel.create()
        let reply = rpc.MessageParcel.create()
        let listeners = [new TestListener("rpcListener", checkResult),
        new TestListener("rpcListener2", checkResult),
        new TestListener("rpcListener3", checkResult)]
        let result = data.writeRemoteObject(listeners)
        expect(result == true).assertTrue()
        console.info("SUB_Softbus_IPC_MessageParcel_10300 result is:" + result)
        expect(data.writeInt(123)).assertTrue()
        expect(data.writeString("rpcListenerTest")).assertTrue()
        let ReadResult = data.readRemoteObject()
        console.log("SUB_Softbus_IPC_MessageParcel_10300 ReadResult is:" + ReadResult)
        await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECT, data, reply, option)
            .then(function(result) {
                console.info("sendRequest done, error code: " + result.errCode)
                expect(result.errCode).assertEqual(0)
                result.reply.readException()
            })
            .catch(function(e) {
                console.error("send request got exception: " + e)
                expect(0).assertEqual(1)
            })
            .finally(() => {
                data.reclaim()
                reply.reclaim()
                console.log("test done")
            })
        done();
        data.reclaim();
        reply.reclaim();
    })

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_10400
     * @tc.name    Test messageparcel to pass the array of iremoteobject objects across processes. The server
     *             constructs an empty array in onremoterequest and reads it from messageparcel
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Softbus_IPC_MessageParcel_10400', 0, async function(done) {
        console.info("SUB_Softbus_IPC_MessageParcel_10400")
        function checkResult(num, str) {
            expect(num).assertEqual(123)
            expect(str).assertEqual("rpcListenerTest")
            done()
        }
        let option = new rpc.MessageOption()
        let data = rpc.MessageParcel.create()
        let reply = rpc.MessageParcel.create()
        let listeners = [new TestListener("rpcListener", checkResult),
        new TestListener("rpcListener2", checkResult),
        new TestListener("rpcListener3", checkResult)]
        let result = data.writeRemoteObject(listeners)
        expect(result == true).assertTrue()
        console.info("SUB_Softbus_IPC_MessageParcel_10400 result is:" + result)
        expect(data.writeInt(123)).assertTrue()
        expect(data.writeString("rpcListenerTest")).assertTrue()
        let ReadResult = data.readRemoteObject()
        console.log("SUB_Softbus_IPC_MessageParcel_10400 ReadResult is:" + ReadResult)
        await gIRemoteObject.sendRequest(CODE_WRITE_REMOTEOBJECT, data, reply, option)
            .then(function(result) {
                console.info("sendRequest done, error code: " + result.errCode)
                expect(result.errCode).assertEqual(0)
                result.reply.readException()
            })
            .catch(function(e) {
                console.error("send request got exception: " + e)
                expect(0).assertEqual(1)
            })
            .finally(() => {
                data.reclaim()
                reply.reclaim()
                console.log("test done")
            })
        done();
        data.reclaim();
        reply.reclaim();
    })

    /*
     * @tc.number  SUB_Softbus_IPC_MessageOption_0100
     * @tc.name    Basic method of testing messageoption
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageOption_0100",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageOption_0100---------------------------");
        try{
            let option = new rpc.MessageOption();
            console.log("SUB_Softbus_IPC_MessageOption_0100: create object successfully.");

            let time = option.getWaitTime();
            console.log("SUB_Softbus_IPC_MessageOption_0100: run getWaitTime success, time is " + time);
            expect(time == rpc.MessageOption.TF_WAIT_TIME).assertTrue();

            let flog = option.getFlags();
            console.log("SUB_Softbus_IPC_MessageOption_0100: run getFlags success, flog is " + flog);
            expect(flog == rpc.MessageOption.TF_SYNC).assertTrue();

            option.setFlags(rpc.MessageOption.TF_SYNC)
            console.log("SUB_Softbus_IPC_MessageOption_0100: run setFlags success");

            let flog2 = option.getFlags();
            console.log("SUB_Softbus_IPC_MessageOption_0100: run getFlags success, flog2 is " + flog2);

            option.setWaitTime(16);

            let time2 = option.getWaitTime();
            console.log("SUB_Softbus_IPC_MessageOption_0100: run getWaitTime success, time is " + time2);
            expect(time2 == 16).assertTrue();
        }catch(error){
            console.log("SUB_Softbus_IPC_MessageOption_0100: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageOption_0100---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_MessageOption_0200
     * @tc.name    Setflags interface outlier detection
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageOption_0200",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageOption_0200---------------------------");
        try{
            let option = new rpc.MessageOption();
            console.log("SUB_Softbus_IPC_MessageOption_0200: create object successfully.");

            let time = option.getWaitTime();
            console.log("SUB_Softbus_IPC_MessageOption_0200: run getWaitTime success, time is " + time);
            expect(time == rpc.MessageOption.TF_WAIT_TIME).assertTrue();

            let flog = option.getFlags();
            console.log("SUB_Softbus_IPC_MessageOption_0200: run getFlags success, flog is " + flog);
            expect(flog == rpc.MessageOption.TF_SYNC);

            option.setFlags(3);
        }catch(error){
            console.log("SUB_Softbus_IPC_MessageOption_0200: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageOption_0200---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0100
     * @tc.name    Exception parameter validation of the created anonymous shared memory object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0100",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0100---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", -1)
//            expect(ashmem).assertNull()
            console.log("SUB_Softbus_IPC_Ashmem_0100: ashmem " + ashmem);

            let ashmem2 = rpc.Ashmem.createAshmem(null, 1024)
            console.log("SUB_Softbus_IPC_Ashmem_0100: ashmem2 " + ashmem2);
//            expect(ashmem2).assertNull()

//            ashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0100: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0100---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0200
     * @tc.name    Call the getashmemsize interface to get the size of the shared memory object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0200",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0200---------------------------");
        try{
            let map_size = 4096;
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", map_size)
            console.log("SUB_Softbus_IPC_Ashmem_0200: run  createAshmem success");

            let size = ashmem.getAshmemSize()
            console.log("SUB_Softbus_IPC_Ashmem_0200: run getAshmemSize success, size is " + size);
            expect(size == map_size).assertTrue();

            ashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0200: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0200---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0300
     * @tc.name    Call the getashmemsize interface to get the size of the shared memory object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0300",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0300---------------------------");
        try{
            let map_size = 4096;
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", map_size)
            console.log("SUB_Softbus_IPC_Ashmem_0300: run  createAshmem success");

            let size = ashmem.getAshmemSize()
            console.log("SUB_Softbus_IPC_Ashmem_0300: run getAshmemSize success, size is " + size);
            expect(size == map_size).assertTrue();

            ashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0300: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0300---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0400
     * @tc.name    Writeashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0400",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0400---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_0400: ashmem " + ashmem);

            ashmem.closeAshmem()

            var data = rpc.MessageParcel.create();
            let writeAshmem = data.writeAshmem(ashmem);
            console.log("SUB_Softbus_IPC_Ashmem_0400: run writeAshmem success, writeAshmem is " + writeAshmem);
            expect(writeAshmem == false).assertTrue();

            data.reclaim();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0400: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0400---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0500
     * @tc.name    Readfromashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0500",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0500---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_0500: ashmem " + ashmem);

            ashmem.unmapAshmem()
            console.log("SUB_Softbus_IPC_Ashmem_0500: run unmapAshmem success");

            let bytes = new Int8Array([1, 2, 3, 4, 5])

            let ret = ashmem.readFromAshmem(bytes.length, 0);
            console.log("SUB_Softbus_IPC_Ashmem_0500: run readFromAshmem result is " + ret);
            expect(ret==null).assertTrue();

            ashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0500: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0500---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0600
     * @tc.name    Mapashmem interface creates shared file mappings
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0600",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0600---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_0600: ashmem " + ashmem);

            let result = ashmem.mapAshmem(rpc.Ashmem.PROT_READ);
            console.log("SUB_Softbus_IPC_Ashmem_0600: run mapAshmem success, result is " + result);
            expect(result == true).assertTrue();

            ashmem.closeAshmem()
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0600: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0600---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0700
     * @tc.name    Mapashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0700",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0700---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_0700: ashmem " + ashmem);

            let result = ashmem.mapAshmem(999);
            console.log("SUB_Softbus_IPC_Ashmem_0700: run mapAshmem success, result is " + result);
            expect(result == false).assertTrue();

            ashmem.closeAshmem()
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0700: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0700---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0800
     * @tc.name    Mapreadandwriteashmem interface creates a shared file map with the protection level of read-write
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0800",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0800---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 1024)
            console.log("SUB_Softbus_IPC_Ashmem_0800: ashmem " + ashmem);

            let result = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_0800: run mapAshmem success, result is " + result);

            ashmem.closeAshmem()

        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0800: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0800---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0900
     * @tc.name    Mapreadandwriteashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_0900",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_0900---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_0900: ashmem " + ashmem);

            let result = ashmem.mapAshmem(rpc.Ashmem.PROT_READ);
            console.log("SUB_Softbus_IPC_Ashmem_0900: run mapAshmem success, result is " + result);
            expect(result == true).assertTrue();

            ashmem.unmapAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_0900: run unmapAshmem success");

            let result2 = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_0900: run mapReadAndWriteAshmem success, result2 is " + result2);
            expect(result2 == false).assertTrue();

            ashmem.closeAshmem()
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_0900: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_0900---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1000
     * @tc.name    Mapreadonlyashmem interface creates a shared file map with the protection level of read-write
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1000",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1000---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_1000: ashmem " + ashmem);

            let result = ashmem.mapReadOnlyAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1000: run mapReadAndWriteAshmem success, result is " + result);
            expect(result == true).assertTrue();

            ashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1000: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1000---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_0900
     * @tc.name    Mapreadonlyashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1100",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1100---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 1024)
            expect(ashmem).assertTrue()
            console.log("SUB_Softbus_IPC_Ashmem_1100: ashmem " + ashmem);

            let result = ashmem.mapAshmem(rpc.Ashmem.PROT_WRITE);
            console.log("SUB_Softbus_IPC_Ashmem_1100: run mapAshmem success, result is " + result);
            expect(result == true).assertTrue();

            ashmem.unmapAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1100: run unmapAshmem success");

            let result2 = ashmem.mapReadOnlyAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1100: run mapReadAndWriteAshmem success, result2 is " + result2);
            expect(result2 == false).assertTrue();

            ashmem.closeAshmem()

        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1100: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1100---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1200
     * @tc.name    Mapreadonlyashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1200",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1200---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 1024);

            let resultwrite = ashmem.setProtection(rpc.Ashmem.PROT_WRITE)
            console.log("SUB_Softbus_IPC_Ashmem_1200: run setProtection success, resultwrite is " + resultwrite);
            expect(resultwrite == true).assertTrue();

            let resultread = ashmem.setProtection(rpc.Ashmem.PROT_READ)
            console.log("SUB_Softbus_IPC_Ashmem_1200: run setProtection success, resultread is " + resultread);
            expect(resultread == false).assertTrue();

            let resultreadAndwrite = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1200: run setProtection success, mapReadAndWriteAshmem is " + resultreadAndwrite);
            expect(resultreadAndwrite == false).assertTrue();

            let resultnone = ashmem.setProtection(rpc.Ashmem.PROT_NONE)
            console.log("SUB_Softbus_IPC_Ashmem_1200: run setProtection success, resultnone is " + resultnone);
            expect(resultnone == true).assertTrue();

            let resultread2 = ashmem.setProtection(rpc.Ashmem.PROT_READ)
            console.log("SUB_Softbus_IPC_Ashmem_1200: run setProtection success, resultread2 is " + resultread2);
            expect(resultread2 == false).assertTrue();

            ashmem.closeAshmem()
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1200: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1200---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1300
     * @tc.name    Setprotection exception input parameter verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1300",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1300---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 1024);
            console.log("SUB_Softbus_IPC_Ashmem_1300: ashmem " + ashmem);

            let result = ashmem.setProtection(3)
            console.log("SUB_Softbus_IPC_Ashmem_1300: run setProtection success, result is " + result);
            expect(result == false).assertTrue();

            ashmem.closeAshmem()
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1300: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1300---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1400
     * @tc.name    The writetoashmem interface writes the shared file associated with the object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1400",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1200---------------------------");
        try{
            let map_size = 4096
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", map_size)
            console.log("SUB_Softbus_IPC_Ashmem_1400: ashmem " + ashmem);

            let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1400: run mapReadAndWriteAshmem success, result2 is " + resultMapRAndW);
            expect(resultMapRAndW == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3, 4, 5]);

            let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
            console.log("SUB_Softbus_IPC_Ashmem_1400: run writeToAshmem success, result is " + result);
            expect(result == true).assertTrue();

            ashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1400: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1400---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1500
     * @tc.name    The writetoashmem interface writes the shared file associated with the object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1500",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1500---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_1500: ashmem " + ashmem);

            let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1500: run mapReadAndWriteAshmem success, result2 is " 
                         + resultMapRAndW);
            expect(resultMapRAndW == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3, 4, 5]);
            let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
            console.log("SUB_Softbus_IPC_Ashmem_1500: run writeToAshmem success, result is " +result);
            expect(result == true).assertTrue();

            let resultread = ashmem.setProtection(rpc.Ashmem.PROT_READ);
            console.log("SUB_Softbus_IPC_Ashmem_1500: run setProtection success, resultread is " + resultread);
            expect(resultread == true).assertTrue()

            let result2 = ashmem.writeToAshmem(bytes, bytes.length, 0);
            console.log("SUB_Softbus_IPC_Ashmem_1500: run writeToAshmem success, result is2 " + result2);
            expect(result2 == false).assertTrue()

            ashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1500: error " +error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1500---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1600
     * @tc.name    Writetoashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1600",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1600---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
            console.log("SUB_Softbus_IPC_Ashmem_1600: ashmem " + ashmem);

            let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1600: run mapReadAndWriteAshmem success, result2 is " 
                         + resultMapRAndW);
            expect(resultMapRAndW == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3, 4, 5]);
            let size = bytes.length + 10;
            let result = ashmem.writeToAshmem(bytes, 3, 0);
            console.log("SUB_Softbus_IPC_Ashmem_1600: run writeToAshmem success, result is " + result);
            expect(result == false).assertTrue()

            ashmem.closeAshmem()

        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1600: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1600---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1700
     * @tc.name    Read data from the shared file associated with readfromashmem
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1700",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1700---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_1700: ashmem " + ashmem);

            let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1600: run mapReadAndWriteAshmem success, result2 is " 
                         + resultMapRAndW);
            expect(resultMapRAndW == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3, 4, 5]);
            let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
            console.log("SUB_Softbus_IPC_Ashmem_1700: run writeToAshmem success, result is " + result);
            expect(result == true).assertTrue();

            var resultRead = ashmem.readFromAshmem(bytes.length, 0);
            console.log("SUB_Softbus_IPC_Ashmem_1700: run readFromAshmem success, result is " + resultRead);
            expect(resultRead[0] == bytes[0]).assertTrue();
            expect(resultRead[1] == bytes[1]).assertTrue();
            expect(resultRead[2] == bytes[2]).assertTrue();
            expect(resultRead[3] == bytes[3]).assertTrue();
            expect(resultRead[4] == bytes[4]).assertTrue();

            ashmem.closeAshmem()

        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1700: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1700---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1800
     * @tc.name    Readfromashmem exception validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1800",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1800---------------------------");
        try{

            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
            console.log("SUB_Softbus_IPC_Ashmem_1800: ashmem " + ashmem);

            let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1800: run mapReadAndWriteAshmem success, result2 is " 
                         + resultMapRAndW);
            expect(resultMapRAndW == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3, 4, 5]);
            let result = ashmem.writeToAshmem(bytes, bytes.length, 1);
            console.log("SUB_Softbus_IPC_Ashmem_1800: run writeToAshmem success, result is " + result);
            expect(result == true).assertTrue()

            let result2 = ashmem.readFromAshmem(bytes.length, 3);
            console.log("SUB_Softbus_IPC_Ashmem_1800: run readFromAshmem success, result2 is " + result2);
            expect(bytes[2] == result2[0]).assertTrue();
            expect(bytes[3] == result2[1]).assertTrue();
            expect(bytes[4] == result2[2]).assertTrue();

            ashmem.closeAshmem()

        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1800: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1800---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_1900
     * @tc.name    Createashmemfromexisting copies the ashmem object description and creates a new object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_1900",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_1900---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096)
            console.log("SUB_Softbus_IPC_Ashmem_1900: ashmem " + ashmem);

            let resultWriteAndRead = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1900:  run mapReadAndWriteAshmem result is " + resultWriteAndRead);
            expect(resultWriteAndRead == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3]);
            let result = ashmem.writeToAshmem(bytes, bytes.length, 1);
            console.log("SUB_Softbus_IPC_Ashmem_1900: run writeToAshmem success, result is " + result);
            expect(result == true).assertTrue()

            let newashmem = rpc.Ashmem.createAshmemFromExisting(ashmem);
            let resultWriteAndRead2 = newashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_1900:  run mapReadAndWriteAshmem result is " + resultWriteAndRead2);
            expect(resultWriteAndRead2 == true).assertTrue();

            let result2 = newashmem.readFromAshmem(bytes.length, 1);
            console.log("SUB_Softbus_IPC_Ashmem_1900: run readFromAshmem success, result2 is " + result2);
            expect(result == true).assertTrue()
            expect(result2[0] == bytes[0]).assertTrue()
            expect(result2[1] == bytes[1]).assertTrue()
            expect(result2[2] == bytes[2]).assertTrue()

            ashmem.closeAshmem();
            newashmem.closeAshmem();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_1900: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_1900---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_2000
     * @tc.name    Create a shared memory object and call writeashmem to write the shared anonymous
      object into the messageparcel object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_2000",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_2000---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 1024);
            let data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_Ashmem_2000: ashmem " + ashmem);

            let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_2000: run mapReadAndWriteAshmem result is " + resultMapRAndW);
            expect(resultMapRAndW == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3]);
            let result = ashmem.writeToAshmem(bytes, bytes.length, 1);

            console.log("SUB_Softbus_IPC_Ashmem_2000: run writeToAshmem success, result is " + result);
            expect(result == true).assertTrue()

            let result2 = data.writeAshmem(ashmem)
            console.log("SUB_Softbus_IPC_Ashmem_2000: run writeAshmem success, result is " + result2);
            expect(result2 == true).assertTrue();

            let retReadAshmem = data.readAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_2000: run readAshmem is " + retReadAshmem);

            let retBytes = retReadAshmem.readFromAshmem(bytes.length, 1);
            console.log("SUB_Softbus_IPC_Ashmem_2000: run readFromAshmem result is " + retBytes);
            for (let i = 0; i < bytes.length; i++) {
                expect(retBytes[i]).assertEqual(bytes[i])
            }

            ashmem.closeAshmem()
            data.reclaim()
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_2000: error " +error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_2000---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_2100
     * @tc.name    Create a non shared memory object and call writeashmem to write the messageparcel object
      object into the messageparcel object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_2100",0,function(){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_2100---------------------------");
        try{
            let data = rpc.MessageParcel.create()
            let data2 = rpc.MessageParcel.create()
            console.log("SUB_Softbus_IPC_Ashmem_2100: create MessageParcel object success");

            var flag = false;
            let result = data.writeAshmem(data2)
            console.log("SUB_Softbus_IPC_Ashmem_2100: run writeAshmem success, result is " + result);

            flag = true;
            data.reclaim()
            data2.reclaim()
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_2100: error " + error);
            expect(flag == false).assertTrue();
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_2100---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_Ashmem_2200
     * @tc.name    Test messageparcel to pass ashmem object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_Ashmem_2200",0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_Ashmem_2200---------------------------");
        try{
            let ashmem = rpc.Ashmem.createAshmem("JsAshmemTest", 4096);
            let data = rpc.MessageParcel.create()
            var reply = rpc.MessageParcel.create()
            let option = new rpc.MessageOption()
            console.log("SUB_Softbus_IPC_Ashmem_2200: ashmem " + ashmem);

            let resultMapRAndW = ashmem.mapReadAndWriteAshmem();
            console.log("SUB_Softbus_IPC_Ashmem_2200: run mapReadAndWriteAshmem result is " + resultMapRAndW);
            expect(resultMapRAndW == true).assertTrue();

            let bytes = new Int8Array([1, 2, 3]);
            let result = ashmem.writeToAshmem(bytes, bytes.length, 0);
            console.log("SUB_Softbus_IPC_Ashmem_2200: run writeToAshmem success, result is " + result);

            let resultMessage = data.writeAshmem(ashmem);
            console.log("SUB_Softbus_IPC_Ashmem_2200: run writeAshmem success, resultMessage is " + resultMessage);

            ashmem.unmapAshmem();
            ashmem.closeAshmem();
            await gIRemoteObject.sendRequest(CODE_WRITEINT8_ASHMEM, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_Ashmem_2200: run sendRequest success, result is " + result);
                expect(result.errCode == 0).assertTrue();
                var replyAshmem = result.reply.readAshmem();
                var replyByte = replyAshmem.readFromAshmem(bytes.length, 0);
                console.log("SUB_Softbus_IPC_Ashmem_2200: run readByteArray is success, result is "
                + shortArryDataReply);
                for (let i = 0; i < replyByte.length; i++) {
                    expect(replyByte[i]).assertEqual(bytes[i])
                }
            });
            data.reclaim();
            reply.reclaim();
            done();
        }catch(error){
            console.log("SUB_Softbus_IPC_Ashmem_2200: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_Ashmem_2200---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_0100
     * @tc.name    Call sendrequestresult interface to send data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_0100",0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_0100---------------------------");
        try{
            let sequenceable = new MySequenceable(1, "aaa");
            let data = rpc.MessageParcel.create();
            let reply = rpc.MessageParcel.create();
            let option = new rpc.MessageOption();
            let result = data.writeSequenceable(sequenceable);
            console.log("SUB_Softbus_IPC_IRemoteObject_0100: run writeSequenceable success, result is " + result);

            await gIRemoteObject.sendRequest(CODE_WRITESEQUENCEABLE, data, reply, option).then((SendRequestResult) => {
                console.log("SUB_Softbus_IPC_IRemoteObject_0100: run sendRequest success, result is " + result);
                expect(SendRequestResult.errCode == 0).assertTrue();
                let ret = new MySequenceable(0, "");
                var shortArryDataReply = SendRequestResult.reply.readSequenceable(ret);
                console.log("SUB_Softbus_IPC_IRemoteObject_0100: run readByteArray is success, result is "
                + shortArryDataReply);
                expect(shortArryDataReply == true).assertTrue()
                expect(ret.num).assertEqual(1)
                expect(ret.str).assertEqual("aaa")
            });

            data.reclaim();
            reply.reclaim();
            done();
        }catch(error){
            console.log("SUB_Softbus_IPC_IRemoteObject_0100: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_0100---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_0200
     * @tc.name    Test that messageparcel passes through the same process, and the client
     *             receives the reply message in promise
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_0200", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_0200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_IRemoteObject_0200: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            expect(data.writeInterfaceToken("rpcTestAbility")).assertTrue()
            expect(data.writeByte(1)).assertTrue()
            expect(data.writeShort(2)).assertTrue()
            expect(data.writeInt(3)).assertTrue()
            expect(data.writeLong(10000)).assertTrue()
            expect(data.writeFloat(1.2)).assertTrue()
            expect(data.writeDouble(10.2)).assertTrue()
            expect(data.writeBoolean(true)).assertTrue()
            expect(data.writeChar('a')).assertTrue()
            expect(data.writeString("HelloWorld")).assertTrue()
            expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue()

            const CODE_IREMOTEOBJECT_0200 = 21;
            await gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option).then((result) => {
                console.info("sendRequest done, error code: " + result.errCode)
                expect(result.errCode).assertEqual(0)
                expect(reply.readByte()).assertEqual(1)
                expect(reply.readShort()).assertEqual(2)
                expect(reply.readInt()).assertEqual(3)
                expect(reply.readLong()).assertEqual(10000)
                expect(reply.readFloat()).assertEqual(1.2)
                expect(reply.readDouble()).assertEqual(10.2)
                expect(reply.readBoolean()).assertTrue()
                expect(reply.readChar()).assertEqual('a')
                expect(reply.readString()).assertEqual("HelloWorld")
                let s = new MySequenceable(0, '')
                expect(reply.readSequenceable(s)).assertTrue()
                expect(s.num).assertEqual(1)
                expect(s.str).assertEqual("aaa")
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_IRemoteObject_0200:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_0200---------------------------");
        done();
    });

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_0300
     * @tc.name    Test that messageparcel passes through the same process, and the client
     *             receives the reply message in the callback function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_0300", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_0300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_IRemoteObject_0300: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            expect(data.writeInterfaceToken("rpcTestAbility")).assertTrue()
            expect(data.writeByte(1)).assertTrue()
            expect(data.writeShort(2)).assertTrue()
            expect(data.writeInt(3)).assertTrue()
            expect(data.writeLong(10000)).assertTrue()
            expect(data.writeFloat(1.2)).assertTrue()
            expect(data.writeDouble(10.2)).assertTrue()
            expect(data.writeBoolean(true)).assertTrue()
            expect(data.writeChar('a')).assertTrue()
            expect(data.writeString("HelloWorld")).assertTrue()
            expect(data.writeSequenceable(new MySequenceable(1, "aaa"))).assertTrue()

            const CODE_IREMOTEOBJECT_0200 = 21;
            await gIRemoteObject.sendRequest(CODE_ALL_TYPE, data, reply, option, (err, result) => {
                console.info("sendRequest done, error code: " + result.errCode)
                expect(result.errCode).assertEqual(0)
                expect(reply.readByte()).assertEqual(1)
                expect(reply.readShort()).assertEqual(2)
                expect(reply.readInt()).assertEqual(3)
                expect(reply.readLong()).assertEqual(10000)
                expect(reply.readFloat()).assertEqual(1.2)
                expect(reply.readDouble()).assertEqual(10.2)
                expect(reply.readBoolean()).assertTrue()
                expect(reply.readChar()).assertEqual('a')
                expect(reply.readString()).assertEqual("HelloWorld")
                let s = new MySequenceable(0, '')
                expect(result.reply.readSequenceable(s)).assertTrue()
                expect(s.num).assertEqual(1)
                expect(s.str).assertEqual("aaa")
            });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_IRemoteObject_0300:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_0300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_0400
     * @tc.name    Iremoteobject, register death notification verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_0400", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_0400---------------------------");
        try{
            let recipient = new MyDeathRecipient(gIRemoteObject, null)
            var resultAdd1 = gIRemoteObject.addDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_IRemoteObject_0400:run addDeathRecipient first result is " + resultAdd1);
            expect(resultAdd1 == true).assertTrue();

            var resultAdd2 = gIRemoteObject.addDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_IRemoteObject_0400:run addDeathRecipient second result is " + resultAdd2);
            expect(resultAdd2 == true).assertTrue();

            var resultRemove1 = gIRemoteObject.removeDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_IRemoteObject_0400:run removeDeathRecipient1 result is " + resultRemove1);
            expect(resultRemove1 == true).assertTrue();

            var resultRemove2 = gIRemoteObject.removeDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_IRemoteObject_0400:run  removeDeathRecipient2 result is " + resultRemove2);
            expect(resultRemove2 == true).assertTrue();

            var resultRemove3 = gIRemoteObject.removeDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_IRemoteObject_0400:run  removeDeathRecipient3 result is " + resultRemove3);
            expect(resultRemove3 == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_IRemoteObject_0400:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_0400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_0500
     * @tc.name    Do not get the server agent, do not create a remoteobject instance, and directly getcallingpid,
     *             getcallingpid, getcallingdeviceid, getlocaldeviceid
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_0500", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_0500---------------------------");
        try{
            let callingPid = rpc.IPCSkeleton.getCallingPid()
            console.log("SUB_Softbus_IPC_IRemoteObject_0500: run getCallingPid success, callingPid is " + callingPid);

            let callingUid = rpc.IPCSkeleton.getCallingUid()
            console.log("SUB_Softbus_IPC_IRemoteObject_0500: run getCallingPid success, callingPid is " + callingUid);

            let callingDeviceID = rpc.IPCSkeleton.getCallingDeviceID()
            console.log("SUB_Softbus_IPC_IRemoteObject_0500: run getCallingDeviceID success, callingDeviceID is "
                         + callingDeviceID);
            expect(callingDeviceID == "").assertTrue();

            let localDeviceID = rpc.IPCSkeleton.getLocalDeviceID()
            console.log("SUB_Softbus_IPC_IRemoteObject_0500: run getLocalDeviceID success, localDeviceID is "
            + localDeviceID);
            expect(localDeviceID == "").assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_IRemoteObject_0500:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_0500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_0600
     * @tc.name    Querylocalinterface searches for objects based on descriptors
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_0600", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_0600---------------------------");
        try{
            let object = new TestAbilityStub("Test1");
            console.log("SUB_Softbus_IPC_IRemoteObject_0600: run TestAbilityStub success");

            let result = object.isObjectDead()
            console.log("SUB_Softbus_IPC_IRemoteObject_0600: run isObjectDead success, result is " + result);
            expect(result == false).assertTrue()

            let callingPid = object.getCallingPid()
            console.log("SUB_Softbus_IPC_IRemoteObject_0600: run getCallingPid success, callingPid is " + callingPid);

            let callingUid = object.getCallingUid()
            console.log("SUB_Softbus_IPC_IRemoteObject_0600: run getCallingPid success, callingPid is " + callingUid);

            object.attachLocalInterface(object, "Test1")
            console.log("SUB_Softbus_IPC_IRemoteObject_0600: run attachLocalInterface success");

            let res = object.queryLocalInterface("Test1")
            console.log("SUB_Softbus_IPC_IRemoteObject_0600: run queryLocalInterface success, res2 is " + res);
        } catch (error) {
            console.log("SUB_Softbus_IPC_IRemoteObject_0600:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_0600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_IRemoteObject_0700
     * @tc.name    Getinterfacedescriptor to get the interface description
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IRemoteObject_0700", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_IRemoteObject_0700---------------------------");
        try{
            let object = new TestAbilityStub("Test1223");

            let result = object.isObjectDead()
            console.log("SUB_Softbus_IPC_IRemoteObject_0700: run isObjectDead success, result is " + result);
            expect(result == false).assertTrue()

            let callingPid = object.getCallingPid()
            console.log("SUB_Softbus_IPC_IRemoteObject_0700: run getCallingPid success, callingPid is " + callingPid);

            let callingUid = object.getCallingUid()
            console.log("SUB_Softbus_IPC_IRemoteObject_0700: run getCallingPid success, callingPid is " + callingUid);

            object.attachLocalInterface(object, "test1")
            console.log("SUB_Softbus_IPC_IRemoteObject_0700: run attachLocalInterface success");

            let result2 = object.getInterfaceDescriptor();
            console.log("SUB_Softbus_IPC_IRemoteObject_0700: run getInterfaceDescriptor success, result2 is "
                         + result2);
            expect(result2 == "test1").assertTrue();

        } catch (error) {
            console.log("SUB_Softbus_IPC_IRemoteObject_0700:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IRemoteObject_0700---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_RemoteProxy_0100
     * @tc.name    Call adddeathrecipient to register the death notification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_RemoteProxy_0100", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_RemoteProxy_0100---------------------------");
        try{
            let recipient = new MyDeathRecipient(gIRemoteObject, null)
            var resultAdd1 = gIRemoteObject.addDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0100:run addDeathRecipient first result is " + resultAdd1);
            expect(resultAdd1 == true).assertTrue();

            var resultAdd2 = gIRemoteObject.addDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0100:run addDeathRecipient second result is " + resultAdd2);
            expect(resultAdd2 == true).assertTrue();

            var resultRemove1 = gIRemoteObject.removeDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0100:run removeDeathRecipient1 result is " + resultRemove1);
            expect(resultRemove1 == true).assertTrue();

            var resultRemove2 = gIRemoteObject.removeDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0100:run  removeDeathRecipient2 result is " + resultRemove2);
            expect(resultRemove2 == true).assertTrue();

            var resultRemove3 = gIRemoteObject.removeDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0100:run  removeDeathRecipient3 result is " + resultRemove3);
            expect(resultRemove3 == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_RemoteProxy_0100:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_RemoteProxy_0100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_RemoteProxy_0200
     * @tc.name    Call isobjectdead to check whether the object is dead
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_RemoteProxy_0200", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_RemoteProxy_0200---------------------------");
        try{
            let recipient = new MyDeathRecipient(gIRemoteObject, null)
            var resultAdd1 = gIRemoteObject.addDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0200:run addDeathRecipient first result is " + resultAdd1);
            expect(resultAdd1 == true).assertTrue();

            var isDead1 = gIRemoteObject.isObjectDead();
            console.log("SUB_Softbus_IPC_RemoteProxy_0200: run isObjectDead result is " + isDead1);
            expect(isDead1 == true).assertTrue();

            var resultAdd2 = gIRemoteObject.addDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0200:run addDeathRecipient second result is " + resultAdd2);
            expect(resultAdd2 == true).assertTrue();

            var resultRemove1 = gIRemoteObject.removeDeathRecipient(recipient, 0)
            console.log("SUB_Softbus_IPC_RemoteProxy_0200:run removeDeathRecipient1 result is " + resultRemove1);
            expect(resultRemove1 == true).assertTrue();

            var isDead2 = gIRemoteObject.isObjectDead();
            console.log("SUB_Softbus_IPC_RemoteProxy_0200: run isObjectDead2 result is " + isDead2);
            expect(isDead1 == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_RemoteProxy_0200:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_RemoteProxy_0200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_RemoteProxy_0300
     * @tc.name    Getinterfacedescriptor to get the object interface description
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_RemoteProxy_0300", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_RemoteProxy_0300---------------------------");
        try{
            let object = new TestAbilityStub("Test0300");

            let result = object.getInterfaceDescriptor()
            console.log("SUB_Softbus_IPC_RemoteProxy_0300: run getInterfaceDescriptor success, result is " + result);
            expect(result == "Test0300").assertTrue();

        } catch (error) {
            console.log("SUB_Softbus_IPC_RemoteProxy_0300:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_RemoteProxy_0300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_RemoteProxy_0400
     * @tc.name    Querylocalinterface searches for objects based on descriptors
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_RemoteProxy_0400", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_RemoteProxy_0400---------------------------");
        try{
            let object = new TestAbilityStub("Test0400");

            let result = object.isObjectDead()
            console.log("SUB_Softbus_IPC_RemoteProxy_0400: run getInterfaceDescriptor success, result is " + result);
            expect(result == false).assertTrue()

            let res = object.attachLocalInterface(object, "Test2")
            console.log("SUB_Softbus_IPC_RemoteProxy_0400: run attachLocalInterface success, res is " + res);

            let res2 = object.queryLocalInterface('Test2');
            console.log("SUB_Softbus_IPC_RemoteProxy_0400: run queryLocalInterface success, res2 is " + res2);

            let resultDescrip = object.getInterfaceDescriptor()
            console.log("SUB_Softbus_IPC_RemoteProxy_0400: run getInterfaceDescriptor success resultDescrip is "
                         + resultDescrip);
            expect(resultDescrip == "Test2").assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_RemoteProxy_0400:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_RemoteProxy_0400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_RemoteProxy_0500
     * @tc.name    Transaction constant validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_RemoteProxy_0500", 0, async function(done){
        console.log("SUB_Softbus_IPC_RemoteProxy_0500 is starting-------------")
        try {
            let data = rpc.MessageParcel.create()
            let reply = rpc.MessageParcel.create()
            let writeInt = data.writeInt(1)
            console.log("SUB_Softbus_IPC_RemoteProxy_0500: writeInt result is" + writeInt);
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_RemoteProxy_0500 : gIRemoteObject is undefined");
            }
            const CODE_TRANSACTION = 22;
            await gIRemoteObject.sendRequest(CODE_TRANSACTION, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_RemoteProxy_0500: run success, result is " + result);
                let a = result.reply.RemoteProxy.PING_TRANSACTION;
                console.log("SUB_Softbus_IPC_RemoteProxy_0500:The result a is" + a);
                let b = result.reply.RemoteProxy.DUMP_TRANSACTION;
                console.log("SUB_Softbus_IPC_RemoteProxy_0500:The result b is" + b);
                let c = result.reply.RemoteProxy.INTERFACE_TRANSACTION;
                console.log("SUB_Softbus_IPC_RemoteProxy_0500:The result c is" + c);
                let d = result.reply.RemoteProxy.MIN_TRANSACTION_ID;
                console.log("SUB_Softbus_IPC_RemoteProxy_0500:The result d is" + d);
                let e = result.reply.RemoteProxy.MAX_TRANSACTION_ID;
                console.log("SUB_Softbus_IPC_RemoteProxy_0500:The result e is" + e);
            });
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_RemoteProxy_0500 error is" + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_RemoteProxy_0500---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_IPCSkeleton_1000
     * @tc.name    Create an empty object and verify the function of the flushcommands interface
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Softbus_IPC_IPCSkeleton_1000', 0, async function() {
        console.log("---------------------start SUB_Softbus_IPC_IPCSkeleton_1000---------------------------");
        try {
            console.info("SUB_Softbus_IPC_IPCSkeleton_1000")
            let remoteObject = {};
            let ret = rpc.IPCSkeleton.flushCommands(remoteObject);
            console.log("RpcServer: flushCommands result: " + ret);
        }
        catch (error) {
            console.log("SUB_Softbus_IPC_IPCSkeleton_1000 error is :" + error)
        }
        console.log("---------------------end SUB_Softbus_IPC_IPCSkeleton_1000---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_IPCSkeleton_2000
     * @tc.name    Do not get the server agent, do not create a remoteobject instance, and directly getcallingpid,
     *             getcallingpid, getcallingdeviceid, getlocaldeviceid
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Softbus_IPC_IPCSkeleton_2000', 0, async function() {
        console.log("---------------------start SUB_Softbus_IPC_IPCSkeleton_2000---------------------------");
        try{
            let getCallingPid = rpc.IPCSkeleton.getCallingPid();
            console.log("SUB_Softbus_IPC_IPCSkeleton_2000: run  getCallingPid result is :" + getCallingPid);
            let getCallingUid = rpc.IPCSkeleton.getCallingUid();
            console.log("SUB_Softbus_IPC_IPCSkeleton_2000: run getCallingUid result is :" + getCallingUid);
            let getLocalDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
            console.log("SUB_Softbus_IPC_IPCSkeleton_2000: run getLocalDeviceID result is :" + getLocalDeviceID);
            let getCallingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
            console.log("SUB_Softbus_IPC_IPCSkeleton_2000: run getCallingDeviceID result is :" + getCallingDeviceID);
        } catch (error){
            console.log("SUB_Softbus_IPC_IPCSkeleton_2000: error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IPCSkeleton_2000---------------------------");
    })

    /*
     * @tc.number  SUB_Softbus_IPC_IPCSkeleton_3000
     * @tc.name    Basic method of testing ipcskeleton
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_IPCSkeleton_3000", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_IPCSkeleton_3000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var getContextObject = rpc.IPCSkeleton.getContextObject();
            var result = getContextObject.getInterfaceDescriptor();
            expect(result == "").assertTrue();
            var getCallingPid = rpc.IPCSkeleton.getCallingPid();
            var getCallingUid = rpc.IPCSkeleton.getCallingUid();
            var getCallingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
            console.log("The result is :" + getCallingDeviceID);
            expect(getCallingDeviceID == "").assertTrue();
            var getLocalDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
            console.log("The result is :" + getLocalDeviceID);
            expect(getLocalDeviceID == "").assertTrue();
            var isLocalCalling = rpc.IPCSkeleton.isLocalCalling();
            console.log("The result is :" + isLocalCalling);
            var id = rpc.IPCSkeleton.resetCallingIdentity();
            console.log("The result is :" + id);
            expect(id == "").assertTrue();
            var setCallingIdentity = rpc.IPCSkeleton.setCallingIdentity(id);
            console.log("The result is :" + setCallingIdentity);
            expect(setCallingIdentity == true).assertTrue();
            var flushCommands = rpc.IPCSkeleton.flushCommands(gIRemoteObject);
            console.log("The result is :" + flushCommands);
            await gIRemoteObject.sendRequest(CODE_IPCSKELETON, data, reply, option).then((result) => {
                expect(result.errCode).assertEqual(0);
                result.reply.readException();
                expect(result.reply.readInt()).assertEqual(callingPid);
                expect(result.reply.readInt()).assertEqual(callingUid);
                expect(result.reply.readString()).assertEqual("");
                expect(result.reply.readString()).assertEqual("");
                expect(result.reply.readBoolean()).assertTrue();
                expect(result.reply.readInt()).assertEqual(callingPid);
                expect(result.reply.readInt()).assertEqual(callingUid);
                expect(result.reply.readInt()).assertEqual(callingPid);
                expect(result.reply.readInt()).assertEqual(callingUid);
                expect(result.reply.readInt()).assertEqual(101);
            });
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_IPCSkeleton_3000:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_IPCSkeleton_3000---------------------------");
    });

    console.log("-----------------------SUB_Softbus_IPC_MessageParce_Test is end-----------------------");
});
