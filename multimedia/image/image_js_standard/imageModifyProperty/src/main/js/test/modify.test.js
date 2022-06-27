/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image'
import fileio from '@ohos.fileio'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import {modifyBuf} from './modifyBuffer'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'

describe('Image', function () {
    var pathExifJpg = '/data/storage/el2/base/files/test_exif.jpg';
    beforeAll(async function () {
        await applyPermission();
        console.info('beforeAll case');
    })

    beforeEach(function () {
       
        console.info('beforeEach case');
    })

    afterEach(function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    async function applyPermission(){
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.image.ModifyProperty',0,100);
        let atManager = abilityAccessCtrl.createAtManager();
        if(atManager != null){
            let tokenID = appInfo.accessTokenId;
            console.info('[permission]case accessTokenId is' + tokenID);
            let permissionName1 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName2 = 'ohos.permission.READ_MEDIA';
            let permissionName3 = 'ohos.permission.WRITE_MEDIA';
            await atManager.grantUserGrantedPermission(tokenID,permissionName1).then((result)=>{
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err)=>{
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID,permissionName2).then((result)=>{
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err)=>{
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID,permissionName3).then((result)=>{
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err)=>{
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
        }else{
            console.info('[permission]case apply permission failed,createAtManager failed');
        }
    }

    async function modifyPromise(done, testNum, type, key, value, checkProps){
        let imageSourceApi;
        if (type == 'buffer') {
            const data = modifyBuf.buffer;
            imageSourceApi = image.createImageSource(data);
        } else {
            let fdExifJpg = fileio.openSync(pathExifJpg, 0o2 | 0o100, 0o777);
            imageSourceApi = image.createImageSource(fdExifJpg);
        }
        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty(key, value).then(() => {
                imageSourceApi.getImageProperty(key).then(data => {
                    console.info(`${testNum} ${key} ` + data);
                    checkProps(data);
                    done();
                }).catch((err) => {
                    console.info(`${testNum} getImageProperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err) => {
                console.info(`${testNum} modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    }
    
    async function modifyCb(done, testNum, type, key, value, checkProps){
        let imageSourceApi;
        if (type == 'buffer') {
            const data = modifyBuf.buffer;
            imageSourceApi = image.createImageSource(data);
        } else {
            let fdExifJpg = fileio.openSync(pathExifJpg, 0o2 | 0o100, 0o777);
            imageSourceApi = image.createImageSource(fdExifJpg);
        }
        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty(key, value, (error) => {
                if(error){
                    expect(false).assertTrue();
                    console.info(`${testNum} modify err: ` + error);
                }else{
                    imageSourceApi.getImageProperty(key, (error, data) => {
                        if(error){
                            expect(false).assertTrue();
                            console.info(`${testNum} get err: ` + error);
                        }else{
                            console.info(`${testNum} ${key}: `  + data);
                            checkProps(data);
                            done();
                        }
                       
                    })
                }
            })
        }
    }

    async function modifyCb1(done, testNum, type, key, value, checkProps){
        let imageSourceApi;
        if (type == 'buffer') {
            const data = modifyBuf.buffer;
            imageSourceApi = image.createImageSource(data);
        } else {
            let fdExifJpg = fileio.openSync(pathExifJpg, 0o2 | 0o100, 0o777);
            imageSourceApi = image.createImageSource(fdExifJpg);
        }
        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '1' }
            imageSourceApi.modifyImageProperty(key, value, property, (error) => {
                if(error){
                    expect(false).assertTrue();
                    console.info(`${testNum} modify err: ` + error);
                }else{
                    imageSourceApi.getImageProperty(key, (error, data) => {
                        if(error){
                            expect(false).assertTrue();
                            console.info(`${testNum} get err: ` + error);
                        }else{
                            console.info(`${testNum} ${key}: `  + data);
                            checkProps(data);
                            done();
                        }
                       
                    })
                }
            })
        }
    }
    
    async function modifyErrCb(done, testNum, type, key, value) {
        let imageSourceApi;
        if (type == 'buffer') {
            const data = modifyBuf.buffer;
            imageSourceApi = image.createImageSource(data);
        } else {
            let fdExifJpg = fileio.openSync(pathExifJpg, 0o2 | 0o100, 0o777);
            imageSourceApi = image.createImageSource(fdExifJpg);
        }
        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
                imageSourceApi.modifyImageProperty(key, value, (error) => {
                    expect(error.code != 0).assertTrue();
                    console.info(`${testNum} errormsg: ` + error)
                    done();
                })
            
        }
    }

    async function modifyErrCb1(done, testNum, type, key, value) {
        let imageSourceApi;
        if (type == 'buffer') {
            const data = modifyBuf.buffer;
            imageSourceApi = image.createImageSource(data);
        }else {
            let fdExifJpg = fileio.openSync(pathExifJpg, 0o2 | 0o100, 0o777);
            imageSourceApi = image.createImageSource(fdExifJpg);
        }
        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '1' }
                imageSourceApi.modifyImageProperty(key, value, property, (error) => {
                    expect(error.code != 0).assertTrue();
                    console.info(`${testNum} errormsg: ` + error)
                    done();
                })
        }
    }

    async function modifyImageErrPromise(done, testNum, type, key, value) {
        let imageSourceApi;
        try {
            if (type == 'buffer') {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                let fdExifJpg = fileio.openSync(pathExifJpg, 0o2 | 0o100, 0o777);
                imageSourceApi = image.createImageSource(fdExifJpg);
            }
        } catch (error) {
            expect(false).assertTrue();
            done();
        }

        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty(key, value)
            .then(() => {
                expect(false).assertTrue();
                done();
            }).catch((error) => {
                expect(error.code != 0).assertTrue();
                console.info(`${testNum} message: ` + error);
                done();
            })           
        }
    }

    /**
     * @tc.number    : modify_01_001
     * @tc.name      : modifyImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_001', 0, async function (done) {
        function checkProps(result){
            expect(result == 'Top-right').assertTrue();
        }
        modifyPromise(done, 'modify_01_001', 'buffer', "Orientation", "2", checkProps);
    }) 

    /**
     * @tc.number    : modify_01_002
     * @tc.name      : modifyImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_002', 0, async function (done) {
        function checkProps(result){
            expect(result.search("38") != -1).assertTrue();
        }
        modifyPromise(done, 'modify_01_002', 'buffer', "GPSLatitude", "114,3", checkProps);
    })

    /**
     * @tc.number    : modify_01_003
     * @tc.name      : modifyImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_003', 0, async function (done) {
        function checkProps(result){
            expect(result.search("9") != -1).assertTrue();
        }
        modifyPromise(done, 'modify_01_003', 'buffer', "GPSLongitude", "18,2", checkProps);
    })

    /**
     * @tc.number    : modify_01_004
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_004', 0, async function (done) {
        function checkProps(result){
            expect(result == 'N').assertTrue();
        }
        modifyPromise(done, 'modify_01_004', 'buffer', "GPSLatitudeRef", "N", checkProps);
    })

    /**
     * @tc.number    : modify_01_005
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_005', 0, async function (done) {
        function checkProps(result){
            expect(result == 'W').assertTrue();
        }
        modifyPromise(done, 'modify_01_005', 'buffer', "GPSLongitudeRef", "W", checkProps);
    })

    /**
     * @tc.number    : modify_01_006
     * @tc.name      : modifyImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_006', 0, async function (done) {
        function checkProps(result){
            expect(result == 'Top-right').assertTrue();
        }
        modifyPromise(done, 'modify_01_006', 'fd', "Orientation", "2", checkProps)
    })   

    /**
     * @tc.number    : modify_01_007
     * @tc.name      : modifyImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_007', 0, async function (done) {
        function checkProps(result){
            expect(result.search("38") != -1).assertTrue();
        }
        modifyPromise(done, 'modify_01_007', 'fd', "GPSLatitude", "114,3", checkProps);
    })

    /**
     * @tc.number    : modify_01_008
     * @tc.name      : modifyImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_008', 0, async function (done) {
        function checkProps(result){
            expect(result.search("9") != -1).assertTrue();
        }
        modifyPromise(done, 'modify_01_008', 'fd', "GPSLongitude", "18,2", checkProps);
    })

    /**
     * @tc.number    : modify_01_009
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_009', 0, async function (done) {
        function checkProps(result){
            expect(result == 'N').assertTrue();
        }
        modifyPromise(done, 'modify_01_009', 'fd', "GPSLatitudeRef", "N", checkProps);
    })

    /**
     * @tc.number    : modify_01_010
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_010', 0, async function (done) {
        function checkProps(result){
            expect(result == 'W').assertTrue();
        }
        modifyPromise(done, 'modify_01_010', 'fd', "GPSLongitudeRef", "W", checkProps);
    }) 
    
    /**
     * @tc.number    : modify_02_001
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_001', 0, async function (done) {
        function checkProps(result){
            expect(result == 'Top-right').assertTrue();
        }
        modifyCb(done, 'modify_02_001', 'buffer', "Orientation", "2", checkProps);
    })

    /**
     * @tc.number    : modify_02_002
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_002', 0, async function (done) {
        function checkProps(result){
            expect(result.search("38") != -1).assertTrue();
        }
        modifyCb(done, 'modify_02_002', 'buffer', "GPSLatitude", "114,3", checkProps);
    })

    /**
     * @tc.number    : modify_02_003
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_003', 0, async function (done) {
        function checkProps(result){
            expect(result.search("9") != -1).assertTrue();
        }
        modifyCb(done, 'modify_02_003', 'buffer', "GPSLongitude", "18,2", checkProps);
    })

    /**
     * @tc.number    : modify_02_004
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_004', 0, async function (done) {
        function checkProps(result){
            expect(result == "N").assertTrue();
        }
        modifyCb(done, 'modify_02_004', 'buffer', "GPSLatitudeRef", "N", checkProps);
    })

    /**
     * @tc.number    :modify_02_005
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_005', 0, async function (done) {
        function checkProps(result){
            expect(result == "W").assertTrue();
        }
        modifyCb(done, 'modify_02_005', 'buffer', "GPSLongitudeRef", "W", checkProps);
    })

    /**
     * @tc.number    : modify_02_006
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_006', 0, async function (done) {
        function checkProps(result){
            expect(result == 'Top-right').assertTrue();
        }
        modifyCb(done, 'modify_02_006', 'fd', "Orientation", "2", checkProps);
    })

    /**
     * @tc.number    : modify_02_007
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_007', 0, async function (done) {
        function checkProps(result){
            expect(result.search("38") != -1).assertTrue();
        }
        modifyCb(done, 'modify_02_007', 'fd', "GPSLatitude", "114,3", checkProps);
    })

    /**
     * @tc.number    : modify_02_008
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_008', 0, async function (done) {
        function checkProps(result){
            expect(result.search("9") != -1).assertTrue();
        }
        modifyCb(done, 'modify_02_008', 'fd', "GPSLongitude", "18,2", checkProps);
    })

    /**
     * @tc.number    : modify_02_009
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_009', 0, async function (done) {
        function checkProps(result){
            expect(result == "N").assertTrue();
        }
        modifyCb(done, 'modify_02_009', 'fd', "GPSLatitudeRef", "N", checkProps);
    })

    /**
     * @tc.number    : modify_02_010
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_010', 0, async function (done) {
        function checkProps(result){
            expect(result == "W").assertTrue();
        }
        modifyCb(done, 'modify_02_010', 'fd', "GPSLongitudeRef", "W", checkProps);
    })
   
    /**
     * @tc.number    : modify_03_001
     * @tc.name      : modifyImageProperty(Orientation,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_001', 0, async function (done) {
        function checkProps(result){
            expect(result == 'Top-right').assertTrue();
        }
        modifyCb1(done, 'modify_03_001', 'buffer', "Orientation", "2", checkProps);
    })

    /**
     * @tc.number    : modify_03_002
     * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_002', 0, async function (done) {
        function checkProps(result){
            expect(result.search("38") != -1).assertTrue();
        }
        modifyCb1(done, 'modify_03_002', 'buffer', "GPSLatitude", "114,3", checkProps);
    })

    /**
     * @tc.number    : modify_03_003
     * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_003', 0, async function (done) {
        function checkProps(result){
            expect(result.search("9") != -1).assertTrue();
        }
        modifyCb1(done, 'modify_03_003', 'buffer', "GPSLongitude", "18,2", checkProps);
    })

    /**
     * @tc.number    : modify_03_004
     * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_004', 0, async function (done) {
        function checkProps(result){
            expect(result == "N").assertTrue();
        }
        modifyCb1(done, 'modify_03_004', 'buffer', "GPSLatitudeRef", "N", checkProps);
    })

    /**
     * @tc.number    : modify_03_005
     * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_005', 0, async function (done) {
        function checkProps(result){
            expect(result == "W").assertTrue();
        }
        modifyCb1(done, 'modify_03_005', 'buffer', "GPSLongitudeRef", "W", checkProps);
    }) 

    /**
     * @tc.number    : modify_03_006
     * @tc.name      : modifyImageProperty(Orientation,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_006', 0, async function (done) {
        function checkProps(result){
            expect(result == 'Top-right').assertTrue();
        }
        modifyCb1(done, 'modify_03_006', 'fd', "Orientation", "2", checkProps);
    })

    /**
     * @tc.number    : modify_03_007
     * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_007', 0, async function (done) {
        function checkProps(result){
            expect(result.search("38") != -1).assertTrue();
        }
        modifyCb1(done, 'modify_03_007', 'fd', "GPSLatitude", "114,3", checkProps);
    })

    /**
     * @tc.number    : modify_03_008
     * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_008', 0, async function (done) {
        function checkProps(result){
            expect(result.search("9") != -1).assertTrue();
        }
        modifyCb1(done, 'modify_03_008', 'fd', "GPSLongitude", "18,2", checkProps);
    })

    /**
     * @tc.number    : modify_03_009
     * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_009', 0, async function (done) {
        function checkProps(result){
            expect(result == "N").assertTrue();
        }
        modifyCb1(done, 'modify_03_009', 'fd', "GPSLatitudeRef", "N", checkProps);
    })

    /**
     * @tc.number    : modify_03_010
     * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback 
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_010', 0, async function (done) {
        function checkProps(result){
            expect(result == "W").assertTrue();
        }
        modifyCb1(done, 'modify_03_010', 'fd', "GPSLongitudeRef", "W", checkProps);
    })

    /**
     * @tc.number    : modify_01_011
     * @tc.name      : modifyImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_011', 0, async function (done) {
        modifyImageErrPromise(done, 'modify_01_011', 'fd', "Orientation", "abcdef")
    })

    /**
     * @tc.number    : modify_01_012
     * @tc.name      : modifyImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_012', 0, async function (done) {
        modifyImageErrPromise(done, 'modify_01_012', 'fd', "GPSLatitude", "abc,3")
    })

    /**
     * @tc.number    : modify_01_013
     * @tc.name      : modifyImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_013', 0, async function (done) {
        modifyImageErrPromise(done, 'modify_01_013', 'fd', "GPSLongitude", "abc,2")
    })

    /**
     * @tc.number    : modify_01_014
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_014', 0, async function (done) {
        modifyImageErrPromise(done, 'modify_01_014', 'fd', "GPSLatitudeRef", "456")
    })

    /**
     * @tc.number    : modify_01_015
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_015', 0, async function (done) {
        modifyImageErrPromise(done, 'modify_01_015', 'fd', "GPSLongitudeRef", "1234")
    })

    /**
     * @tc.number    : modify_01_016
     * @tc.name      : modifyImageProperty()-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_016', 0, async function (done) {
        modifyImageErrPromise(done, "modify_01_016", "buffer", "Orientation", "abcdef")
    })

    /**
     * @tc.number    : modify_01_017
     * @tc.name      : modifyImageProperty()-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_017', 0, async function (done) {
        modifyImageErrPromise(done, "modify_01_017", "buffer", "GPSLatitude", "abc,3")
    })

    /**
     * @tc.number    : modify_01_018
     * @tc.name      : modifyImageProperty()-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_018', 0, async function (done) {
        modifyImageErrPromise(done, "modify_01_018", "buffer", "GPSLongitude", "abc,2")
    })

    /**
     * @tc.number    : modify_01_019
     * @tc.name      : modifyImageProperty()-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_019', 0, async function (done) {
        modifyImageErrPromise(done, "modify_01_019", "buffer", "GPSLatitudeRef", "456")
    })

    /**
     * @tc.number    : modify_01_020
     * @tc.name      : modifyImageProperty()-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_01_020', 0, async function (done) {
        modifyImageErrPromise(done, "modify_01_020", "buffer", "GPSLongitudeRef", "1234")
    })

    /**
     * @tc.number    : modify_02_011
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_011', 0, async function (done) {
        modifyErrCb(done, "modify_02_011", "fd", "Orientation", "abcdef")
    })

    /**
     * @tc.number    : modify_02_012
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_012', 0, async function (done) {
        modifyErrCb(done, "modify_02_012", "fd", "GPSLatitude", "abc,3")
    })

    /**
     * @tc.number    : modify_02_013
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_013', 0, async function (done) {
        modifyErrCb(done, "modify_02_013", "fd", "GPSLongitude", "abc,2")
    })

    /**
     * @tc.number    : modify_02_014
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_014', 0, async function (done) {
        modifyErrCb(done, "modify_02_014", "fd", "GPSLongitudeRef", "1234")
    })

    /**
     * @tc.number    : modify_02_015
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_015', 0, async function (done) {
        modifyErrCb(done, "modify_02_015", "fd", "GPSLatitudeRef", "456")
    })

    /**
     * @tc.number    : modify_02_016
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_016', 0, async function (done) {
        modifyErrCb(done, "modify_02_016", "buffer", "Orientation", "abcdef")
    })

    /**
     * @tc.number    : modify_02_017
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_017', 0, async function (done) {
        modifyErrCb(done, "modify_02_017", "buffer", "GPSLatitude", "abc,3")
    })

    /**
     * @tc.number    : modify_02_018
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_018', 0, async function (done) {
        modifyErrCb(done, "modify_02_018", "buffer", "GPSLongitude", "abc,2")
    })

    /**
     * @tc.number    : modify_02_019
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_019', 0, async function (done) {
        modifyErrCb(done, "modify_02_019", "buffer", "GPSLongitudeRef", "1234")
    })

    /**
     * @tc.number    : modify_02_020
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_02_020', 0, async function (done) {
        modifyErrCb(done, "modify_02_020", "buffer", "GPSLatitudeRef", "456")
    })
    
    /**
     * @tc.number    : modify_03_011
     * @tc.name      : modifyImageProperty()-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_011', 0, async function (done) {
        modifyErrCb1(done, "modify_03_011", "fd", "Orientation", "abcdef")
    })

    /**
     * @tc.number    : modify_03_012
     * @tc.name      : modifyImageProperty()-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_012', 0, async function (done) {
        modifyErrCb1(done, "modify_03_012", "fd", "GPSLatitude", "abc,3")
    })

    /**
     * @tc.number    : modify_03_013
     * @tc.name      : modifyImageProperty()-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_013', 0, async function (done) {
        modifyErrCb1(done, "modify_03_013", "fd", "GPSLongitude", "abc,2")
    })

    /**
     * @tc.number    : modify_03_014
     * @tc.name      : modifyImageProperty()-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_014', 0, async function (done) {
        modifyErrCb1(done, "modify_03_014", "fd", "GPSLatitudeRef", "1234")
    })

    /**
     * @tc.number    : modify_03_015
     * @tc.name      : modifyImageProperty()-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_015', 0, async function (done) {
        modifyErrCb1(done, "modify_03_015", "fd", "GPSLongitudeRef", "567")
    })

    /**
     * @tc.number    : modify_03_016
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_016', 0, async function (done) {
        modifyErrCb1(done, "modify_03_016", "buffer", "Orientation", "abcef")
    })

    /**
     * @tc.number    : modify_03_017
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_017', 0, async function (done) {
        modifyErrCb1(done, "modify_03_017", "buffer", "GPSLatitude", "abc,3")
    })

    /**
     * @tc.number    : modify_03_018
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_018', 0, async function (done) {
        modifyErrCb1(done, "modify_03_018", "buffer", "GPSLongitude", "abc,2")
    })

    /**
     * @tc.number    : modify_03_019
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_019', 0, async function (done) {
        modifyErrCb1(done, "modify_03_019", "buffer", "GPSLatitudeRef", "456")
    })

    /**
     * @tc.number    : modify_03_020
     * @tc.name      : modifyImageProperty-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('modify_03_020', 0, async function (done) {
        modifyErrCb1(done, "modify_03_020", "buffer", "GPSLongitudeRef", "1234")
    })
})