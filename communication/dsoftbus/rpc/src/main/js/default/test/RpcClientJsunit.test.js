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
                console.log('RpcClient: onConnect called, instance of proxy: ' 
                             + (remoteProxy instanceof rpc.RemoteProxy))
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
                console.log("SUB_Softbus_IPC_MessageParcel_3600: sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

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

                var newArr = new Int8Array(5)
                result.reply.readByteArray(newArr);
                console.log("SUB_Softbus_IPC_MessageParcel_3700: run readByteArray is success, result is "
                + newArr);
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
                console.log("SUB_Softbus_IPC_MessageParcel_4000: sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var shortArryDataReply = result.reply.readIntArray();
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
                console.log("SUB_Softbus_IPC_MessageParcel_4100: sendRequest success, result is " + result.errCode);
                expect(result.errCode == 0).assertTrue();

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
     * @tc.name    WriteShort interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_4900", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_4900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_4900: create object successfully.");

            var short2 = 32767;
            var writeShor2 = data.writeShort(short2);
            console.log("SUB_Softbus_IPC_MessageParcel_4900: run writeShort success, writeShor2 is " +writeShor2);
            expect(writeShor2 == true).assertTrue();

            var readShort = data.readShort();
            console.log("SUB_Softbus_IPC_MessageParcel_4900: run readFloatArray is success, readShort is "
                + readShort);
            expect(readShort == short2).assertTrue();

            data.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_4900: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_4900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5000
     * @tc.name    WriteShort interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5000", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5000: create object successfully.");

            var short = -32769;
            var writeShor = data.writeShort(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5000: run writeShort success, writeShor is " + writeShor);
            expect(writeShor == true).assertTrue();

            var result1 = data.readShort();
            console.log("SUB_Softbus_IPC_MessageParcel_5000: readShort1 result is " + result1);
            expect(result1 == 32767).assertTrue();

            var short2 = 32768;
            var writeShor2 = data.writeShort(short2);
            console.log("SUB_Softbus_IPC_MessageParcel_5000: run writeShort success, writeShor2 is " + writeShor2);
            expect(writeShor2 == true).assertTrue();

            var result2 = data.readShort();
            console.log("SUB_Softbus_IPC_MessageParcel_5000: readShort2 result is " + result2);
            expect(result1 == -32768).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5000: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5100
     * @tc.name    Call writelong interface to write long integer data to messageparcel instance
     *             and call readlong to read data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5100", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5100: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();

            var short = 10000;
            var writelong = data.writeLong(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5100: run writeLong success, writelong is " + writelong);
            expect(writelong == true).assertTrue();

            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5100: gIRemoteObject undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_LONG, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_5100: run sendRequest success, result is " 
                             + result.errCode);
                expect(result.errCode == 0).assertTrue();

                var readlong = result.reply.readLong();
                console.log("SUB_Softbus_IPC_MessageParcel_5100: run readLong is success, readlong is " + readlong);
                expect(readlong == short).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5100: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5200
     * @tc.name    Writelong interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5200", 0, async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5200: create object successfully.");

            var short = 2147483647;
            var writelong = data.writeLong(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5200: run writeLong success, writelong is " + writelong);
            expect(writelong == true).assertTrue();

            var readlong = data.readLong();
            console.log("SUB_Softbus_IPC_MessageParcel_5200: run readLong is success, readlong is " + readlong);
            expect(readlong == short).assertTrue();

            data.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5200: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5300
     * @tc.name    Writelong interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5300", 0, async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5300---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5300: create object successfully.");

            var short = 2147483648;
            var writelong = data.writeLong(short);
            console.log("SUB_Softbus_IPC_MessageParcel_5300: run writeLong success, writelong is " +writelong);
            expect(writelong == true).assertTrue();

            var result = data.readLong();
            console.log("SUB_Softbus_IPC_MessageParcel_5300 readLong result is " + result);
            expect(result == 2147483648).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5300: error " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5400
     * @tc.name    Call the parallel interface to read and write data to the double instance
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5400", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5400: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 10.2;
            var result = data.writeDouble(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5400:run writeDouble success, result is " + result);
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5400: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_DOUBLE, data, reply, option).then((result) => {
                    console.log("SUB_Softbus_IPC_MessageParcel_5400: run sendRequest success, result is "
                                 + result.errCode);
                    var replyReadResult = reply.readDouble();
                    console.log("SUB_Softbus_IPC_MessageParcel_5400: run replyReadResult is success," +
                    "replyReadResult is " + replyReadResult);
                    expect(replyReadResult == token).assertTrue();
                });
            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5400:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5500
     * @tc.name    Writedouble interface, boundary value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5500", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5500---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5500: create object successfully.");
            var token = 1.79E+308;
            var result = data.writeDouble(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5500:run writeDouble success, result is " + result);
            expect(result == true).assertTrue();
            var readresult = data.readDouble();
            console.log("SUB_Softbus_IPC_MessageParcel_5500:run readDouble success, result is " + readresult);
            expect(readresult == token).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5500:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5600
     * @tc.name    Writedouble interface, illegal value validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5600", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5600---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5600: create object successfully.");

            var flag = false;
            var token = "1.79E+465312156";
            var result = data.writeDouble(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5600:run writeDouble success, result is " + result);

            flag = true;
            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5600:error = " + error);
            expect(flag == false).assertTrue();
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5600---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5700
     * @tc.name    Call the writeboolean interface to write the data to the messageparcel instance,
     *             and call readboolean to read the data
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
            var token = true;
            var result = data.writeBoolean(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5700:run writeBoolean success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5700: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BOOLEAN, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_5700: run sendRequest success, result is " 
                             + result.errCode);
                var replyReadResult = result.reply.readBoolean();
                console.log("SUB_Softbus_IPC_MessageParcel_5700: run readBoolean is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
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
     * @tc.name    Writeboolean interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5800", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5800: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 9;
            var result = data.writeBoolean(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5800:run writeBoolean success, result is " + result);
            expect(result == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5800:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_5900
     * @tc.name    Call the writechar interface to write the data to the messageparcel instance,
     *             and call readchar to read the data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_5900", 0,async function(done){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_5900---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_5900: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 'a';
            var result = data.writeChar(token);
            console.log("SUB_Softbus_IPC_MessageParcel_5900:run writeChar success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_5900: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_CHAR, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_5900: sendRequest success, result is " + result.errCode);
                var replyReadResult = result.reply.readChar();
                console.log("SUB_Softbus_IPC_MessageParcel_5900: run readChar is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
            });

            data.reclaim();
            reply.reclaim();
            done();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_5900:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_5900---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6000
     * @tc.name    Writechar interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6000", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6000---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6000: create object successfully.");
            var reply = rpc.MessageParcel.create();
            var option = new rpc.MessageOption();
            var token = 'ades';
            var result = data.writeChar(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6000:run writeChar success, result is " + result);
            expect(result == false).assertTrue()
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6000:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6000---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6100
     * @tc.name    Call the writestring interface to write the data to the messageparcel instance,
     *             and call readstring() to read the data
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
            var token = 'weqea';
            var result = data.writeString(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6100:run writeString success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6100: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_STRING, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6100: sendRequest success, result is " + result.errCode);
                var replyReadResult = result.reply.readString();
                console.log("SUB_Softbus_IPC_MessageParcel_6100: run readString is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
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
     * @tc.name    Writestring interface, illegal value verification
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
            var token = 123;
            var result = data.writeString(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6200:run writeString success, result is " + result);
            expect(result == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6200:error = " + error);
        }
        sleep(2000)
        data.reclaim();
        reply.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6300
     * @tc.name    Call the writebyte interface to write data to the messageparcel instance,
     *             and call readbyte to read data
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
            var token = 2;
            var result = data.writeByte(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6300:run writeByte success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6300: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6300: sendRequest success, result is " + result.errCode);
                var replyReadResult = result.reply.readByte();
                console.log("SUB_Softbus_IPC_MessageParcel_6300: run readByte is success," +
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
     * @tc.name    Writebyte interface, boundary value verification
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
            var token = 127;
            var result = data.writeByte(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6400:run writeByte success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6400: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_BYTE, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6400: sendRequest success, result is " + result.errCode);
                var replyReadResult = reply.readByte();
                console.log("SUB_Softbus_IPC_MessageParcel_6400: run readByte is success," +
                "result is " + replyReadResult);
                expect(replyReadResult == token).assertTrue();
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
     * @tc.name    Writebyte interface, illegal value verification
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
            var token = 128;
            var result = data.writeByte(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6500:run writeByte success, result is " + result);
            expect(result == true).assertTrue();

            var token2 = -129;
            var result2 = data.writeByte(token2);
            console.log("SUB_Softbus_IPC_MessageParcel_6500:run writeByte success, result is " + result2);
            expect(result2 == true).assertTrue();
            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6500:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6500---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6600
     * @tc.name    Call the writeint interface to write the data to the messageparcel instance,
     *             and call readint to read the data
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
            var token = 2;
            var result = data.writeInt(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6600:run writeInt success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6600: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6600: sendRequest success, result is " + result.errCode);
                var replyReadResult = result.reply.readInt();
                console.log("SUB_Softbus_IPC_MessageParcel_6600: run readInt is success," +
                "result is " + replyReadResult);
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
     * @tc.name    Writeint interface, boundary value verification
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
            var token = 2147483647;
            var result = data.writeInt(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6700:run writeInt success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6700: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_INT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6700: sendRequest success, result is " + result.errCode);
                var replyReadResult = result.reply.readInt();
                console.log("SUB_Softbus_IPC_MessageParcel_6700: run readInt is success," +
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
     * @tc.name    Writeint interface, illegal value verification
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_6800", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_6800---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_6800: create object successfully.");

            var token = 2147483648;
            var result = data.writeInt(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6800:run writeInt success, result is " + result);
            expect(result == false).assertTrue();

            var token2 = -2147483649;
            var result2 = data.writeInt(token2);
            console.log("SUB_Softbus_IPC_MessageParcel_6800:run writeInt success, result is " + result2);
            expect(result2 == false).assertTrue();

            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_6800:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_6800---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_6900
     * @tc.name    Call the writefloat interface to write data to the messageparcel instance,
     *             and call readfloat to read data
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
            var token = 2.2;
            var result = data.writeFloat(token);
            console.log("SUB_Softbus_IPC_MessageParcel_6900:run writeDouble success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_6900: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_6900: sendRequest success, result is " + result.errCode);
                var replyReadResult = result.reply.readFloat();
                console.log("SUB_Softbus_IPC_MessageParcel_6900: run readFloat is success," +
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
     * @tc.name    Writefloat interface, boundary value verification
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
            var token = 3.4E+38;
            var result = data.writeFloat(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7000:run writeFloat success, result is " + result);
            expect(result == true).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7000: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_FLOAT, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7000: sendRequest success, result is " + result.errCode);
                var newReadResult = result.reply.readFloat();
                console.log("SUB_Softbus_IPC_MessageParcel_7000: readFloat result is " + newReadResult);
                expect(newReadResult == token).assertTrue();
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
     * @tc.name    Writefloat interface, illegal value validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7100", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7100---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7100: create object successfully.");

            var token = 'a';
            var result = data.writeFloat(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7100:run writeFloat success, result is " + result);
            expect(result == false).assertTrue();
            data.reclaim();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7100:error = " + error);
        }
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7100---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7200
     * @tc.name    Test messageparcel to deliver rawdata data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7200", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7200---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7200: create object successfully.");

            var Capacity = data.getRawDataCapacity()
            console.log("SUB_Softbus_IPC_MessageParcel_7200:run Capacity success, Capacity is " + Capacity);

            var rawdata = new Int8Array([1, 2, 3])
            var result = data.writeRawData(rawdata, rawdata.length);
            console.log("SUB_Softbus_IPC_MessageParcel_7200:run writeRawData success, result is " + result);
            expect(result == true).assertTrue();
            var newReadResult = data.readRawData(rawdata.length)
            console.log("SUB_Softbus_IPC_MessageParcel_7200:run readRawData success, result is " + newReadResult);
            expect(newReadResult[0] == rawdata[0]).assertTrue();
            expect(newReadResult[1] == rawdata[1]).assertTrue();
            expect(newReadResult[2] == rawdata[2]).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7200:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7200---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7300
     * @tc.name    Illegal value passed in from writerawdata interface
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
            var Capacity = data.getRawDataCapacity()
            console.log("SUB_Softbus_IPC_MessageParcel_7300:run Capacity success, result is " + Capacity);
            var token = new Int8Array([2,1,4,3,129]) ;
            var result = data.writeRawData(token, token.length);
            console.log("SUB_Softbus_IPC_MessageParcel_7300:run writeRawData success, result is " + result);
            expect(result == false).assertTrue();
            if (gIRemoteObject == undefined)
            {
                console.log("SUB_Softbus_IPC_MessageParcel_7300: gIRemoteObject is undefined");
            }
            await gIRemoteObject.sendRequest(CODE_WRITE_RAWDATA, data, reply, option).then((result) => {
                console.log("SUB_Softbus_IPC_MessageParcel_7300: sendRequest success, result is " +  result.errCode);
                var newReadResult = result.reply.readRawData(token.length);
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
            console.log("SUB_Softbus_IPC_MessageParcel_7300:error = " + error);
        }

        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7300---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7400
     * @tc.name    Call the writeremoteobject interface to serialize the remote object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7400", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7400---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7400: create object successfully.");

            let testRemoteObject = new TestRemoteObject("testObject");
            var result = data.writeRemoteObject(testRemoteObject);
            console.log("SUB_Softbus_IPC_MessageParcel_7400: result is " + result);
            expect(result == true).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7400:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7400---------------------------");
    });

    /*
     * @tc.number  SUB_Softbus_IPC_MessageParcel_7500
     * @tc.name    Call the writeremoteobject interface to serialize the remote object and pass in the empty object
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("SUB_Softbus_IPC_MessageParcel_7500", 0,async function(){
        console.log("---------------------start SUB_Softbus_IPC_MessageParcel_7500---------------------------");
        try{
            var data = rpc.MessageParcel.create();
            console.log("SUB_Softbus_IPC_MessageParcel_7500: create object successfully.");

            var token = {}
            var result = data.writeRemoteObject(token);
            console.log("SUB_Softbus_IPC_MessageParcel_7500: result is " + result);
            expect(result == false).assertTrue();
        } catch (error) {
            console.log("SUB_Softbus_IPC_MessageParcel_7500:error = " + error);
        }
        data.reclaim();
        console.log("---------------------end SUB_Softbus_IPC_MessageParcel_7400---------------------------");
    });

    console.log("-----------------------SUB_Softbus_IPC_MessageParce_Test is end-----------------------");
});
