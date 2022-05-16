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
import resmgr from '@ohos.resourceManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('resMgrTest', function () {
    console.log('*************start ResmgrTest*************');

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0100
    * @tc.name test getResourceManager method in callback mode
    * @tc.desc get the resource manager in callback mode
    */
    it('getResourceManager_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            expect(mgr !== null).assertTrue();
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0200
    * @tc.name test getResourceManager method in callback mode with bundlename
    * @tc.desc get the resource manager in callback mode with bundlename
    */
    it('getResourceManager_test_002', 0, async function (done) {
        resmgr.getResourceManager('com.ohos.settings', (error, mgr) => {
            expect(mgr !== null).assertTrue();
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0300
    * @tc.name test getResourceManager method in promise mode
    * @tc.desc get the resource manager in promise mode
    */
    it('getResourceManager_test_003', 0, async function (done) {
        resmgr.getResourceManager().then(mgr => {
            expect(mgr !== null).assertTrue();
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0400
    * @tc.name test getResourceManager method in promise mode with bundlename
    * @tc.desc get the resource manager in promise mode with bundlename
    */
    it('getResourceManager_test_004', 0, async function (done) {
        resmgr.getResourceManager('com.ohos.settings').then(mgr => {
            expect(mgr !== null).assertTrue();
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0500
    * @tc.name test getString method in callback mode
    * @tc.desc get the string in callback mode
    */
    it('getString_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString($r(app.string.app_name).id, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getString_test_001 ' + value);
                expect(value).assertEqual('L2Test');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0600
    * @tc.name test getString method in promise mode
    * @tc.desc get the string in promise mode
    */
    it('getString_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString($r(app.string.app_name).id).then(value => {
                expect(value !== null).assertTrue();
                console.log('getString_test_002 ' + value);
                expect(value).assertEqual('L2Test');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0700
    * @tc.name test getStringArray method in callback mode
    * @tc.desc get the string array in callback mode
    */
    it('getStringArray_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArray($r(app.strarray.sizeList).id, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringArray_test_001 ' + value);
                console.log('getStringArray_test_001 ' + value.length);
                console.log('getStringArray_test_001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0800
    * @tc.name test getStringArray method in promise mode
    * @tc.desc get the string array in promise mode
    */
    it('getStringArray_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArray($r(app.strarray.sizeList).id).then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringArray_test_002 ' + value);
                console.log('getStringArray_test_002 ' + value.length);
                console.log('getStringArray_test_002 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0900
    * @tc.name test getMedia method in callback mode
    * @tc.desc get the media in callback mode
    */
    it('getMedia_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMedia($r(app.media.icon).id, (err, value) => {
                expect(value.length > 0).assertTrue();
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1000
    * @tc.name test getMedia method in promise mode
    * @tc.desc get the media in promise mode
    */
    it('getMedia_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMedia($r(app.media.icon).id).then(value => {
                expect(value.length > 0).assertTrue();
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1100
    * @tc.name test getMediaBase64 method in callback mode
    * @tc.desc get the media base64 in callback mode
    */
    it('getMediaBase64_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64($r(app.media.icon).id, (err, value) => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64_test_001 ' + value);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1200
    * @tc.name test getMediaBase64 method in promise mode
    * @tc.desc get the media base64 in promise mode
    */
    it('getMediaBase64_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64($r(app.media.icon).id).then(value => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64_test_002 ' + value);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1300
    * @tc.name test getConfiguration method in callback mode
    * @tc.desc get the configuration in callback mode
    */
    it('getConfiguration_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getConfiguration((error, cfg) => {
                cfg.direction = Direction.DIRECTION_VERTICAL;
                cfg.locale = 'zh';
                expect(cfg !== null).assertTrue();
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1400
    * @tc.name test getConfiguration method in promise mode
    * @tc.desc get the configuration in promise mode
    */
    it('getConfiguration_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getConfiguration().then(cfg => {
                expect(cfg !== null).assertTrue();
                cfg.direction = Direction.DIRECTION_HORIZONTAL;
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1500
    * @tc.name test getDeviceCapability method in callback mode
    * @tc.desc get the device capability in callback mode
    */
    it('getDeviceCapability_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getDeviceCapability((error, dc) => {
                dc.screenDensity = ScreenDensity.SCREEN_SDPI;
                dc.deviceType = DeviceType.DEVICE_TYPE_PHONE;
                dc.screenDensity = ScreenDensity.SCREEN_MDPI;
                dc.deviceType = DeviceType.DEVICE_TYPE_CAR;
                dc.screenDensity = ScreenDensity.SCREEN_LDPI;
                dc.deviceType = DeviceType.DEVICE_TYPE_TV;
                expect(dc !== null).assertTrue();
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name test getDeviceCapability method in promise mode
    * @tc.desc get the device capability in promise mode
    */
    it('getDeviceCapability_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getDeviceCapability().then(dc => {
                dc.screenDensity = ScreenDensity.SCREEN_XLDPI;
                dc.deviceType = DeviceType.DEVICE_TYPE_TABLET;
                dc.screenDensity = ScreenDensity.SCREEN_XXLDPI;
                dc.deviceType = DeviceType.DEVICE_TYPE_WEARABLE;
                dc.screenDensity = ScreenDensity.SCREEN_XXXLDPI;
                dc.deviceType = DeviceType.DEVICE_TYPE_PC;
                expect(dc !== null).assertTrue();
                console.log('getDeviceCapability_test_002 ' + dc);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1700
    * @tc.name test getPluralString method in callback mode
    * @tc.desc get the plural string in callback mode
    */
    it('getPluralString_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralString($r(app.plural.plural_name).id, 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getPluralString_test_001 ' + value);
                expect(value).assertEqual('1 test other');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1800
    * @tc.name test getPluralString method in promise mode
    * @tc.desc get the plural string in promise mode
    */
    it('getPluralString_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralString($r(app.plural.plural_name).id, 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('getPluralString_test_002 ' + value);
                expect(value).assertEqual('1 test other');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1900
    * @tc.name test getString method in callback mode
    * @tc.desc get the string in callback mode
    */
    it('getString_test_003', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString($r(app.string.app_name).id, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getString_test_003 ' + value);
                expect(value).assertEqual('JS_Phone_Empty Feature Ability');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1700
    * @tc.name test getRawFile method in callback mode
    * @tc.desc get the getRawFile in callback mode
    */
    it('getRawFile_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFile('rawfile/rawfiletest.xml', (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getRawFile_test_001 ' + value);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1800
    * @tc.name test getRawFile method in promise mode
    * @tc.desc get the getRawFile in promise mode
    */
    it('getRawFile_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFile('rawfile/rawfiletest.xml').then(value => {
                expect(value !== null).assertTrue();
                console.log('getRawFile_test_002 ' + value);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_1900
    * @tc.name test release method
    * @tc.desc get the release function
    */
    it('release_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString($r(app.string.app_name).id, (err, value) => {
                expect(value !== null).assertTrue();
            })
            mgr.release();
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2000
    * @tc.name test getRawFileDescriptor method in callback mode
    * @tc.desc get the RawFileDescriptor in callback mode
    */
    it('getRawFileDescriptor_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFileDescriptor('rawfiletest.xml', (error, rawfile) => {
                let fdValue = rawfile.fd;
                let offsetValue = rawfile.offset;
                let lengthValue = rawfile.length;
                expect(rawfile !== null).assertTrue();
                console.log('getRawFileDescriptor_test_001--'
                            +'fd:' + fdValue
                            + ' offset:' + offsetValue
                            + ' length:' + lengthValue);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2100
    * @tc.name test getRawFileDescriptor method in promise mode
    * @tc.desc get the RawFileDescriptor in promise mode
    */
    it('getRawFileDescriptor_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFileDescriptor('rawfiletest.xml').then(rawfile => {
                rawfile.fd = 2000;
                rawfile.offset = 20;
                rawfile.length = 200;
                expect(rawfile !== null).assertTrue();
                console.log('getRawFileDescriptor_test_002--' + rawfile);
                console.log('getRawFileDescriptor_test_002--'
                +'fd:' + rawfile.fd
                + ' offset:' + rawfile.offset
                + ' length:' + rawfile.length);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2200
    * @tc.name test closeRawFileDescriptor method in callback mode
    * @tc.desc get the closeRawFileDescriptor in callback mode
    */
    it('closeRawFileDescriptor_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.closeRawFileDescriptor('rawfiletest.xml', (error, value) => {
                expect(error == null).assertTrue();
                console.log('closeRawFileDescriptor_test_001--' + error);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2300
    * @tc.name test closeRawFileDescriptor method in promise mode
    * @tc.desc get the closeRawFileDescriptor in promise mode
    */
    it('closeRawFileDescriptor_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.closeRawFileDescriptor('rawfiletest.xml').then(value => {
                expect(value !== null).assertTrue();
                console.log('closeRawFileDescriptor_test_002--' + value);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2400
    * @tc.name test getStringByName method in callback mode
    * @tc.desc get the string in callback mode
    */
    it('getStringByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringByName('app_name', (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringByName_test_001 ' + value);
                expect(value).assertEqual('L2Test');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2500
    * @tc.name test getString method in promise mode
    * @tc.desc get the string in promise mode
    */
    it('getStringByName_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringByName('app_name').then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringByName_test_002 ' + value);
                expect(value).assertEqual('L2Test');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2600
    * @tc.name test getStringArrayByName method in callback mode
    * @tc.desc get the string array in callback mode
    */
    it('getStringArrayByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArrayByName('sizeList', (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringArrayByName_test_001 ' + value);
                console.log('getStringArrayByName_test_001 ' + value.length);
                console.log('getStringArrayByName_test_001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2700
    * @tc.name test getStringArrayByName method in promise mode
    * @tc.desc get the string array in promise mode
    */
    it('getStringArrayByName_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArrayByName('sizeList').then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringArrayByName_test_002 ' + value);
                console.log('getStringArrayByName_test_002 ' + value.length);
                console.log('getStringArrayByName_test_002 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2800
    * @tc.name test getMediaByName method in callback mode
    * @tc.desc get the media in callback mode
    */
    it('getMediaByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaByName('icon', (err, value) => {
                expect(value.length > 0).assertTrue();
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_2900
    * @tc.name test getMediaByName method in promise mode
    * @tc.desc get the media in promise mode
    */
    it('getMediaByName_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaByName('icon').then(value => {
                expect(value.length > 0).assertTrue();
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3000
    * @tc.name test getMediaBase64ByName method in callback mode
    * @tc.desc get the media base64 in callback mode
    */
    it('getMediaBase64ByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64ByName('icon', (err, value) => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64ByName_test_001 ' + value);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3100
    * @tc.name test getMediaBase64ByName method in promise mode
    * @tc.desc get the media base64 in promise mode
    */
    it('getMediaBase64ByName_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64ByName('icon').then(value => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64ByName_test_002 ' + value);
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3200
    * @tc.name test getPluralStringByName method in callback mode
    * @tc.desc get the plural string in callback mode
    */
    it('getPluralStringByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralStringByName('plural_name', 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getPluralStringByName_test_001 ' + value);
                expect(value).assertEqual('1 test other');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3300
    * @tc.name test getPluralStringByName method in promise mode
    * @tc.desc get the plural string in promise mode
    */
    it('getPluralStringByName_test_002', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralStringByName('plural_name', 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('getPluralStringByName_test_002 ' + value);
                expect(value).assertEqual('1 test other');
            })
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3400
    * @tc.name test getStringSync method
    * @tc.desc get the string in sync mode
    */
    it('getStringSync_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getStringSync($r(app.string.app_name).id);
            expect(value !== null).assertTrue();
            console.log('getStringSync_test_001 ' + value);
            expect(value).assertEqual('L2Test');
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3500
    * @tc.name test getStringByNameSync method
    * @tc.desc get the string in sync mode
    */
    it('getStringByNameSync_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getStringByNameSync('app_name');
            expect(value !== null).assertTrue();
            console.log('getStringByNameSync_test_001 ' + value);
            expect(value).assertEqual('L2Test');
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3600
    * @tc.name test getBoolean method
    * @tc.desc get the boolean value
    */
    it('getBoolean_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getBoolean($r(app.boolean.boolean_1).id);
            console.log('getBoolean_test_001 ' + value);
            expect(value).assertTrue();
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3700
    * @tc.name test getBooleanByName method
    * @tc.desc get the boolean value
    */
    it('getBooleanByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getBooleanByName('boolean_1');
            console.log('getBooleanByName_test_001 ' + value);
            expect(value).assertTrue();
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3800
    * @tc.name test getNumber method with interger id
    * @tc.desc get the interger value
    */
    it('getinteger_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getNumber($r(app.integer.integer_1).id);
            console.log('getinteger_test_001 ' + value);
            expect(value).assertEqual(100);
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_3900
    * @tc.name test getNumberByName with interger
    * @tc.desc get the interger value
    */
    it('getintegerByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getNumberByName('integer_1');
            console.log('getintegerByName_test_001 ' + value);
            expect(value).assertEqual(100);
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_4000
    * @tc.name test getNumber with float id
    * @tc.desc get the float value
    */
    it('getfloat_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getNumber($r(app.float.float_1).id);
            console.log('getfloat_test_001 ' + value);
            expect(value).assertEqual(48);
        })
        done();
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_4100
    * @tc.name test getNumberByName with float
    * @tc.desc get the float value
    */
    it('getfloatByName_test_001', 0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getNumberByName('float_1');
            console.log('getfloatByName_test_001 ' + value);
            expect(value).assertEqual(48);
        })
        done();
    })

    console.log('*************end ResmgrTest*************');
})