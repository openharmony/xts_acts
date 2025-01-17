/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import napitest from 'libnapitest.so';
// import napitest from 'libentry.so';

declare class ArkTools {
  static forceFullGC(): void;
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  console.info('Worker received message:', e.data);
  switch (e.data) {
    case 'getLastError': {
      let getLastErrorValue = napitest.napiSerialize();
      ArkTools.forceFullGC();
      console.info('Worker: napiSerialize value is ' + getLastErrorValue);
      workerPort.postMessage(getLastErrorValue);
      break;
    }
    case 'isError': {
      let isErrorValue = napitest.isError(true);
      ArkTools.forceFullGC();
      console.info('Worker: isError ret is ' + isErrorValue);
      workerPort.postMessage(isErrorValue);
      break;
    }
    case 'createError': {
      let createErrorValue = napitest.createError();
      ArkTools.forceFullGC();
      console.info('Worker: createError value is ' + createErrorValue);
      workerPort.postMessage(createErrorValue);
      break;
    }
    case 'createRangeError': {
      let createRangeErrorValue = napitest.createRangeError();
      ArkTools.forceFullGC();
      console.info('Worker: createRangeError value is ' + createRangeErrorValue);
      workerPort.postMessage(createRangeErrorValue);
      break;
    }
    case 'isExceptionPending': {
      let isExceptionPendingValue = napitest.isExceptionPending();
      ArkTools.forceFullGC();
      console.info('Worker: isExceptionPending value is ' + isExceptionPendingValue);
      workerPort.postMessage(isExceptionPendingValue);
      break;
    }
    case 'createReference': {
      let createReferenceValue = napitest.createReference();
      ArkTools.forceFullGC();
      console.info('Worker: createReference value is ' + createReferenceValue);
      workerPort.postMessage(createReferenceValue);
      break;
    }
    case 'referenceRefAndUnref': {
      let referenceRefAndUnrefValue = napitest.referenceRefAndUnref();
      ArkTools.forceFullGC();
      console.info('Worker: referenceRefAndUnref value is ' + referenceRefAndUnrefValue);
      workerPort.postMessage(referenceRefAndUnrefValue);
      break;
    }
    case 'createArrayAndGetLength': {
      let array = [1, 2];
      let createArrayAndGetLengthValue = napitest.createArrayAndGetLength(array);
      let createArrayAndGetLengthObj = JSON.stringify(createArrayAndGetLengthValue);
      ArkTools.forceFullGC();
      console.info('Worker: createArrayAndGetLength value is ' + createArrayAndGetLengthObj);
      workerPort.postMessage(createArrayAndGetLengthObj);
      break;
    }
    case 'createExternal': {
      let createExternalValue = napitest.createExternal();
      ArkTools.forceFullGC();
      console.info('Worker: createExternal value is ' + createExternalValue);
      workerPort.postMessage(createExternalValue);
      break;
    }
    case 'createExternalArraybuffer': {
      let createExternalArraybufferValue = napitest.createExternalArraybuffer();
      ArkTools.forceFullGC();
      console.info('Worker: createExternalArraybuffer value is ', createExternalArraybufferValue);
      let createExternalArraybufferRes = createExternalArraybufferValue instanceof ArrayBuffer;
      workerPort.postMessage(createExternalArraybufferRes);
      break;
    }
    case 'createObject': {
      let createObjectValue = napitest.createObject();
      ArkTools.forceFullGC();
      console.info('Worker: createObject value is ', createObjectValue);
      let createObjectRes = createObjectValue instanceof Object;
      workerPort.postMessage(createObjectRes);
      break;
    }
    case 'createSymbol': {
      let symbolValue = napitest.createSymbol('symbol');
      ArkTools.forceFullGC();
      console.info('Worker: createSymbol value is ' + symbolValue);
      workerPort.postMessage(symbolValue);
      break;
    }
    case 'createTypeArray': {
      let typeArrayValue = napitest.createTypeArray();
      ArkTools.forceFullGC();
      console.info('Worker: createTypeArray value is ', typeArrayValue);
      workerPort.postMessage(typeArrayValue instanceof Int32Array);
      break;
    }
    case 'getValueBool': {
      let boolValue = napitest.getValueBool(false);
      ArkTools.forceFullGC();
      console.info('Worker: getValueBool value is ', boolValue);
      workerPort.postMessage(boolValue);
      break;
    }
    case 'createAndGetInt32': {
      let int32Value = napitest.createAndGetInt32(32);
      ArkTools.forceFullGC();
      console.info('Worker: createAndGetInt32 value is ', int32Value);
      workerPort.postMessage(int32Value);
      break;
    }
    case 'createAndGetUInt32': {
      let uInt32Value = napitest.createAndGetUInt32(32);
      ArkTools.forceFullGC();
      console.info('Worker: createAndGetUInt32 value is ', uInt32Value);
      workerPort.postMessage(uInt32Value);
      break;
    }
    case 'createAndGetInt64': {
      let int64Value = napitest.createAndGetInt64(23);
      ArkTools.forceFullGC();
      console.info('Worker: createAndGetInt64 value is ', int64Value);
      workerPort.postMessage(int64Value);
      break;
    }
    case 'createDouble': {
      let doubleValue = napitest.createDouble(24.67);
      ArkTools.forceFullGC();
      console.info('Worker: createDouble value is ', doubleValue);
      workerPort.postMessage(doubleValue);
      break;
    }
    case 'createAndGetStringUtf16': {
      let utf16Value = napitest.createAndGetStringUtf16('he');
      ArkTools.forceFullGC();
      console.info('Worker: createAndGetStringUtf16 value is ', utf16Value);
      workerPort.postMessage(utf16Value);
      break;
    }
    case 'stringUtf16OfCase': {
      let utf16CaseValue = napitest.stringUtf16OfCase('abc2r42');
      ArkTools.forceFullGC();
      console.info('Worker: stringUtf16OfCase value is ', utf16CaseValue);
      workerPort.postMessage(utf16CaseValue);
      break;
    }
    case 'getValueDouble': {
      let valueDouble = napitest.getValueDouble(24.5);
      ArkTools.forceFullGC();
      console.info('Worker: getValueDouble value is ', valueDouble);
      workerPort.postMessage(valueDouble);
      break;
    }
    case 'getValueExternal': {
      let externalValue = napitest.getValueExternal();
      ArkTools.forceFullGC();
      console.info('Worker: getValueExternal value is ', externalValue);
      workerPort.postMessage(externalValue);
      break;
    }
    case 'getNull': {
      let nullValue = napitest.getNull();
      ArkTools.forceFullGC();
      console.info('Worker: getNull value is ', nullValue);
      workerPort.postMessage(nullValue);
      break;
    }
    case 'getUndefined': {
      let undefinedValue = napitest.getUndefined();
      ArkTools.forceFullGC();
      console.info('Worker: getUndefined value is ', undefinedValue);
      workerPort.postMessage(undefinedValue);
      break;
    }
    case 'coerceToBool': {
      let coerceBoolValue = napitest.coerceToBool(0);
      ArkTools.forceFullGC();
      console.info('Worker: coerceToBool value is ', coerceBoolValue);
      workerPort.postMessage(coerceBoolValue);
      break;
    }
    case 'coerceToNumber': {
      let coerceNumberValue = napitest.coerceToNumber('12');
      ArkTools.forceFullGC();
      console.info('Worker: coerceToNumber value is ', coerceNumberValue);
      workerPort.postMessage(coerceNumberValue);
      break;
    }
    case 'coerceToObject': {
      let obj = napitest.coerceToObject([2, 3]);
      ArkTools.forceFullGC();
      console.info('Worker: coerceToObject value is: ', obj);
      workerPort.postMessage(JSON.stringify(obj));
      break;
    }
    case 'coerceToString': {
      let value = napitest.coerceToString(123);
      ArkTools.forceFullGC();
      console.info('Worker: coerceToString value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'typeOf': {
      let value = napitest.typeOf('test');
      ArkTools.forceFullGC();
      console.info('Worker: typeOf value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'isArray': {
      let value = napitest.isArray();
      ArkTools.forceFullGC();
      console.info('Worker: isArray value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'strictEquals': {
      let value = napitest.strictEquals();
      ArkTools.forceFullGC();
      console.info('Worker: strictEquals value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'getPropertyNames': {
      let value = napitest.getPropertyNames();
      ArkTools.forceFullGC();
      console.info('Worker: getPropertyNames value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'setProperty': {
      let value = napitest.setProperty();
      ArkTools.forceFullGC();
      console.info('Worker: setProperty value is: ', value);
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'getProperty': {
      let value = napitest.getProperty();
      ArkTools.forceFullGC();
      console.info('Worker: getProperty value is: ', value);
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'hasProperty': {
      let value = napitest.hasProperty();
      ArkTools.forceFullGC();
      console.info('Worker: hasProperty value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'setAndDeleteProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = { name: 'John', age: 30 };
      let value = napitest.setAndDeleteProperty(peop, 'a');
      ArkTools.forceFullGC();
      console.info('Worker: setAndDeleteProperty value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'hasOwnProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = {
        name: 'zhangsan',
        age: 18
      };
      let value = napitest.hasOwnProperty(peop, 'name');
      ArkTools.forceFullGC();
      console.info('Worker: hasOwnProperty value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'setNamedProperty': {
      let value = napitest.setNamedProperty([1, 2], "e", false);
      ArkTools.forceFullGC();
      console.info('Worker: setNamedProperty value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'getNamedProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = {
        name: 'zhangsan',
        age: 18
      };
      let value = napitest.getNamedProperty(peop, "name");
      ArkTools.forceFullGC();
      console.info('Worker: getNamedProperty value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'hasNamedProperty': {
      interface Person {
        name: string,
        age: number
      }

      let peop: Person = {
        name: 'zhangsan',
        age: 18
      };
      let value = napitest.hasNamedProperty(peop, "name");
      ArkTools.forceFullGC();
      console.info('Worker: hasNamedProperty value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'setElement': {
      let value = napitest.setElement();
      ArkTools.forceFullGC();
      console.info('Worker: setElement value is: ', value);
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'getElement': {
      let value = napitest.getElement();
      ArkTools.forceFullGC();
      console.info('Worker: getElement value is: ', value);
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'hasElement': {
      let value = napitest.hasElement();
      ArkTools.forceFullGC();
      console.info('Worker: hasElement value is: ', value);
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'deleteElement': {
      let value = napitest.deleteElement();
      ArkTools.forceFullGC();
      console.info('Worker: deleteElement value is: ', value);
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'defineProperties': {
      let value = napitest.defineProperties();
      ArkTools.forceFullGC();
      console.info('Worker: defineProperties value is: ', value);
      workerPort.postMessage(value instanceof Object);
      break;
    }
    case 'callFunctionNull': {
      let value = napitest.callFunctionNull(null);
      ArkTools.forceFullGC();
      console.info('Worker: callFunctionNull value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateFunctionFuncNull': {
      let value = napitest.napiCreateFunctionFuncNull();
      ArkTools.forceFullGC();
      console.info('Worker: napiCreateFunctionFuncNull value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiGetCbInfo': {
      let value = napitest.napiGetCbInfo(12.06);
      ArkTools.forceFullGC();
      console.info('Worker: napiGetCbInfo value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'unwrap': {
      let value = napitest.unwrap();
      ArkTools.forceFullGC();
      console.info('Worker: unwrap value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'removeWrap': {
      let value = napitest.removeWrap();
      ArkTools.forceFullGC();
      console.info('Worker: removeWrap value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'getVersion': {
      let value = napitest.getVersion();
      ArkTools.forceFullGC();
      console.info('Worker: getVersion value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'createPromise': {
      let value = napitest.createPromise();
      ArkTools.forceFullGC();
      console.info('Worker: createPromise value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'resolveAndRejectDeferred': {
      let value = napitest.resolveAndRejectDeferred();
      ArkTools.forceFullGC();
      console.info('Worker: resolveAndRejectDeferred value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'isPromise': {
      let value = napitest.isPromise();
      ArkTools.forceFullGC();
      console.info('Worker: isPromise value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateThreadsafeFunction': {
      let value = napitest.napiCreateThreadsafeFunction();
      ArkTools.forceFullGC();
      console.info('Worker: napiCreateThreadsafeFunction value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiDeleteSerializationDataTest': {
      let value = napitest.napiDeleteSerializationData();
      ArkTools.forceFullGC();
      console.info('Worker: napiDeleteSerializationDataTest value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCallThreadsafeFunction': {
      let value = napitest.napiCallThreadsafeFunction();
      ArkTools.forceFullGC();
      console.info('Worker: napiCallThreadsafeFunction value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiAnotherThreadSafeTest': {
      let value = napitest.ThreadSafeTestNull(() => 666);
      ArkTools.forceFullGC();
      console.info('Worker: napiAnotherThreadSafeTest value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiRefThreadsafeFunction': {
      let value = napitest.napiRefthreadSafeFunction();
      ArkTools.forceFullGC();
      console.info('Worker: napiRefThreadsafeFunction value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateDate': {
      let value = napitest.napiCreateDate();
      ArkTools.forceFullGC();
      console.info('Worker: napiCreateDate value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintInt64': {
      let value = napitest.napiCreateBigintInt64();
      ArkTools.forceFullGC();
      console.info('Worker: napiCreateBigintInt64 value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintUint64': {
      let value = napitest.napiCreateBigintUint64();
      ArkTools.forceFullGC();
      console.info('Worker: napiCreateBigintUint64 value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiCreateBigintWords': {
      let value = napitest.napiCreateBigintWords();
      ArkTools.forceFullGC();
      console.info('Worker: napiCreateBigintWords value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'GetAllPropertyNamesEnvNull': {
      let value = napitest.GetAllPropertyNamesEnvNull();
      ArkTools.forceFullGC();
      console.info('Worker: GetAllPropertyNamesEnvNull value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiSetInstanceData': {
      let value = napitest.napiSetInstanceData();
      ArkTools.forceFullGC();
      console.info('Worker: napiSetInstanceData value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'getModuleFileName': {
      let value = napitest.getModuleFileName().indexOf(".so");
      ArkTools.forceFullGC();
      console.info('Worker: getModuleFileName value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'createAsyncResource': {
      let value = napitest.createAsyncResource({
        foo: 'bar'
      }, false);
      ArkTools.forceFullGC();
      console.info('Worker: createAsyncResource value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'asyncWorkWithQos': {
      let value = napitest.asyncWorkWithQos(1000, (input) => {
        ArkTools.forceFullGC();
      console.info('Worker: asyncWorkWithQos ' + (input * 2));
        return input * 2;
      });
      ArkTools.forceFullGC();
      console.info('Worker: asyncWorkWithQos value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiRunScriptPathEnvNull': {
      let value = napitest.napiRunScriptPathEnvNull();
      ArkTools.forceFullGC();
      console.info('Worker: napiRunScriptPathEnvNull value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiLoadModuleTest': {
      let value = napitest.napiLoadModule();
      ArkTools.forceFullGC();
      console.info('Worker: napiLoadModuleTest value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'createObjectWithProperties': {
      let value = napitest.createObjectWithProperties();
      ArkTools.forceFullGC();
      console.info('Worker: createObjectWithProperties value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'createObjectWithNamedProperties': {
      let value = napitest.createObjectWithNamedProperties();
      ArkTools.forceFullGC();
      console.info('Worker: createObjectWithNamedProperties value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'coerceToNativeBindingObjectEnvNull': {
      let value = napitest.coerceToNativeBindingObjectEnvNull(null);
      ArkTools.forceFullGC();
      console.info('Worker: coerceToNativeBindingObjectEnvNull value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiSerializeTest': {
      let value = napitest.napiSerialize();
      ArkTools.forceFullGC();
      console.info('Worker: napiSerializeTest value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiDeSerializeTest': {
      let value = napitest.napiDeSerialize();
      ArkTools.forceFullGC();
      console.info('Worker: napiDeSerializeTest value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'napiIsSendableTest': {
      let value = napitest.NapiIsSendable([1, 2]);
      ArkTools.forceFullGC();
      console.info('Worker: napiIsSendableTest value is: ', value);
      workerPort.postMessage(value);
      break;
    }
    case 'NapiCreateSendableObject': {
      let value = napitest.NapiCreateSendableObject();
      ArkTools.forceFullGC();
      console.info('Worker: NapiCreateSendableObject value is: ', value);
      workerPort.postMessage(napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableArray': {
      let value = napitest.NapiCreateSendableArray();
      ArkTools.forceFullGC();
      console.info('Worker: NapiCreateSendableArray value is: ', value);
      let res = value.length == 0;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableArrayWithLength': {
      let value = napitest.NapiCreateSendableArrayWithLength();
      ArkTools.forceFullGC();
      console.info('Worker: NapiCreateSendableArrayWithLength value is: ', value);
      let res = value.length == 1;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableArrayBuffer': {
      let value = napitest.NapiCreateSendableArrayBuffer();
      ArkTools.forceFullGC();
      console.info('Worker: NapiCreateSendableArrayBuffer value is: ', value);
      let res = value.byteLength == 1024;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiCreateSendableTypedArray': {
      let value = napitest.NapiCreateSendableTypedArray();
      ArkTools.forceFullGC();
      console.info('Worker: NapiCreateSendableTypedArray value is: ', value);
      let res = value.byteLength == 1024;
      workerPort.postMessage(res && napitest.NapiIsSendable(value));
      break;
    }
    case 'NapiWrapSendable': {
      let value = napitest.NapiCreateSendableObject();
      napitest.NapiWrapSendable(value, 'data');
      ArkTools.forceFullGC();
      console.info('Worker: NapiWrapSendable value is: ', value);
      let res1 = napitest.NapiUnwrapSendable(value) == 'data';
      let res2 = napitest.NapiRemoveWrapSendable(value) == 'data';
      let res3 = napitest.NapiUnwrapSendable(value) == undefined;
      workerPort.postMessage(res1 && res2 && res3);
      break;
    }
    case 'NapiWrapSendableWithSize': {
      let value = napitest.NapiCreateSendableObject();
      napitest.NapiWrapSendableWithSize(value, 'data');
      ArkTools.forceFullGC();
      console.info('Worker: NapiWrapSendableWithSize value is: ', value);
      let res1 = napitest.NapiUnwrapSendable(value) == 'data';
      let res2 = napitest.NapiRemoveWrapSendable(value) == 'data';
      let res3 = napitest.NapiUnwrapSendable(value) == undefined;
      workerPort.postMessage(res1 && res2 && res3);
      break;
    }
    default:
      break;
  }
};