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

import rpc from "@ohos.rpc"
import fileio from '@ohos.fileio';
import process from '@ohos.process'

export default {
    onStart() {
        console.info('RpcServer: onStart')
    },
    onStop() {
        console.info('RpcServer: onStop')
    },
    onCommand(want, startId) {
        console.info('RpcServer: onCommand, want: ' + JSON.stringify(want) +', startId: ' + startId)
    },
    onConnect(want) {
        console.info('RpcServer: service onConnect called.')
        return new Stub("rpcTestAbility")
    },
    onDisconnect(want) {
        console.info('RpcServer: service onDisConnect called.')
    },
    onReconnect(want) {
        console.info('RpcServer: service onReConnect called.')
    }
}

class MySequenceable {
    num = null
    str = null
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
    constructor(descriptor) {
        super(descriptor);
    }
    onRemoteRequest(code, data, reply, option) {
        try{
            console.info("onRemoteRequest: " + code)
            if (code === 32){
                console.info("case 32 start")
                let tmp1 = data.readString()
                let result =  reply.writeString("onRemoteRequest invoking")
                return true
            } else if (code === 33){
                console.info("case 33 start")
                let tmp1 = data.readString()
                let result =  reply.writeString(tmp1)
                return true
            }else {
                console.error("default case " + code)
                return super.onRemoteRequest(code, data, reply, option)
            }
        } catch (error) {
            console.info("onRemoteRequest: " + error);
        }
        return false
    }
    onRemoteMessageRequest(code, data, reply, option) {
        try{
            console.info("onRemoteMessageRequest: " + code)
            switch(code) {
                case 1:
                {
                    console.info("case 1 start")
                    let tmp1 = data.readByteArray()
                    let result =  reply.writeByteArray(tmp1)
                    return true
                }
                case 2:
                {
                    console.info("case 2 start")
                    let tmp1 = data.readIntArray()
                    let result =  reply.writeIntArray(tmp1)
                    return true
                }
                case 3:
                {
                    console.info("case 3 start")
                    let tmp1 = data.readFloatArray()
                    let result =  reply.writeFloatArray(tmp1)
                    return true
                }
                case 4:
                {
                    console.info("case 4 start")
                    let tmp1 = data.readShort()
                    let result =  reply.writeShort(tmp1)
                    return true
                }
                case 5:
                {
                    console.info("case 5 start")
                    let tmp1 = data.readLong()
                    let result =  reply.writeLong(tmp1)
                    return true
                }
                case 6:
                {
                    console.info("case 6 start")
                    let tmp1 = data.readDouble()
                    let result =  reply.writeDouble(tmp1)
                    return true
                }
                case 7:
                {
                    console.info("case 7 start")
                    let tmp1 = data.readBoolean()
                    let result =  reply.writeBoolean(tmp1)
                    return true
                }
                case 8:
                {
                    console.info("case 8 start")
                    let tmp1 = data.readChar()
                    let result =  reply.writeChar(tmp1)
                    return true
                }
                case 9:
                {
                    console.info("case 9 start")
                    let tmp1 = data.readString()
                    let result =  reply.writeString(tmp1)
                    return true
                }
                case 10:
                {
                    console.info("case 10 start")
                    let tmp1 = data.readByte()
                    let result =  reply.writeByte(tmp1)
                    return true
                }
                case 11:
                {
                    console.info("case 11 start")
                    let tmp1 = data.readInt()
                    let result =  reply.writeInt(tmp1)
                    return true
                }
                case 12:
                {
                    console.info("case 12 start")
                    let tmp1 = data.readFloat()
                    let result =  reply.writeFloat(tmp1)
                    return true
                }
                case 13:
                {
                    console.info("case 13 start")
                    var size = data .readInt();
                    let tmp1 = data.readRawData(size);
                    let size1 = reply.writeInt(size);
                    let result =  reply.writeRawData(tmp1, tmp.length)
                    return true
                }
                case 14:
                {
                    console.info("case 14 start")
                    let listener = data.readRemoteObject();
                    let num = data.readInt()
                    let str = data.readString()
                    let option2 = new rpc.MessageOption()
                    let data2 = rpc.MessageParcel.create()
                    let reply2 = rpc.MessageParcel.create()
                    data2.writeInt(num)
                    data2.writeString(str)
                    listener.sendRequest(1, data2, reply2, option2)
                        .then(function(result) {
                            console.info("14 send request done, error code: " + result.errCode )
                        })
                        .catch(function(e) {
                            console.error("14 send request got exception: " + e)
                        })
                        .finally(() => {
                            data2.reclaim()
                            reply2.reclaim()
                            console.info("case 14 test done")
                        })
                    reply.writeNoException()
                    return true
                }
                case 15:
                {
                    console.info("case 15 start")
                    let s = new MySequenceable(null, null)
                    var tmp1 = data.readParcelable(s)
                    let result =  reply.writeParcelable(s)
                    return true
                }
                case 16:
                {
                    console.info("case 16 start")
                    data.readException()
                    var tmp = data.readInt();
                    reply.writeNoException()
                    var result = reply.writeInt(tmp);
                    return true
                }
                case 17:
                {
                    console.info("case 17 start")
                    var s = [new MySequenceable(null, null), new MySequenceable(null, null),
                        new MySequenceable(null, null)];
                    data.readParcelableArray(s);
                    let result =  reply.writeParcelableArray(s);
                    return true
                }
                case 18:
                {
                    console.info("case 18 start")
                    let listeners = data.readRemoteObjectArray();
                    for (let i = 0; i < listeners.length; i++) {
                        let option2 = new rpc.MessageOption()
                        let data2 = rpc.MessageParcel.create()
                        let reply2 = rpc.MessageParcel.create()
                        listeners[i].sendRequest(1, data2, reply2, option2)
                            .then(function(result) {
                                console.info("18 send request done, error code: " + result.errCode + ", index: " + i)
                            })
                            .catch(function(e) {
                                console.error("18 send request got exception: " + e)
                            })
                            .finally(() => {
                                data2.reclaim()
                                reply2.reclaim()
                                console.info("case 18 test done")
                            })
                    }
                    console.info("18 The server's writeRemoteObjectArray result is " + result);
                    return true
                }
                case 19:
                {
                    console.info("case 19 start")
                    let tmp1 = data.readDoubleArray()
                    let result =  reply.writeDoubleArray(tmp1)
                    return true
                }

                case 20:
                {
                    console.info("case 20 start")
                    let tmp1 = data.readByte()
                    let tmp2 = data.readShort()
                    let tmp3 = data.readInt()
                    let tmp4 = data.readLong()
                    let tmp5 = data.readFloat()
                    let tmp6 = data.readDouble()
                    let tmp7 = data.readBoolean()
                    let tmp8 = data.readChar()
                    let tmp9 = data.readString()
                    let s = new MySequenceable(null, null)
                    let tmp10 = data.readParcelable(s)
                    let result1 =  reply.writeByte(tmp1)
                    let result2 =  reply.writeShort(tmp2)
                    let result3 =  reply.writeInt(tmp3)
                    let result4 =  reply.writeLong(tmp4)
                    let result5 =  reply.writeFloat(tmp5)
                    let result6 =  reply.writeDouble(tmp6)
                    let result7 =  reply.writeBoolean(tmp7)
                    let result8 =  reply.writeChar(tmp8)
                    let result9 =  reply.writeString(tmp9)
                    let result10 =  reply.writeParcelable(s)
                    return true
                }
                case 21:
                {
                    console.info("case 21 start")
                    let tmp1 = data.readByteArray()
                    let tmp2 = data.readShortArray()
                    let tmp3 = data.readIntArray()
                    let tmp4 = data.readLongArray()
                    let tmp5 = data.readFloatArray()
                    let tmp6 = data.readDoubleArray()
                    let tmp7 = data.readBooleanArray()
                    let tmp8 = data.readCharArray()
                    let tmp9 = data.readStringArray()
                    let s = [new MySequenceable(null, null), new MySequenceable(null, null),
                        new MySequenceable(null, null)]
                    let tmp10 = data.readParcelableArray(s)
                    let result1 =  reply.writeByteArray(tmp1)
                    let result2 =  reply.writeShortArray(tmp2)
                    let result3 =  reply.writeIntArray(tmp3)
                    let result4 =  reply.writeLongArray(tmp4)
                    let result5 =  reply.writeFloatArray(tmp5)
                    let result6 =  reply.writeDoubleArray(tmp6)
                    let result7 =  reply.writeBooleanArray(tmp7)
                    let result8 =  reply.writeCharArray(tmp8)
                    let result9 =  reply.writeStringArray(tmp9)
                    let result10 =  reply.writeParcelableArray(s)
                    return true
                }
                case 22:
                {
                    console.info("case 22 start")
                    let callingPid = rpc.IPCSkeleton.getCallingPid()
                    let callingUid = rpc.IPCSkeleton.getCallingUid()
                    reply.writeNoException()
                    reply.writeInt(callingPid)
                    reply.writeInt(callingUid)
                    reply.writeInt(this.getCallingPid())
                    reply.writeInt(this.getCallingUid())
                    let id = rpc.IPCSkeleton.resetCallingIdentity()
                    rpc.IPCSkeleton.setCallingIdentity(id)
                    reply.writeInt(rpc.IPCSkeleton.getCallingPid())
                    reply.writeInt(rpc.IPCSkeleton.getCallingUid())
                    reply.writeInt(rpc.IPCSkeleton.flushCommands(this))
                    return true
                }
                case 23:
                {
                    console.info("case 23 start")
                    let s = new MySequenceable(null, null);
                    var tmp1 = data.readParcelable(s);
                    var result =  reply.writeParcelable(s);
                    return true
                }
                case 24:
                {
                    console.info("case 24 start")
                    var tmp1 = data.readShort();
                    var tmp2 = data.readShort();
                    var tmp3 = data.readShort();
                    var tmp4 = data.readShort();
                    var tmp5 = data.readShort();
                    var result1 =  reply.writeShort(tmp1);
                    var result2 =  reply.writeShort(tmp2);
                    var result3 =  reply.writeShort(tmp3);
                    var result4 =  reply.writeShort(tmp4);
                    var result5 =  reply.writeShort(tmp5);
                    return true
                }
                case 25:
                {
                    console.info("case 25 start")
                    var tmp1 = data.readByte();
                    var tmp2 = data.readByte();
                    var tmp3 = data.readByte();
                    var tmp4 = data.readByte();
                    var tmp5 = data.readByte();
                    var result1 =  reply.writeByte(tmp1);
                    var result2 =  reply.writeByte(tmp2);
                    var result3 =  reply.writeByte(tmp3);
                    var result4 =  reply.writeByte(tmp4);
                    var result5 =  reply.writeByte(tmp5);
                    return true
                }
                case 26:
                {
                    console.info("case 26 start")
                    var tmp1 = data.readInt();
                    var tmp2 = data.readInt();
                    var tmp3 = data.readInt();
                    var tmp4 = data.readInt();
                    var tmp5 = data.readInt();
                    var result1 =  reply.writeInt(tmp1);
                    var result2 =  reply.writeInt(tmp2);
                    var result3 =  reply.writeInt(tmp3);
                    var result4 =  reply.writeInt(tmp4);
                    var result5 =  reply.writeInt(tmp5);
                    return true
                }
                case 28:
                {
                    console.info("case 28 start")
                    let callingPid = rpc.IPCSkeleton.getCallingPid()
                    let callingUid = rpc.IPCSkeleton.getCallingUid()
                    let callingDeviceID = rpc.IPCSkeleton.getCallingDeviceID()
                    let localDeviceID = rpc.IPCSkeleton.getLocalDeviceID()
                    let isLocalCalling = rpc.IPCSkeleton.isLocalCalling()
                    reply.writeNoException()
                    reply.writeInt(callingPid)
                    reply.writeInt(callingUid)
                    reply.writeString(callingDeviceID)
                    reply.writeString(localDeviceID)
                    reply.writeBoolean(isLocalCalling)
                    reply.writeInt(this.getCallingPid())
                    reply.writeInt(this.getCallingUid())
                    let id = rpc.IPCSkeleton.resetCallingIdentity()
                    rpc.IPCSkeleton.setCallingIdentity(id)
                    reply.writeInt(rpc.IPCSkeleton.getCallingPid())
                    reply.writeInt(rpc.IPCSkeleton.getCallingUid())
                    reply.writeInt(rpc.IPCSkeleton.flushCommands(this))
                    return true
                }
                case 29:
                {
                    console.info("case 29 starts")
                    let bytesWr = data.readInt()
                    let fd = data.readFileDescriptor()
                    let writeFileResult = fileio.writeSync(fd, "HELLO RPC", {position: bytesWr + 1});
                    rpc.MessageParcel.closeFileDescriptor(fd)
                    return true
                }
                case 30:
                {
                    console.info("case 30 start")
                    let listeners = data.readRemoteObjectArray();
                    let num = data.readInt()
                    let str = data.readString()
                    for (let i = 0; i < listeners.length; i++) {
                        let option2 = new rpc.MessageOption()
                        let data2 = rpc.MessageParcel.create()
                        let reply2 = rpc.MessageParcel.create()
                        data2.writeInt(num)
                        data2.writeString(str)
                        listeners[i].sendRequest(1, data2, reply2, option2)
                            .then(function(result) {
                                console.info("30 send request done, error code: " + result.errCode + ", index: " + i)
                            })
                            .catch(function(e) {
                                console.error("30 send request got exception: " + e)
                            })
                            .finally(() => {
                                data2.reclaim()
                                reply2.reclaim()
                                console.info("case 30 test done")
                            })
                    }
                    reply.writeNoException()
                    return true
                }

                case 31:
                {
                    console.info("case 31 start")
                    let listeners = new Array(3)
                    data.readRemoteObjectArray(listeners)
                    let num = data.readInt()
                    let str = data.readString()
                    for (let i = 0; i < listeners.length; i++) {
                        let option2 = new rpc.MessageOption()
                        let data2 = rpc.MessageParcel.create()
                        let reply2 = rpc.MessageParcel.create()
                        data2.writeInt(num)
                        data2.writeString(str)
                        listeners[i].sendRequest(1, data2, reply2, option2)
                            .then(function(result) {
                                console.info("31 send request done, error code: " + result.errCode + ", index: " + i)
                            })
                            .catch(function(e) {
                                console.error("31 send request got exception: " + e)
                            })
                            .finally(() => {
                                data2.reclaim()
                                reply2.reclaim()
                                console.info("case 31 test done")
                            })
                    }
                    reply.writeNoException()
                    return true
                }
                case 32:
                {
                    console.info("case 32 start")
                    let tmp1 = data.readString()
                    let result =  reply.writeString("onRemoteMessageRequest invoking")
                    return true
                }
                default:
                    this.onRemoteRequest(code, data, reply, option)
            }
        } catch (error) {
            console.info("onRemoteMessageRequest: " + error);
        }
        return false
    }
}