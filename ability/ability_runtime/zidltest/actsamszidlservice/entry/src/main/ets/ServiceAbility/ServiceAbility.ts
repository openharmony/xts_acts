/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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
import ServiceExtension from '@ohos.application.ServiceExtensionAbility'
import Want from '@ohos.application.Want';
import {voidOutStringCallback} from "./zidlTool/i_zidl_tool_test";
import {voidOutIntCallback} from "./zidlTool/i_zidl_tool_test";
import {voidOutMapStringIntCallback} from "./zidlTool/i_zidl_tool_test";
import {voidOutStringArrayCallback} from "./zidlTool/i_zidl_tool_test";
import {voidInOutMapStringIntCallback} from "./zidlTool/i_zidl_tool_test";
import {voidInOutStringArrayCallback} from "./zidlTool/i_zidl_tool_test";
import {voidInOutIntCallback} from "./zidlTool/i_zidl_tool_test";
import {voidInOutStringCallback} from "./zidlTool/i_zidl_tool_test";
import {booleanVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {byteVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {shortVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {intVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {longVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {floatVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {doubleVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {stringVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {sequenceableVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {interfaceVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {mapStringStringVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {doubleArrayVoidCallback} from "./zidlTool/i_zidl_tool_test";
import {voidOrderOutInCallback} from "./zidlTool/i_zidl_tool_test"
import {voidOrderInOutInCallback} from "./zidlTool/i_zidl_tool_test"
import {voidOrderOutInOutCallback} from "./zidlTool/i_zidl_tool_test"
import {voidOrderInInOutOutCallback} from "./zidlTool/i_zidl_tool_test"
import {onewayVoidVoidCallback} from "./zidlTool/i_zidl_tool_test"
import {voidInMapStringIntCallback} from "./zidlTool/i_zidl_tool_test"
import {voidVoidCallback} from "./zidlTool/i_zidl_tool_test"
import {voidInStringArrayCallback} from "./zidlTool/i_zidl_tool_test"
import ZidlTestServiceStub from './zidlTool/zidl_tool_test_stub';
import MySequenceable from "./zidlTool/my_sequenceable";
import InterfaceDeclareProxy from './interfaceDeclare/interface_declare_proxy'
import InterfaceDeclareStub from './interfaceDeclare/interface_declare_stub'
import {voidInIntCallback} from "./zidlTool/i_zidl_tool_test"
import {voidInStringCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeBooleanCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeByteCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeShortCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeIntCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeLongCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeFloatCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeDoubleCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeStringCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeSequenceableCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeInterfaceCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeMapStringStringCallback} from "./zidlTool/i_zidl_tool_test"
import {voidParameterTypeDoubleArrayCallback} from "./zidlTool/i_zidl_tool_test"
import {testInterfaceCallback} from './interfaceDeclare/i_interface_declare'

var SUCCESS = 0;
var FAIL = 1;

class ZidlTestImp extends ZidlTestServiceStub {

    onewayVoidVoid(callback: onewayVoidVoidCallback) {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0200 called");
        callback(SUCCESS);
    }

    voidVoid(callback: voidVoidCallback) {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0300 called");
        callback(SUCCESS);
    }

    booleanVoid(callback: booleanVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0400 called");
        var boolean = true;
        callback(SUCCESS, boolean);
    }

    byteVoid(callback: byteVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0500 called");
        var mybyte = 1;
        callback(SUCCESS, mybyte);
    }

    shortVoid(callback: shortVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0600 called");
        var myshort = 222;
        callback(SUCCESS, myshort);
    }

    intVoid(callback: intVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0700 called");
        var myint = 333;
        callback(SUCCESS, myint);
    }

    longVoid(callback: longVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0800 called");
        var mylong = 4444;
        callback(SUCCESS, mylong);
    }

    floatVoid(callback: floatVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_0900 called");
        var myfloat = 10.1;
        callback(SUCCESS, myfloat);
    }

    doubleVoid(callback: doubleVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1000 called");
        var mydouble = 22.1;
        callback(SUCCESS, mydouble);
    }

    stringVoid(callback: stringVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1100 called");
        var mystring = "stringVoid";
        callback(SUCCESS, mystring);
    }

    sequenceableVoid(callback: sequenceableVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1200 called");
        let mySequence = new MySequenceable();
        callback(SUCCESS, mySequence);
    }

    interfaceVoid(callback: interfaceVoidCallback) {
        class InterfaceDeclare extends InterfaceDeclareStub {
            testInterface(data: number, callback: testInterfaceCallback): void{
                console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1300 interfaceStub called");
                let result = FAIL;

                if (data == 1500) {
                    result = SUCCESS;
                }
                callback(result);
            }
        }
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1300 toolStub called");
        let serverInterface = new InterfaceDeclare('serverInterface');
        callback(SUCCESS, serverInterface);
    }

    mapStringStringVoid(callback: mapStringStringVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1400 called");
        let myMap = new Map();
        myMap.set("string1","string2");
        callback(SUCCESS, myMap);
    }

    doubleArrayVoid(callback: doubleArrayVoidCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1500 called");
        var array = [1.1, 2.1, 3.1];
        callback(SUCCESS, array);
    }

    voidInMapStringInt(myMap, callback: voidInMapStringIntCallback){
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_1600_1 called:'+ myMap.get("string1"));
        if(myMap.get("string1") == 1){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidInStringArray(strarray, callback: voidInStringArrayCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1600_2 called:"+ JSON.stringify(strarray));
        if(strarray[0] == "aaa"&&strarray[1] == "bbb"&&strarray[2] == "ccc"){
            callback(SUCCESS);
        }else {
            callback(FAIL);
        }
    }

    voidOutMapStringInt(callback : voidOutMapStringIntCallback){
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_1700 called');
        var map=new Map<string,number>();
        map.set("voidOutMapStringInt", 1);
        callback(SUCCESS, map);
    }

    voidOutStringArray(callback :voidOutStringArrayCallback){
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_1700 called');
        var strarray = ["aa", "dd"];
        callback(SUCCESS, strarray);
    }

    voidInOutMapStringInt(mapIn, callback: voidInOutMapStringIntCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_1800 called');
        var errCode = FAIL;
        if ((mapIn.get("voidInOutMapStringInt1") == 1801) &&
        (mapIn.get("voidInOutMapStringInt2") == 1802)) {
            mapIn.set("voidInOutMapStringInt1", 1802);
            mapIn.set("voidInOutMapStringInt2", 1801);
            errCode = SUCCESS;
        }
        callback(errCode, mapIn);
    }

    voidInOutStringArray(strArrayIn, callback: voidInOutStringArrayCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_1800 called');
        var errCode = FAIL;
        if ((strArrayIn[0] == "ddd") &&
        (strArrayIn[1] == "ccc")) {
            strArrayIn[0] = "aaa";
            strArrayIn[1] = "bbb";
            errCode = SUCCESS;
        }
        callback(errCode, strArrayIn);
    }

    voidInInt(number, callback : voidInIntCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_1900 called:'+ JSON.stringify(number));
        if(number == 8888){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidInString(string, callback : voidInStringCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_1900 called:'+ JSON.stringify(string));
        if(string == "voidInString"){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidOutInt(callback : voidOutIntCallback){
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2000 called');
        var number = 123;
        callback(SUCCESS, number);
    }

    voidOutString(callback : voidOutStringCallback){
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2000 called');
        var string = "voidOutString";
        callback(SUCCESS, string);
    }

    voidInOutInt(number, callback: voidInOutIntCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2100_1 called:'+ JSON.stringify(number));
        var num = 456789;
        if(number == 123456){
            callback(SUCCESS, num);
        }else{
            callback(FAIL, number);
            console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2100_1 Call_Fail')
        }
    }
    voidInOutString(strinput, callback: voidInOutStringCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2100_2 called:'+ JSON.stringify(strinput));
        var str = "456789";
        if(strinput == "voidInOutString"){
            callback(SUCCESS, str);
        }else{
            console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2100_2 Call_Fail');
            callback(FAIL, strinput);
        }
    }

    voidParameterTypeBoolean(oBooleanTrue, callback : voidParameterTypeBooleanCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2200 called:'+ JSON.stringify(oBooleanTrue));
        if(oBooleanTrue == true){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeByte(number, callback : voidParameterTypeByteCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2300 called:'+ JSON.stringify(number));
        if(number == 1111){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeShort(number, callback : voidParameterTypeShortCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2400 called:'+ JSON.stringify(number));
        if(number == 2222){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeInt(number, callback : voidParameterTypeIntCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2500 called:'+ JSON.stringify(number));
        if(number == 3333){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeLong(number, callback : voidParameterTypeLongCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2600 called:'+ JSON.stringify(number));
        if(number == 4444){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeFloat(number, callback : voidParameterTypeFloatCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2700 called:'+ JSON.stringify(number));
        if(number == 5555.1){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeDouble(number, callback : voidParameterTypeDoubleCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2800 called:'+ JSON.stringify(number));
        if(number == 6666.1){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeString(string, callback : voidParameterTypeStringCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_2900 called:'+ JSON.stringify(string));
        if(string == "voidParameterTypeString"){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeSequenceable(MySequenceable, callback : voidParameterTypeSequenceableCallback) {
        console.log('ZidlTest Process Server ACTS_Zidl_Js2JsMulti_3000 called:'+ JSON.stringify(MySequenceable));
        if((MySequenceable != null) && (MySequenceable.getNum() == 32) && (MySequenceable.getString() == "nihao")){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeInterface(param: InterfaceDeclareProxy, callback : voidParameterTypeInterfaceCallback) {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_3100 called");
        let proxy = new InterfaceDeclareProxy(param);
        proxy.testInterface(3300, (errCode)=>{
            if (errCode == SUCCESS) {
                console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_3100 callback SUCCESS");
                callback(SUCCESS);
            } else {
                console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_3100 callback FAIL");
                callback(FAIL);
            }
        });

    }

    voidParameterTypeMapStringString(map, callback : voidParameterTypeMapStringStringCallback) {
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_3200 called:'+ map.get("voidParameterTypeMapStringString"));
        if(map.get("voidParameterTypeMapStringString") == "fdhatdh"){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidParameterTypeDoubleArray(array, callback : voidParameterTypeDoubleArrayCallback){
        console.log('ZidlTest Server ACTS_Zidl_Js2JsMulti_3300 called:'+ JSON.stringify(array));
        if(array.length == 2 && array[0] == 1.1 && array[1] == 2.1){
            callback(SUCCESS);
        }else{
            callback(FAIL);
        }
    }

    voidOrderOutIn(paramI, callback: voidOrderOutInCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_3400 called" + paramI);
        var mystring = "hello world";
        callback(SUCCESS, mystring);
    }

    voidOrderInOutIn(paramI, paramS, callback: voidOrderInOutInCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_3500 called" + paramI + " " + paramS);
        var mynumber = 6;
        callback(SUCCESS, mynumber);
    }

    voidOrderOutInOut(paramS, callback: voidOrderOutInOutCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_3600 called" + paramS);
        var mynumber = 3;
        var mystring = "paramcallback";
        callback(SUCCESS, mynumber, mystring);
    }

    voidOrderInInOutOut(paramS, paramI, callback: voidOrderInInOutOutCallback){
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_3700 called" + paramS + " " + paramI);
        var mystring = "callback";
        var mynumber = 4;
        callback(SUCCESS, mynumber, mystring);
    }
}

export default class ServiceAbility extends ServiceExtension {
    onCreate(want: Want) {
        globalThis.abilityWant = want;
        console.log('ZidlService ServiceAbility onCreate, want: ' + want.abilityName);
    }

    onRequest(want, startId) {
        console.log('ZidlService ServiceAbility onRequest, want: ' + want.abilityName
        + ', startId: ' + startId);
    }

    onConnect(want) {
        console.log('ZidlService ServiceAbility onConnect, want:' + want.abilityName);
        return new ZidlTestImp('connect');
    }

    onDisconnect(want) {
        console.log('ZidlService ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('AZidlService ServiceAbility onDestroy');
    }
};
