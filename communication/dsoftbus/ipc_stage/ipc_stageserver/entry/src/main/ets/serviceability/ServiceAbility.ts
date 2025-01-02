/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import ServiceExtension from "@ohos.app.ability.ServiceExtensionAbility";
import rpc from "@ohos.rpc";

let logTag = "[IpcServer_log:]";

class MySequenceable {
  num: number = 0;
  str: string = '';
  constructor(num: number, str: string) {
    this.num = num;
    this.str = str;
  }
  marshalling(messageSequence: rpc.MessageSequence): boolean {
    messageSequence.writeInt(this.num);
    messageSequence.writeString(this.str);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence): boolean {
    this.num = messageSequence.readInt();
    this.str = messageSequence.readString();
    return true;
  }
}

class Stub extends rpc.RemoteObject {
  constructor(descriptor: string) {
    console.info(logTag + "RemoteObject: " + descriptor);
    super(descriptor);
  }
  onRemoteMessageRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption): boolean | Promise<boolean> {
    try {
      console.info(logTag + "onRemoteMessageRequest: " + code);
      switch (code) {
        case 1:
          {
            console.info(logTag + "case 1 start");
            let tmp = data.readInterfaceToken();
            reply.writeInterfaceToken(tmp);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 2:
          {
            console.info(logTag + "case 2 start");
            let tmp1 = data.readString();
            reply.writeString(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 3:
          {
            console.info(logTag + "case 3 start");
            let tmp1 = data.readInt();
            reply.writeInt(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 4:
          {
            console.info(logTag + "case 4 start");
            let tmp1 = data.readByte();
            let tmp2 = data.readShort();
            let tmp3 = data.readInt();
            let tmp4 = data.readLong();
            let tmp5 = data.readFloat();
            let tmp6 = data.readDouble();
            let tmp7 = data.readBoolean();
            let tmp8 = data.readChar();
            let tmp9 = data.readString();
            let s = new MySequenceable(0, "");
            data.readParcelable(s);
            reply.writeByte(tmp1);
            reply.writeShort(tmp2);
            reply.writeInt(tmp3);
            reply.writeLong(tmp4);
            reply.writeFloat(tmp5);
            reply.writeDouble(tmp6);
            reply.writeBoolean(tmp7);
            reply.writeChar(tmp8);
            reply.writeString(tmp9);
            reply.writeParcelable(s);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 5:
          {
            console.info(logTag + "case 5 start");
            let tmp1 = data.readByte();
            reply.writeByte(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 6:
          {
            console.info(logTag + "case 6 start");
            let tmp1 = data.readByte();
            let tmp2 = data.readByte();
            let tmp3 = data.readByte();
            let tmp4 = data.readByte();
            let tmp5 = data.readByte();
            reply.writeByte(tmp1);
            reply.writeByte(tmp2);
            reply.writeByte(tmp3);
            reply.writeByte(tmp4);
            reply.writeByte(tmp5);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 7:
          {
            console.info(logTag + "case 7 start");
            let tmp1 = data.readShort();
            reply.writeShort(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 8:
          {
            console.info(logTag + "case 8 start");
            let tmp1 = data.readShort();
            let tmp2 = data.readShort();
            let tmp3 = data.readShort();
            let tmp4 = data.readShort();
            let tmp5 = data.readShort();
            reply.writeShort(tmp1);
            reply.writeShort(tmp2);
            reply.writeShort(tmp3);
            reply.writeShort(tmp4);
            reply.writeShort(tmp5);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 9:
          {
            console.info(logTag + "case 9 start");
            let tmp1 = data.readInt();
            let tmp2 = data.readInt();
            let tmp3 = data.readInt();
            let tmp4 = data.readInt();
            let tmp5 = data.readInt();
            reply.writeInt(tmp1);
            reply.writeInt(tmp2);
            reply.writeInt(tmp3);
            reply.writeInt(tmp4);
            reply.writeInt(tmp5);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 10:
          {
            console.info(logTag + "case 10 start");
            let tmp1 = data.readLong();
            reply.writeLong(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 11:
          {
            console.info(logTag + "case 11 start");
            let tmp1 = data.readFloat();
            reply.writeFloat(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 12:
          {
            console.info(logTag + "case 12 start");
            let tmp1 = data.readDouble();
            reply.writeDouble(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 13:
          {
            console.info(logTag + "case 13 start");
            let tmp1 = data.readBoolean();
            reply.writeBoolean(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 14:
          {
            console.info(logTag + "case 14 start");
            let tmp1 = data.readChar();
            reply.writeChar(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 15:
          {
            console.info(logTag + "case 15 start");
            let ret = new MySequenceable(0, "");
            data.readParcelable(ret);
            reply.writeParcelable(ret);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 16:
          {
            console.info(logTag + "case 16 start");
            let tmp1 = data.readByteArray();
            reply.writeByteArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 17:
          {
            console.info(logTag + "case 17 start");
            let tmp1 = data.readShortArray();
            reply.writeShortArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 18:
          {
            console.info(logTag + "case 18 start");
            let tmp1 = data.readIntArray();
            reply.writeIntArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 19:
          {
            console.info(logTag + "case 19 start");
            let tmp1 = data.readDoubleArray();
            let result = reply.writeDoubleArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 20:
          {
            console.info(logTag + "case 20 start");
            let tmp1 = data.readLongArray();
            reply.writeLongArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 21:
          {
            console.info(logTag + "case 21 start");
            let tmp1 = data.readFloatArray();
            reply.writeFloatArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 22:
          {
            console.info(logTag + "case 22 start");
            let tmp1 = data.readDoubleArray();
            reply.writeDoubleArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 23:
          {
            console.info(logTag + "case 23 start");
            let tmp1 = data.readBooleanArray();
            reply.writeBooleanArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 24:
          {
            console.info(logTag + "case 24 start");
            let tmp1 = data.readCharArray();
            reply.writeCharArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 25:
          {
            console.info(logTag + "case 25 start");
            let tmp1 = data.readStringArray();
            reply.writeStringArray(tmp1);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 26:
          {
            console.info(logTag + "case 26 start")
            data.readException();
            let tmp = data.readInt();
            reply.writeNoException();
            reply.writeInt(tmp);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 27:
          {
            console.info(logTag + "case 27 start");
            let s = [new MySequenceable(0, ""), new MySequenceable(0, ""),
              new MySequenceable(0, "")];
            data.readParcelableArray(s);
            reply.writeParcelableArray(s);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        case 28:
          {
            console.info(logTag + "case 28 start");
            let tmp1 = data.readByteArray();
            let tmp2 = data.readShortArray();
            let tmp3 = data.readIntArray();
            let tmp4 = data.readLongArray();
            let tmp5 = data.readFloatArray();
            let tmp6 = data.readDoubleArray();
            let tmp7 = data.readBooleanArray();
            let tmp8 = data.readCharArray();
            let tmp9 = data.readStringArray();
            let s = [new MySequenceable(0, ""), new MySequenceable(0, ""),
              new MySequenceable(0, "")];
            data.readParcelableArray(s);
            reply.writeByteArray(tmp1);
            reply.writeShortArray(tmp2);
            reply.writeIntArray(tmp3);
            reply.writeLongArray(tmp4);
            reply.writeFloatArray(tmp5);
            reply.writeDoubleArray(tmp6);
            reply.writeBooleanArray(tmp7);
            reply.writeCharArray(tmp8);
            reply.writeStringArray(tmp9);
            reply.writeParcelableArray(s);
            console.info(logTag + "onRemoteMessageRequest success");
            return true;
          }
        default:
          this.onRemoteMessageRequest(code, data, reply, option);
      }
    } catch (error) {
      console.info(logTag + "onRemoteMessageRequest: " + error);
    }
    return false;
  }
}

export default class ServiceAbility extends ServiceExtension {
  onCreate() {
    console.info(logTag + "IpcStageServer ServiceAbility onCreate");
  }

  onConnect() {
    console.info(logTag + "IpcStageServer ServiceAbility onConnect");
    return new Stub("rpcTestAbility");
  }

  onDisconnect() {
    console.info(logTag + "IpcStageServer ServiceAbility onDisconnect");
  }

  onRequest(){
    console.info(logTag + "IpcStageServer ServiceAbility onRequest");

  }

  onDestroy() {
    console.info(logTag + "IpcStageServer ServiceAbility onDestroy");
  }
};