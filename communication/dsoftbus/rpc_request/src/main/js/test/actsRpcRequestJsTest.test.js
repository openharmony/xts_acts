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

import rpc from '@ohos.rpc';
import {describe, expect, beforeAll, it} from '@ohos/hypium';
var gIRemoteObject = null;
export default function actsRpcRequestJsTest() {
    describe('actsRpcRequestJsTest', function(){
        console.info("-----------------------SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_Test is starting-----------------------");
        beforeAll(async function () {
            console.info('beforeAll called');
            gIRemoteObject = new Stub("rpcTestAbility");
            return gIRemoteObject;
        });

        beforeEach(async function (){
            console.info('beforeEach called');
        });

        afterEach(async function (){
            console.info('afterEach called');
        });

        afterAll(async function (){
            console.info('afterAll called');
        });

        const CODE_ASYNC_ONREMOTEMESSAGE = 1;
        const CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE = 2;
        
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

        class Stub extends rpc.RemoteObject {
            constructor(descriptor) {
                super(descriptor);
            }
            onRemoteRequest(code, data, reply, option) {
                try{
                    console.info("onRemoteRequest: " + code);
                    if (code === 2){
                        console.info("case 1 start");
                        let tmp1 = data.readString();
                        let result =  reply.writeString("onRemoteRequest invoking");
                        return true;
                    } else {
                        console.error("onRemoteRequest default case " + code);
                        return super.onRemoteRequest(code, data, reply, option);
                    }
                } catch (error) {
                    console.info("onRemoteRequest error: " + error);
                }
                return false
            }
            async onRemoteMessageRequest(code, data, reply, option) {
                try{
                    if (code === 1){
                        console.info("case 1 start");
                        let tmp1 = data.readString();
                        reply.writeString("async onRemoteMessageRequest invoking");
                    } else if (code === 2){
                        console.info("case 2 start");
                        let tmp1 = data.readString();
                        reply.writeString("async onRemoteMessageRequest invoking");
                    }else {
                        console.error("async onRemoteMessageRequest default case " + code);
                        return super.onRemoteMessageRequest(code, data, reply, option);
                    }
                    await new Promise((resolve)=>{
                        console.info("new promise")
                        setTimeout(resolve,100);
                    })
                    return true;
                } catch (error) {
                    console.info("async onRemoteMessageRequest: " + error);
                }
                return false
            }
        }        

        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00100
        * @tc.name    Verifying the processing of the MessageSequence Asynchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */       
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00100", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00100--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00100--------------------");
        });       

        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00200
        * @tc.name    Verifying the processing of the MessageSequence synchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00200", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00200--------------------");
            try{
                var data = new rpc.MessageSequence();
                var reply = new rpc.MessageSequence();
                var option = new rpc.MessageOption(1);
                let token = "async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then(function(result){
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00200--------------------");
        });      

        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00300
        * @tc.name    To test the processing priority of the MessageSequence interface for Asynchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00300", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00300--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00300--------------------");
        });

        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00400
        * @tc.name    To test the processing priority of the MessageSequence interface for synchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00400", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00400--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption(1);
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendMessageRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result!=null).assertTrue();
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error == null).assertTrue();
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00400--------------------");
        });
        
        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00500
        * @tc.name    Verifying the processing of the MessageParcel Asynchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00500", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00500--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = "async onRemoteMessageRequest invoking";
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                if (gIRemoteObject == undefined)
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00500--------------------");
        });

        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00600
        * @tc.name    Verifying the processing of the MessageParcel synchronous callback information of the async_onRemoteMessageRequest interface
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00600", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00600--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption(1);
                let token = 'async onRemoteMessageRequest invoking';
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00600--------------------");
        });  
        
        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00700
        * @tc.name    To test the processing priority of the MessageParcel interface for Asynchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00700", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00700--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption();
                let token = 'onRemoteRequest or async onRemoteMessageRequest invoking';
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    var replyReadResult = result.reply.readString();
                    expect(replyReadResult).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00700--------------------");
        });
        
        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00800
        * @tc.name    To test the processing priority of the MessageParcel interface for synchronously invoking 
        *               onRemoteRequest and async_onRemoteMessageRequest callback information
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00800", 0, async function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00800--------------------");
            try{
                var data = rpc.MessageParcel.create();
                var reply = rpc.MessageParcel.create();
                let option = new rpc.MessageOption(1);
                let token = 'onRemoteRequest or async onRemoteMessageRequest invoking';
                var result = data.writeString(token);
                expect(result == true).assertTrue();
                expect(gIRemoteObject != undefined).assertTrue();
                await gIRemoteObject.sendRequest(CODE_ONREMOTE_ASYNC_ONREMOTEMESSAGE, data, reply, option).then((result) => {
                    expect(result.errCode).assertEqual(0);
                    expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                });
            } catch (error) {
                expect(error).assertEqual(null);
            }finally{
                data.reclaim();
                reply.reclaim();
                done();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00800--------------------");
        });
        
        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00900
        * @tc.name    Invoke async_onRemoteMessageRequest to process information in synchronization mode and call back in AsyncCallback mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00900", 0, function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00900--------------------");
            try{
                function sendMessageRequestCallback(result) {
                    try{
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                    } catch(e) {
                        expect(e == null).assertTrue();
                    }finally{
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                }
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                console.info("start sendMessageRequestCallback");
                gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option, sendMessageRequestCallback);
            } catch (error) {
                expect(error == null).assertTrue();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_00900--------------------");
        });

        /*
        * @tc.number  SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_01000
        * @tc.name    Invoke async_onRemoteMessageRequest to process information in asynchronous mode and call back in AsyncCallback mode
        * @tc.desc    [G-DISTRIBUTED-0212]禁止修改IPC中定义的数据结构和接口，并提供对应完整实现
        * @tc.level   3
        */   
        it("SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_01000", 0, function(done){
            console.info("--------------------start SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_01000--------------------");
            try{
                var data = rpc.MessageSequence.create();
                var reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption(1);
                let token = "onRemoteRequest or async onRemoteMessageRequest invoking";
                data.writeString(token);
                function sendMessageRequestCallback(result) {
                    try{
                        expect(result.errCode).assertEqual(0);
                        expect(result.reply.readString()).assertEqual("async onRemoteMessageRequest invoking");
                    } catch(e) {
                        expect(e == null).assertTrue();
                    }finally{
                        data.reclaim();
                        reply.reclaim();
                        done();
                    }
                }
                console.info("start sendMessageRequestCallback");
                gIRemoteObject.sendMessageRequest(CODE_ASYNC_ONREMOTEMESSAGE, data, reply, option,sendMessageRequestCallback);
            } catch (error) {
                expect(error == null).assertTrue();
            }
            console.info("--------------------end SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_01000--------------------");
        });         
        console.info("-----------------------SUB_Softbus_IPC_Compatibility_onRemoteMessageRequest_Test is end-----------------------");
    });
}
