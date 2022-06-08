/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import netConnection from '@ohos.net.connection';
import {describe, afterAll, it, expect, beforeAll, afterEach} from 'deccjsunit/index';


describe('Telephony_NETMANAGER_TestDNSTest',function(){


    it('Telephony_NETMANAGER_TestDNS_Test0100', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressesByName("www.zhihu.com").then(function(addresses){
                if(addresses === undefined || addresses.length == 0 ){
                    console.log('Telephony_NETMANAGER_TestDNS_Test0100 addresses id undefined '+addresses);
                    expect(false).assertFail();
                }else{
                    console.log('Telephony_NETMANAGER_TestDNS_Test0100 is success');
                    expect(true).assertTrue();
                }
                done();
            })
        })
    });

    it('Telephony_NETMANAGER_TestDNS_Test0200', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressesByName("www.zhihu.com", function(err, addresses){
                if(addresses === undefined || addresses.length == 0 ){
                    console.log('Telephony_NETMANAGER_TestDNS_Test0200 addresses id undefined '+addresses);
                    expect(false).assertFail();
                }else{
                    console.log('Telephony_NETMANAGER_TestDNS_Test0200 is success');
                    expect(true).assertTrue();
                }
                done();
            })
        })
    });


    it('Telephony_NETMANAGER_TestDNS_Test0300', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressByName("www.zhihu.com").then(function(address){
                if(address === undefined){
                    console.log('Telephony_NETMANAGER_TestDNS_Test0300 addresses id undefined '+address);
                    expect(false).assertFail();
                }else{
                    console.log('Telephony_NETMANAGER_TestDNS_Test0300 is success');
                    expect(true).assertTrue();
                }
                done();
            })
        })
    });

    it('Telephony_NETMANAGER_TestDNS_Test0400', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressByName("www.baidu.com", function(err, address){
                if(address === undefined ){
                    console.log('Telephony_NETMANAGER_TestDNS_Test0400 addresses id undefined '+address);
                    expect(false).assertFail();
                }else{
                    console.log('Telephony_NETMANAGER_TestDNS_Test0400 is success');
                    expect(true).assertTrue();
                }
                done();
            })
        })
    });

    it('Telephony_NETMANAGER_TestDNS_Test0500', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressesByName("www.askjdbaksjnhd.com").catch(function(error){
                if(error === undefined){
                    expect(false).assertTrue();
                }else{
                    expect(true).assertTrue()
                }
                done();
            })
        })
    });

    it('Telephony_NETMANAGER_TestDNS_Test0600', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressesByName("www.askjdbaksjnhd.com", function(err, addresses){
                if(addresses instanceof Array && addresses.length !== 0 ){
                    console.log('Telephony_NETMANAGER_TestDNS_Test0600 addresses id undefined '+addresses);
                    expect(false).assertFail();
                }else{
                    console.log('Telephony_NETMANAGER_TestDNS_Test0600 is success');
                    expect(true).assertTrue();
                }
                done();
            })
        })
    });


    it('Telephony_NETMANAGER_TestDNS_Test0700', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressesByName("www.askjdbaksjnhd.com").catch(function(error){
                if(error === undefined){
                    expect(false).assertTrue();
                }else{
                    expect(true).assertTrue()
                }
                done();
            })
        })
    });

    it('Telephony_NETMANAGER_TestDNS_Test0800', 0, function(done){

        netConnection.getDefaultNet().then(function(netHandle){
            netHandle.getAddressesByName("www.askjdbaksjnhd.com", function(err, address){
                if(address !== undefined ){
                    console.log('Telephony_NETMANAGER_TestDNS_Test0800 addresses id undefined '+address);
                    expect(false).assertFail();
                }else{
                    console.log('Telephony_NETMANAGER_TestDNS_Test0800 is success');
                    expect(true).assertTrue();
                }
                done();
            })
        })
    });

});