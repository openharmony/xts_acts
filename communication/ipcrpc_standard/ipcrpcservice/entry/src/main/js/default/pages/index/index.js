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

import rpc from '@ohos.rpc';

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

let gBasicStub;
let gExtendStub;
let gBasicStubDesc = "Basic_Stub_Desc";
let gExtendStubDesc = "Extend_Stub_Desc";

const TAG = "[IpcRpcService]";

function logInfo(logContent) {
    console.info(TAG + logContent);
}

class BasicStub extends rpc.RemoteObject {
    constructor(des) {
        if (typeof des === 'string') {
            super(des, des.length);
        }
        return null;
    }
    onRemoteRequest(code, data, reply, option) {
        logInfo("start call code is:" + code)
        if (code === CODE_BASIC) {
            logInfo("entry basic(add)");
            let add1 = data.readInt();
            let add2 = data.readInt();
            let addResult = add1 + add2;
            logInfo("read data int1:" + add1 + ",int2:" + add2 + ",add rst:" + addResult);
            let isOk = reply.writeInt(addResult);
            logInfo("writeInt ret:" + isOk);
            return true;
        } else if(code === CODE_TRANS_BASIC) {
            logInfo("entry trans basic data type");
            this.transBasic(data, reply);
            return true;
        } else if (code === CODE_GET_OBJECT) {
            logInfo("entry get remote object(basic)")
            let strArray = data.readStringArray();
            logInfo("read string array:" + strArray);
            let isOk = reply.writeRemoteObject(gBasicStub);
            if (isOk) {
                logInfo("writeRemoteObject success");
            } else {
                logInfo("writeRemoteObject fail");
            }
            return true;
        } else if (code === CODE_GET_OBJECTS) {
            logInfo("entry get three remote object(basic)");
            let strArray = data.readStringArray();
            logInfo("read string array:" + strArray);
            let isOk = reply.writeRemoteObject(gBasicStub);
            if (isOk) {
                logInfo("writeRemoteObject1 success");
            } else {
                logInfo("writeRemoteObject1 fail");
            }
            isOk = reply.writeRemoteObject(gBasicStub);
            if (isOk) {
                logInfo("writeRemoteObject2 success");
            } else {
                logInfo("writeRemoteObject2 fail");
            }
            isOk = reply.writeRemoteObject(gBasicStub);
            if (isOk) {
                logInfo("writeRemoteObject3 success");
            } else {
                logInfo("writeRemoteObject3 fail");
            }
            return true;
        } else if (code === CODE_GET_OBJECTS_MIX) {
            logInfo("entry get two remote object(extend and basic)");
            let isOk = reply.writeRemoteObject(gExtendStub);
            if (isOk) {
                logInfo("writeRemoteObject[extend] success");
            } else {
                logInfo("writeRemoteObject[extend] fail");
            }
            isOk = reply.writeRemoteObject(gBasicStub);
            if (isOk) {
                logInfo("writeRemoteObject[basic] success");
            } else {
                logInfo("writeRemoteObject[basic] fail");
            }
            return true;
        } else if (code === CODE_GET_OBJECT_CALL) {
            logInfo("entry get remote object(extend) to call");
            let isOk = reply.writeRemoteObject(gExtendStub);
            if (isOk) {
                logInfo("writeRemoteObject[extend] success");
            } else {
                logInfo("writeRemoteObject[extend] fail");
            }
            return true;
        } else if (code === CODE_GET_OBJECT_DESC) {
            logInfo("entry get object desc(basic and extend)");
            let basicDesc = gBasicStub.getInterfaceDescriptor();
            let extendDesc = gExtendStub.getInterfaceDescriptor();
            let isOk = reply.writeString(basicDesc);
            if (isOk) {
                logInfo("writeString[basic] success");
            } else {
                logInfo("writeString[basic] fail");
            }
            isOk = reply.writeString(extendDesc);
            if (isOk) {
                logInfo("writeString[extend] success");
            } else {
                logInfo("writeString[extend] fail");
            }
            return true;
        } else if (code === CODE_GET_CALL_UID) {
            logInfo("entry get call uid");
            let callUid = rpc.IPCSkeleton.getCallingUid();
            logInfo("get call uid:" + callUid);
            let isOk = reply.writeInt(callUid);
            if (isOk) {
                logInfo("writeInt[call uid] success");
            } else {
                logInfo("writeInt[call uid] fail");
            }
            return true;
        } else if (code === CODE_GET_CALL_PID) {
            logInfo("entry get call pid");
            let callPid = rpc.IPCSkeleton.getCallingPid();
            logInfo("get call pid:" + callPid);
            let isOk = reply.writeInt(callPid);
            if (isOk) {
                logInfo("writeInt[call pid] success");
            } else {
                logInfo("writeInt[call pid] fail");
            }
            return true;
        } else if (code === CODE_CHECK_LOCAL_CALL) {
            logInfo("entry check local call");
            let isLocal = rpc.IPCSkeleton.isLocalCalling();
            logInfo("call isLocalCalling" + isLocal);
            let isOk = reply.writeBoolean(isLocal);
            if (isOk) {
                logInfo("writeBoolean[isLocal] success");
            } else {
                logInfo("writeBoolean[isLocal] fail");
            }
            return true;
        } else {
            logInfo("not support this code");
            return false;
        }
        logInfo("end call code is:" + code)
    }

    transBasic(data, reply) {
        logInfo("transBasic begin");
        let rByte = data.readByte();
        let rChar = data.readChar();
        let rShort = data.readShort();
        let rInt = data.readInt();
        let rLong = data.readLong();
        let rBoolean = data.readBoolean();
        let rFloat = data.readFloat();
        let rDouble = data.readDouble();
        logInfo(rByte);
        logInfo(rChar);
        logInfo(rShort);
        logInfo(rInt);
        logInfo(rLong);
        logInfo(rBoolean);
        logInfo(rFloat);
        logInfo(rDouble);
        reply.writeDouble(rDouble);
        reply.writeFloat(rFloat);
        reply.writeBoolean(rBoolean);
        reply.writeLong(rLong);
        reply.writeInt(rInt);
        reply.writeShort(rShort);
        reply.writeChar(rChar);
        reply.writeByte(rByte);
        logInfo("transBasic end");
    }
}

class ExtendStub extends rpc.RemoteObject {
    constructor(des) {
        if (typeof des === 'string') {
            super(des, des.length);
        }
        return null;
    }
    onRemoteRequest(code, data, reply, option) {
        logInfo("start call code is:" + code)
        if (code === CODE_BASIC) {
            let sub1 = data.readInt();
            let sub2 = data.readFloat();
            let subResult = sub1 - sub2;
            logInfo("read data int1:" + sub1 + ",int2:" + sub2 + ",sub rst:" + subResult);
            let isOk = reply.writeFloat(subResult);
            logInfo("writeInt ret:" + isOk);
            return true;
        } else {
            logInfo("not support this code");
            return false;
        }
    }
}

export default {
    data: {
        title: ""
    },
    onStart(want) {
        logInfo("onStart start");
        gBasicStub = new BasicStub(gBasicStubDesc);
        gExtendStub = new ExtendStub(gExtendStubDesc);
        logInfo("onStart end")
    },
    onStop() {
        logInfo('onStop');
    },
    onConnect(want) {
        logInfo('onConnect');
        return gBasicStub;
    },
    onReconnect(want) {
        logInfo('onReconnect');
    },
    onDisconnect() {
        logInfo('onDisConnect');
    },
    onCommand(want, restart, startId) {
        logInfo('onCommand');
    },
}